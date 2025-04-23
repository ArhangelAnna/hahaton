#include <iostream>
#include <fstream>
#include "include/json.hpp"
#include "include/httplib.h"
#include "formatter.h"

using json = nlohmann::json;
using namespace httplib;
using namespace std;



int main() {
    Server svr;

    // Включить CORS
    svr.set_default_headers({
        {"Access-Control-Allow-Origin", "*"},
        {"Access-Control-Allow-Methods", "POST, GET, OPTIONS"},
        {"Access-Control-Allow-Headers", "Content-Type"}
        });

    svr.Options("/format", [](const Request&, Response& res) {
        res.status = 200;
        });

    svr.Post("/format", [](const Request& req, Response& res) {
        cout << "Received POST to /format\n";

        if (!req.has_file("document") || !req.has_file("metadata")) {
            cout << "Missing files in request\n";
            res.status = 400;
            res.set_content("Неверный формат запроса", "text/plain");
            return;
        }

        try {
            auto file = req.get_file_value("document");
            auto metadata_json = req.get_file_value("metadata");

            cout << "File size: " << file.content.length() << " bytes\n";
            cout << "Metadata: " << metadata_json.content << "\n";

            json metadata = json::parse(metadata_json.content);
            string result = format_document(file.content, metadata);

            res.set_content(result, "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            res.set_header("Content-Disposition", "attachment; filename=formatted.docx");

        }
        catch (const exception& e) {
            cerr << "Error: " << e.what() << "\n";
            res.status = 500;
            res.set_content("Ошибка обработки: " + string(e.what()), "text/plain");
        }
        });

    svr.set_base_dir("./front"); // Папка, где хранятся ваши HTML файлы

    cout << "Сервер запущен на http://localhost:8080\n";
    if (!svr.listen("0.0.0.0", 8080)) {
        cerr << "Не удалось запустить сервер!\n";
        return 1;
    }
    return 0;
}