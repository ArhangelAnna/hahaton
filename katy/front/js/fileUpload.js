function FileUploadArea({ onFileSelect, onFileClear, fileName }) {
    const fileInputRef = useRef();
    const [isDragging, setIsDragging] = useState(false);

    const handleClick = () => fileInputRef.current.click();
    
    const handleChange = (e) => {
        if (e.target.files[0]) {
            onFileSelect(e.target.files[0]);
        }
    };

    const handleDragOver = (e) => {
        e.preventDefault();
        setIsDragging(true);
    };

    const handleDragLeave = () => setIsDragging(false);

    const handleDrop = (e) => {
        e.preventDefault();
        setIsDragging(false);
        if (e.dataTransfer.files[0]) {
            onFileSelect(e.dataTransfer.files[0]);
        }
    };

    return (
        <div 
            className={`upload-area mb-4 ${isDragging ? 'border-primary bg-light' : ''}`}
            onClick={handleClick}
            onDragOver={handleDragOver}
            onDragLeave={handleDragLeave}
            onDrop={handleDrop}
        >
            <input 
                type="file" 
                ref={fileInputRef}
                className="d-none" 
                accept=".docx,.txt,.odt"
                onChange={handleChange}
            />
            <div className="preview-icon mb-3">
                <i className={`bi ${fileName ? 'bi-file-earmark-text' : 'bi-cloud-arrow-up'}`}></i>
            </div>
            <h5 className="mb-2">Перетащите файл сюда или нажмите для выбора</h5>
            <p className="text-muted small">Поддерживаемые форматы: .docx, .txt, .odt</p>
            {fileName && (
                <div className="file-info">
                    <span className="badge bg-info">{fileName}</span>
                    <button 
                        className="btn btn-sm btn-outline-danger ms-2" 
                        onClick={(e) => {
                            e.stopPropagation();
                            onFileClear();
                        }}
                    >
                        <i className="bi bi-x"></i>
                    </button>
                </div>
            )}
        </div>
    );
}