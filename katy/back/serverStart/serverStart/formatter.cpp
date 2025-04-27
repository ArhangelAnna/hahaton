#include "formatter.h"
#include <fstream>
#include <sstream>
#include <iostream>
#include <vector>
#include <tinyxml2.h>
#include <mz.h>          // Базовые определения
#include <mz_os.h>       // Функции ОС
#include <mz_strm.h>      // Потоки
#include <mz_zip.h>       // ZIP-архивы
#include <mz_zip_rw.h>    // Чтение/запись ZIP

using namespace std;
using namespace tinyxml2;


struct DocxFile {
    string path;
    vector<char> data;
};

// Константы форматирования
const int LEFT_MARGIN = 1701;    // 30 мм
const int RIGHT_MARGIN = 567;    // 10 мм
const int TOP_MARGIN = 1134;     // 20 мм
const int BOTTOM_MARGIN = 1134;  // 20 мм
const int LINE_SPACING = 360;    // 1.5 строки (360 twips)
const int TABLE_FONT_SIZE = 24;  // 12pt (24 twips)

// Установка полей страницы
void SetPageMargins(XMLDocument& doc) {
    XMLElement* body = doc.FirstChildElement("w:document")->FirstChildElement("w:body");
    if (!body) return;

    XMLElement* sectPr = body->FirstChildElement("w:sectPr");
    if (!sectPr) {
        sectPr = doc.NewElement("w:sectPr");
        body->InsertEndChild(sectPr);
    }

    XMLElement* pgMar = sectPr->FirstChildElement("w:pgMar");
    if (!pgMar) {
        pgMar = doc.NewElement("w:pgMar");
        sectPr->InsertFirstChild(pgMar);
    }

    pgMar->SetAttribute("w:left", LEFT_MARGIN);
    pgMar->SetAttribute("w:right", RIGHT_MARGIN);
    pgMar->SetAttribute("w:top", TOP_MARGIN);
    pgMar->SetAttribute("w:bottom", BOTTOM_MARGIN);
}

// Установка межстрочного интервала для абзаца
void SetParagraphSpacing(XMLElement* pPr, XMLDocument& doc) {
    if (!pPr) return;

    XMLElement* spacing = pPr->FirstChildElement("w:spacing");
    if (!spacing) {
        spacing = doc.NewElement("w:spacing");
        pPr->InsertEndChild(spacing);
    }
    spacing->SetAttribute("w:line", LINE_SPACING);
    spacing->SetAttribute("w:lineRule", "auto");
}

// Форматирование текста в таблицах (шрифт 12pt)
void FormatTables(XMLDocument& doc) {
    XMLElement* body = doc.FirstChildElement("w:document")->FirstChildElement("w:body");
    if (!body) return;

    // Ищем все таблицы в документе
    for (XMLElement* tbl = body->FirstChildElement("w:tbl"); tbl; tbl = tbl->NextSiblingElement("w:tbl")) {
        // Обрабатываем все строки в таблице
        for (XMLElement* row = tbl->FirstChildElement("w:tr"); row; row = row->NextSiblingElement("w:tr")) {
            // Обрабатываем все ячейки в строке
            for (XMLElement* cell = row->FirstChildElement("w:tc"); cell; cell = cell->NextSiblingElement("w:tc")) {
                // Обрабатываем все абзацы в ячейке
                for (XMLElement* p = cell->FirstChildElement("w:p"); p; p = p->NextSiblingElement("w:p")) {
                    // Обрабатываем все текстовые элементы в абзаце
                    for (XMLElement* r = p->FirstChildElement("w:r"); r; r = r->NextSiblingElement("w:r")) {
                        XMLElement* rPr = r->FirstChildElement("w:rPr");
                        if (!rPr) {
                            rPr = doc.NewElement("w:rPr");
                            r->InsertFirstChild(rPr);
                        }

                        // Устанавливаем размер шрифта 12pt (24 twips)
                        XMLElement* sz = rPr->FirstChildElement("w:sz");
                        if (!sz) {
                            sz = doc.NewElement("w:sz");
                            rPr->InsertEndChild(sz);
                        }
                        sz->SetAttribute("w:val", "24");

                        XMLElement* szCs = rPr->FirstChildElement("w:szCs");
                        if (!szCs) {
                            szCs = doc.NewElement("w:szCs");
                            rPr->InsertEndChild(szCs);
                        }
                        szCs->SetAttribute("w:val", "24");

                        // Удаляем жирное выделение и цвет
                        if (rPr->FirstChildElement("w:b")) {
                            rPr->DeleteChild(rPr->FirstChildElement("w:b"));
                        }
                        if (rPr->FirstChildElement("w:bCs")) {
                            rPr->DeleteChild(rPr->FirstChildElement("w:bCs"));
                        }
                        if (rPr->FirstChildElement("w:color")) {
                            rPr->DeleteChild(rPr->FirstChildElement("w:color"));
                        }
                    }

                    // Устанавливаем выравнивание по ширине для абзацев в таблице
                    XMLElement* pPr = p->FirstChildElement("w:pPr");
                    if (!pPr) {
                        pPr = doc.NewElement("w:pPr");
                        p->InsertFirstChild(pPr);
                    }

                    XMLElement* jc = pPr->FirstChildElement("w:jc");
                    if (!jc) {
                        jc = doc.NewElement("w:jc");
                        pPr->InsertEndChild(jc);
                    }
                    jc->SetAttribute("w:val", "both");

                    // Устанавливаем интервал для абзацев в таблице
                    SetParagraphSpacing(pPr, doc);
                }
            }
        }
    }
}
// Выравнивание текста по ширине и очистка форматирования
void FormatParagraphs(XMLDocument& doc) {
    XMLElement* body = doc.FirstChildElement("w:document")->FirstChildElement("w:body");
    if (!body) return;

    for (XMLElement* p = body->FirstChildElement("w:p"); p; p = p->NextSiblingElement("w:p")) {
        // Пропускаем абзацы внутри таблиц (они обрабатываются отдельно)
        if (p->Parent() && p->Parent()->ToElement() &&
            strcmp(p->Parent()->ToElement()->Name(), "w:tbl") == 0) {
            continue;
        }

        XMLElement* pPr = p->FirstChildElement("w:pPr");
        if (!pPr) {
            pPr = doc.NewElement("w:pPr");
            p->InsertFirstChild(pPr);
        }

        // Устанавливаем интервал для ВСЕХ абзацев
        SetParagraphSpacing(pPr, doc);

        // Пропускаем заголовки (стили Heading1-Heading6)
        bool isHeading = false;
        XMLElement* pStyle = pPr->FirstChildElement("w:pStyle");
        if (pStyle) {
            const char* val = pStyle->Attribute("w:val");
            if (val && string(val).find("Heading") != string::npos) {
                isHeading = true;
            }
        }

        // Пропускаем приложения
        bool isAppendix = false;
        XMLElement* r = p->FirstChildElement("w:r");
        if (r) {
            XMLElement* t = r->FirstChildElement("w:t");
            if (t) {
                const char* text = t->GetText();
                if (text && string(text).find("Приложение") != string::npos) {
                    isAppendix = true;
                }
            }
        }

        if (!isHeading && !isAppendix) {
            // Устанавливаем выравнивание по ширине
            XMLElement* jc = pPr->FirstChildElement("w:jc");
            if (!jc) {
                jc = doc.NewElement("w:jc");
                pPr->InsertEndChild(jc);
            }
            jc->SetAttribute("w:val", "both");

            // Удаляем жирное выделение и цвет
            for (XMLElement* r = p->FirstChildElement("w:r"); r; r = r->NextSiblingElement("w:r")) {
                XMLElement* rPr = r->FirstChildElement("w:rPr");
                if (rPr) {
                    // Удаляем жирное выделение
                    if (rPr->FirstChildElement("w:b")) {
                        rPr->DeleteChild(rPr->FirstChildElement("w:b"));
                    }
                    if (rPr->FirstChildElement("w:bCs")) {
                        rPr->DeleteChild(rPr->FirstChildElement("w:bCs"));
                    }

                    // Удаляем цвет текста
                    if (rPr->FirstChildElement("w:color")) {
                        rPr->DeleteChild(rPr->FirstChildElement("w:color"));
                    }
                }
            }
        }
    }
}

// Создание нумерации страниц
void CreatePageNumbers(XMLDocument& doc) {
    XMLElement* footer = doc.NewElement("w:ftr");
    footer->SetAttribute("xmlns:w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");

    XMLElement* p = doc.NewElement("w:p");

    // Настройки абзаца
    XMLElement* pPr = doc.NewElement("w:pPr");

    // Устанавливаем интервал для колонтитула
    SetParagraphSpacing(pPr, doc);

    // Выравнивание по центру
    XMLElement* jc = doc.NewElement("w:jc");
    jc->SetAttribute("w:val", "center");
    pPr->InsertEndChild(jc);

    p->InsertFirstChild(pPr);

    // Номер страницы
    XMLElement* r = doc.NewElement("w:r");
    XMLElement* fldChar = doc.NewElement("w:fldChar");
    fldChar->SetAttribute("w:fldCharType", "begin");
    r->InsertEndChild(fldChar);
    p->InsertEndChild(r);

    r = doc.NewElement("w:r");
    fldChar = doc.NewElement("w:fldChar");
    fldChar->SetAttribute("w:fldCharType", "separate");
    r->InsertEndChild(fldChar);
    p->InsertEndChild(r);

    r = doc.NewElement("w:r");
    XMLElement* instrText = doc.NewElement("w:instrText");
    instrText->SetAttribute("xml:space", "preserve");
    XMLText* text = doc.NewText(" PAGE ");
    instrText->InsertEndChild(text);
    r->InsertEndChild(instrText);
    p->InsertEndChild(r);

    r = doc.NewElement("w:r");
    fldChar = doc.NewElement("w:fldChar");
    fldChar->SetAttribute("w:fldCharType", "end");
    r->InsertEndChild(fldChar);
    p->InsertEndChild(r);

    footer->InsertEndChild(p);
    doc.InsertEndChild(footer);
}

// Настройка стилей документа
// Настройка стилей документа
void SetDocumentStyles(XMLDocument& doc) {
    XMLElement* styles = doc.FirstChildElement("w:styles");
    if (!styles) return;

    // 1. Настройка стиля Normal (основной стиль документа)
    XMLElement* styleNormal = nullptr;
    for (XMLElement* style = styles->FirstChildElement("w:style"); style; style = style->NextSiblingElement("w:style")) {
        const char* styleId = style->Attribute("w:styleId");
        if (styleId && strcmp(styleId, "Normal") == 0) {
            styleNormal = style;
            break;
        }
    }

    if (!styleNormal) {
        styleNormal = doc.NewElement("w:style");
        styleNormal->SetAttribute("w:type", "paragraph");
        styleNormal->SetAttribute("w:styleId", "Normal");
        styleNormal->SetAttribute("w:default", "1");
        styles->InsertEndChild(styleNormal);
    }

    // Настройки абзаца для Normal
    XMLElement* pPr = styleNormal->FirstChildElement("w:pPr");
    if (!pPr) {
        pPr = doc.NewElement("w:pPr");
        styleNormal->InsertEndChild(pPr);
    }

    // Устанавливаем интервал для стиля Normal
    SetParagraphSpacing(pPr, doc);

    // Выравнивание по ширине
    XMLElement* jc = pPr->FirstChildElement("w:jc");
    if (!jc) {
        jc = doc.NewElement("w:jc");
        pPr->InsertEndChild(jc);
    }
    jc->SetAttribute("w:val", "both");

    // Настройки шрифта для Normal
    XMLElement* rPr = styleNormal->FirstChildElement("w:rPr");
    if (!rPr) {
        rPr = doc.NewElement("w:rPr");
        styleNormal->InsertEndChild(rPr);
    }

    XMLElement* rFonts = rPr->FirstChildElement("w:rFonts");
    if (!rFonts) {
        rFonts = doc.NewElement("w:rFonts");
        rPr->InsertFirstChild(rFonts);
    }
    rFonts->SetAttribute("w:ascii", "Times New Roman");
    rFonts->SetAttribute("w:hAnsi", "Times New Roman");

    XMLElement* sz = rPr->FirstChildElement("w:sz");
    if (!sz) {
        sz = doc.NewElement("w:sz");
        rPr->InsertEndChild(sz);
    }
    sz->SetAttribute("w:val", "28"); // 14pt

    // Удаляем жирное выделение в стиле Normal
    if (rPr->FirstChildElement("w:b")) {
        rPr->DeleteChild(rPr->FirstChildElement("w:b"));
    }
    if (rPr->FirstChildElement("w:bCs")) {
        rPr->DeleteChild(rPr->FirstChildElement("w:bCs"));
    }

    // Удаляем цвет текста в стиле Normal
    if (rPr->FirstChildElement("w:color")) {
        rPr->DeleteChild(rPr->FirstChildElement("w:color"));
    }

    // 2. Настройка стилей таблиц
    for (XMLElement* style = styles->FirstChildElement("w:style"); style; style = style->NextSiblingElement("w:style")) {
        const char* type = style->Attribute("w:type");
        if (!type) continue;

        // Обрабатываем стили таблиц и ячеек
        if (strcmp(type, "table") == 0 || strcmp(type, "tableCell") == 0) {
            // Настройки форматирования текста
            XMLElement* rPr = style->FirstChildElement("w:rPr");
            if (!rPr) {
                rPr = doc.NewElement("w:rPr");
                style->InsertFirstChild(rPr);
            }

            // Размер шрифта 12pt (24 twips)
            XMLElement* sz = rPr->FirstChildElement("w:sz");
            if (!sz) {
                sz = doc.NewElement("w:sz");
                rPr->InsertEndChild(sz);
            }
            sz->SetAttribute("w:val", "24");

            XMLElement* szCs = rPr->FirstChildElement("w:szCs");
            if (!szCs) {
                szCs = doc.NewElement("w:szCs");
                rPr->InsertEndChild(szCs);
            }
            szCs->SetAttribute("w:val", "24");

            // Удаляем жирное выделение
            if (rPr->FirstChildElement("w:b")) {
                rPr->DeleteChild(rPr->FirstChildElement("w:b"));
            }
            if (rPr->FirstChildElement("w:bCs")) {
                rPr->DeleteChild(rPr->FirstChildElement("w:bCs"));
            }

            // Удаляем цвет текста
            if (rPr->FirstChildElement("w:color")) {
                rPr->DeleteChild(rPr->FirstChildElement("w:color"));
            }
        }

        // Для стилей абзацев, которые могут использоваться в таблицах
        if (strcmp(type, "paragraph") == 0) {
            const char* styleId = style->Attribute("w:styleId");
            if (styleId && (strstr(styleId, "Table") != nullptr || strstr(styleId, "table") != nullptr)) {
                XMLElement* rPr = style->FirstChildElement("w:rPr");
                if (!rPr) {
                    rPr = doc.NewElement("w:rPr");
                    style->InsertFirstChild(rPr);
                }

                // Устанавливаем размер шрифта 12pt
                XMLElement* sz = rPr->FirstChildElement("w:sz");
                if (!sz) {
                    sz = doc.NewElement("w:sz");
                    rPr->InsertEndChild(sz);
                }
                sz->SetAttribute("w:val", "24");

                XMLElement* szCs = rPr->FirstChildElement("w:szCs");
                if (!szCs) {
                    szCs = doc.NewElement("w:szCs");
                    rPr->InsertEndChild(szCs);
                }
                szCs->SetAttribute("w:val", "24");
            }
        }
    }

    // 3. Настройка стилей для заголовков таблиц (если есть)
    const char* tableStyleNames[] = { "Table Grid", "Table Normal", "Table", "Light Shading", "Medium Shading" };
    for (const char* styleName : tableStyleNames) {
        for (XMLElement* style = styles->FirstChildElement("w:style"); style; style = style->NextSiblingElement("w:style")) {
            const char* nameAttr = style->Attribute("w:name");
            if (nameAttr && strcmp(nameAttr, styleName) == 0) {
                XMLElement* rPr = style->FirstChildElement("w:rPr");
                if (!rPr) {
                    rPr = doc.NewElement("w:rPr");
                    style->InsertFirstChild(rPr);
                }

                // Устанавливаем размер шрифта 12pt
                XMLElement* sz = rPr->FirstChildElement("w:sz");
                if (!sz) {
                    sz = doc.NewElement("w:sz");
                    rPr->InsertEndChild(sz);
                }
                sz->SetAttribute("w:val", "24");

                XMLElement* szCs = rPr->FirstChildElement("w:szCs");
                if (!szCs) {
                    szCs = doc.NewElement("w:szCs");
                    rPr->InsertEndChild(szCs);
                }
                szCs->SetAttribute("w:val", "24");
                break;
            }
        }
    }
}
// Обработка XML-файлов
string ProcessXml(const vector<char>& xmlData, const string& filename) {
    XMLDocument doc;
    if (doc.Parse(xmlData.data(), xmlData.size()) != XML_SUCCESS) {
        cerr << "Ошибка парсинга: " << filename << endl;
        return "";
    }

    if (filename == "word/styles.xml") {
        SetDocumentStyles(doc);
    }
    else if (filename == "word/document.xml") {
        SetPageMargins(doc);
        FormatParagraphs(doc);
        FormatTables(doc); // Добавлена обработка таблиц
    }
    else if (filename == "word/footer1.xml") {
        CreatePageNumbers(doc);
    }

    XMLPrinter printer(nullptr, true); // Включаем компактный режим без лишних переводов строк
    doc.Print(&printer);

    std::string xmlContent = printer.CStr();
    return xmlContent;
}

// Распаковка DOCX
vector<DocxFile> UnzipDocx(const string& filename) {
    vector<DocxFile> files;
    int32_t err = MZ_OK;
    
    // Создаём объект для чтения ZIP (без аргументов!)
    void *reader = mz_zip_reader_create();
    if (!reader) {
        cerr << "Ошибка создания ZIP-ридера" << endl;
        return files;
    }
    
    // Открываем архив
    err = mz_zip_reader_open_file(reader, filename.c_str());
    if (err != MZ_OK) {
        cerr << "Ошибка открытия файла: " << filename << endl;
        mz_zip_reader_delete(&reader);
        return files;
    }

    // Переходим к первому файлу в архиве
    err = mz_zip_reader_goto_first_entry(reader);
    if (err != MZ_OK) {
        cerr << "Архив пуст или повреждён" << endl;
        mz_zip_reader_delete(&reader);
        return files;
    }

    // Читаем все файлы
    do {
        mz_zip_file *file_info = NULL;
        err = mz_zip_reader_entry_get_info(reader, &file_info);
        if (err != MZ_OK) {
            cerr << "Ошибка чтения информации о файле" << endl;
            continue;
        }

        // Подготавливаем структуру для хранения данных
        DocxFile file;
        file.path = file_info->filename;
        file.data.resize(file_info->uncompressed_size);

        // Читаем содержимое файла
        err = mz_zip_reader_entry_read(reader, file.data.data(), file.data.size());
        if (err < 0) {
            cerr << "Ошибка чтения файла: " << file.path << endl;
            continue;
        }

        files.push_back(file);
    } while (mz_zip_reader_goto_next_entry(reader) == MZ_OK);

    // Закрываем и освобождаем ресурсы
    mz_zip_reader_close(reader);
    mz_zip_reader_delete(&reader);
    
    return files;
}
// Упаковка DOCX
bool ZipDocx(const vector<DocxFile>& files, const string& filename) {
    int32_t err = MZ_OK;
    
    // Создаём объект для записи ZIP
    void *writer = mz_zip_writer_create();
    if (!writer) {
        cerr << "Ошибка создания ZIP-райтера" << endl;
        return false;
    }
    
    // Открываем архив для записи
    err = mz_zip_writer_open_file(writer, filename.c_str(), 0, 1);
    if (err != MZ_OK) {
        cerr << "Ошибка создания архива: " << filename << endl;
        mz_zip_writer_delete(&writer);
        return false;
    }

    // Добавляем файлы в архив
    for (const auto& file : files) {
        mz_zip_file file_info = {};
        file_info.filename = file.path.c_str();
        file_info.compression_method = MZ_COMPRESS_METHOD_DEFLATE;
        file_info.zip64 = MZ_ZIP64_AUTO;

        // Явное приведение типа к void*
        err = mz_zip_writer_add_buffer(writer, 
                                     const_cast<void*>(static_cast<const void*>(file.data.data())),
                                     file.data.size(), 
                                     &file_info);
        if (err != MZ_OK) {
            cerr << "Ошибка добавления файла: " << file.path << endl;
            continue;
        }
    }

    // Закрываем архив
    mz_zip_writer_close(writer);
    mz_zip_writer_delete(&writer);
    
    return true;
}

string format_document(const string& docx_data, const nlohmann::json& metadata) {
    string inputPath = "temp_input.docx";
    string outputPath = "temp_output.docx";
    ofstream out(inputPath, ios::binary);
    out.write(docx_data.c_str(), docx_data.size());
    out.close();

    vector<DocxFile> files = UnzipDocx(inputPath);
    if (files.empty()) {
        throw runtime_error("Не удалось распаковать документ");
    }

    bool hasFooter = false;
    for (auto& file : files)
        if (file.path == "word/footer1.xml")
            hasFooter = true;

    if (!hasFooter) {
        DocxFile footer;
        footer.path = "word/footer1.xml";
        string content = R"(<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:ftr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"></w:ftr>)";
        footer.data.assign(content.begin(), content.end());
        files.push_back(footer);
    }

    for (auto& file : files) {
        string newContent = ProcessXml(file.data, file.path);
        if (!newContent.empty()) {
            file.data = vector<char>(newContent.begin(), newContent.end());
        }
    }

    if (!ZipDocx(files, outputPath)) {
        throw runtime_error("Ошибка упаковки документа");
    }

    ifstream in(outputPath, ios::binary);
    ostringstream ss;
    ss << in.rdbuf();
    in.close();
    return ss.str();
}
