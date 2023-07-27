﻿using StudentManagingSystem.Model;
using StudentManagingSystem.Utility;

namespace StudentManagingSystem.Repository.IRepository
{
    public interface IRoomRepository
    {
        Task Add(ClassRoom classRoom, CancellationToken cancellationToken = default);
        Task Update(ClassRoom classRoom, CancellationToken cancellationToken = default);
        Task Delete(Guid id, CancellationToken cancellationToken = default);
        Task<ClassRoom> GetById(Guid id);
        Task<List<ClassRoom>> GetAll();
        //Task<bool> CheckAddClassName(string ClassName, CancellationToken cancellationToken = default);

        Task<PagedList<ClassRoom>> Search(string? keyword, bool? status, string? tid, int page, int pagesize);
        Task<PagedList<ClassRoom>> SearchClassByStudent(string? keyword, bool? status, Guid? sid, int page, int pagesize);
        Task<List<Student>> ListStudentByClass(Guid sid);

    }
}
