#include <iostream>
#include <fstream>
#include "include/json.hpp"
#include "include/httplib.h"

using json = nlohmann::json;
using namespace httplib;

std::string format_document(const std::string& file_content, const json& metadata) {
    return "Форматированный документ";
}

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
        std::cout << "Received POST to /format\n";

        if (!req.has_file("document") || !req.has_file("metadata")) {
            std::cout << "Missing files in request\n";
            res.status = 400;
            res.set_content("Неверный формат запроса", "text/plain");
            return;
        }

        try {
            auto file = req.get_file_value("document");
            auto metadata_json = req.get_file_value("metadata");

            std::cout << "File size: " << file.content.length() << " bytes\n";
            std::cout << "Metadata: " << metadata_json.content << "\n";

            json metadata = json::parse(metadata_json.content);
            std::string result = format_document(file.content, metadata);

            res.set_content(result, "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            res.set_header("Content-Disposition", "attachment; filename=formatted.docx");

        }
        catch (const std::exception& e) {
            std::cerr << "Error: " << e.what() << "\n";
            res.status = 500;
            res.set_content("Ошибка обработки: " + std::string(e.what()), "text/plain");
        }
        });

    svr.set_base_dir("./front"); // Папка, где хранятся ваши HTML файлы

    std::cout << "Сервер запущен на http://localhost:8080\n";
    if (!svr.listen("0.0.0.0", 8080)) {
        std::cerr << "Не удалось запустить сервер!\n";
        return 1;
    }
    return 0;
}