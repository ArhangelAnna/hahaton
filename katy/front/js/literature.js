function LiteratureList({ literature, setLiterature }) {
    const [newSource, setNewSource] = useState('');

    const handleAddSource = () => {
        if (newSource.trim()) {
            setLiterature([...literature, newSource.trim()]);
            setNewSource('');
        }
    };

    const handleRemoveSource = (index) => {
        const updated = [...literature];
        updated.splice(index, 1);
        setLiterature(updated);
    };

    return (
        <div className="card mt-3">
            <div className="card-header bg-light">
                <h6 className="mb-0"><i className="bi bi-book me-2"></i>Список литературы</h6>
            </div>
            <div className="card-body">
                <div className="mb-3">
                    <div className="input-group">
                        <input
                            type="text"
                            className="form-control"
                            value={newSource}
                            onChange={(e) => setNewSource(e.target.value)}
                            placeholder="Добавьте источник (книга, статья и т.д.)"
                        />
                        <button 
                            className="btn btn-primary" 
                            type="button"
                            onClick={handleAddSource}
                        >
                            <i className="bi bi-plus"></i> Добавить
                        </button>
                    </div>
                </div>
                
                {literature.length > 0 ? (
                    <ul className="list-group">
                        {literature.map((source, index) => (
                            <li key={index} className="list-group-item literature-item">
                                {source}
                                <button
                                    className="btn btn-sm btn-outline-danger remove-literature"
                                    onClick={() => handleRemoveSource(index)}
                                >
                                    <i className="bi bi-trash"></i>
                                </button>
                            </li>
                        ))}
                    </ul>
                ) : (
                    <p className="text-muted">Нет добавленных источников</p>
                )}
            </div>
        </div>
    );
}
