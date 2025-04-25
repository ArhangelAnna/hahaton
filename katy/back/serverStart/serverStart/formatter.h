#pragma once
#include <string>
#include <vector>
#include "libs/json/single_include/nlohmann/json.hpp"

std::string format_document(const std::string& docx_data, const nlohmann::json& metadata);
