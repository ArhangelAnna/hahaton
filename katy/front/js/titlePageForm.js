function TitlePageForm({ formData, onFormChange }) {
    const handleChange = (e) => {
        onFormChange({
            ...formData,
            [e.target.id]: e.target.value
        });
    };

    return (
        <div className="card mt-3">
            <div className="card-header bg-light">
                <h6 className="mb-0"><i className="bi bi-card-heading me-2"></i>Данные для титульного листа</h6>
            </div>
            <div className="card-body">
                <div className="row g-3">
                    <div className="col-md-6">
                        <label className="form-label">Фамилия И.О. студента</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="studentName" 
                            placeholder="Иванов И.И."
                            value={formData.studentName}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">ПЗ</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="pz" 
                            placeholder="004.457"
                            value={formData.pz}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Группа</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="studentGroup" 
                            placeholder="ПИ-123"
                            value={formData.studentGroup}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Название работы</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="workTitle" 
                            placeholder="Курсовая работа"
                            value={formData.workTitle}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Тема работы</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="workTopic" 
                            placeholder="Разработка веб-приложения"
                            value={formData.workTopic}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Институт</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="institute" 
                            placeholder="Институт компьютерных наук"
                            value={formData.institute}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Кафедра</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="department" 
                            placeholder="Программная инженерия"
                            value={formData.department}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">ФИО преподавателя</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="teacherName" 
                            placeholder="Петрова П.П."
                            value={formData.teacherName}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Должность преподавателя</label>
                        <input 
                            type="text" 
                            className="form-control" 
                            id="teacherPosition" 
                            placeholder="доцент"
                            value={formData.teacherPosition}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="col-md-6">
                        <label className="form-label">Год выполнения</label>
                        <input 
                            type="number" 
                            className="form-control" 
                            id="workYear" 
                            placeholder="2023" 
                            min="2000" 
                            max="2100"
                            value={formData.workYear}
                            onChange={handleChange}
                        />
                    </div>
                </div>
            </div>
        </div>
    );
}
