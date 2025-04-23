#pragma once
#include <string>
#include <vector>
#include "include/json.hpp"

std::string format_document(const std::string& docx_data, const nlohmann::json& metadata);
