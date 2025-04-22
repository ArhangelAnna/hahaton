#include "../../Aspose.Words.Cpp_25.3/Aspose.Words.Cpp/include/Aspose.Words.Cpp/Document.h"
#include "../../Aspose.Words.Cpp_25.3/Aspose.Words.Cpp/include/Aspose.Words.Cpp/SaveFormat.h"


using namespace Aspose::Words;

int main() {
    // Загрузка документа
    System::SharedPtr<Document> doc = System::MakeObject<Document>(u"example.docx");

    // Сохранение в другом формате
    doc->Save(u"output.pdf", SaveFormat::Pdf);

    return 0;
}
