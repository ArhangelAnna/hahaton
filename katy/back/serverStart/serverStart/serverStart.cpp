#include <iostream>
#include <fstream>
#include "libs/json/single_include/nlohmann/json.hpp"
#include <httplib.h>
#include "formatter.h"
#include <filesystem>

using namespace std::filesystem;
using json = nlohmann::json;
using namespace httplib;
using namespace std;

// Функция для проверки, является ли файл валидным .docx (ZIP архивом)
bool is_valid_docx(const string& data) {
    // .docx файлы начинаются с PK\x03\x04 (сигнатура ZIP)
    return data.size() >= 4 &&
           data[0] == 'P' && data[1] == 'K' &&
           data[2] == '\x03' && data[3] == '\x04';
}

int main() {
    Server svr;
    setlocale(LC_ALL, "ru_RU.UTF-8");

    // Настройка CORS (более полная версия)
    svr.set_default_headers({
        {"Access-Control-Allow-Origin", "*"},
        {"Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE"},
        {"Access-Control-Allow-Headers", "Content-Type, Authorization, X-Requested-With"},
        {"Access-Control-Max-Age", "86400"}
    });

    // Обработка OPTIONS для всех путей
    svr.Options(".*", [](const Request&, Response& res) {
        res.status = 200;
    });

    svr.Post("/format", [](const Request& req, Response& res) {
        cout << "Received POST to /format\n";

        try {
            // Проверка наличия файлов
            if (!req.has_file("document") || !req.has_file("metadata")) {
                throw runtime_error("Missing required files in request");
            }

            auto file = req.get_file_value("document");
            auto metadata_json = req.get_file_value("metadata");

            // Логирование информации о файле
            cout << "Received document file, size: " << file.content.length() << " bytes\n";
            cout << "Metadata content: " << metadata_json.content << "\n";

            // Проверка валидности файла
            if (file.content.empty()) {
                throw runtime_error("Empty document file received");
            }

            if (!is_valid_docx(file.content)) {
                throw runtime_error("Invalid .docx file format (not a valid ZIP archive)");
            }

            // Парсинг метаданных
            json metadata;
            try {
                metadata = json::parse(metadata_json.content);
            } catch (const json::exception& e) {
                throw runtime_error("Invalid metadata JSON: " + string(e.what()));
            }

            // Обработка документа
            string result = format_document(file.content, metadata);

            // Установка заголовков ответа
            res.set_header("Content-Type", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            res.set_header("Content-Disposition", "attachment; filename=formatted.docx");
            res.set_content(result, "application/vnd.openxmlformats-officedocument.wordprocessingml.document");

        } catch (const exception& e) {
            cerr << "Processing error: " << e.what() << "\n";
            res.status = 500;
            res.set_content("Ошибка обработки: " + string(e.what()), "text/plain; charset=utf-8");
        }
    });

    // Проверка и настройка статической директории
    path front_dir = "./front";
    if (!exists(front_dir)) {
        cerr << "Warning: Frontend directory '" << front_dir << "' not found!\n";
        cerr << "Static files will not be served.\n";
    } else {
        svr.set_base_dir(front_dir.string());
        cout << "Serving static files from: " << absolute(front_dir) << "\n";
    }

    // Запуск сервера
    cout << "Starting server on http://localhost:8080\n";
    cout << "Press Ctrl+C to stop the server\n";

    if (!svr.listen("0.0.0.0", 8080)) {
        cerr << "Failed to start server!\n";
        return 1;
    }
    return 0;
}