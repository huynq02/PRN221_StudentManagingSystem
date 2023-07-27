﻿using StudentManagingSystem.Model;
using StudentManagingSystem.Utility;

namespace StudentManagingSystem.Repository.IRepository
{
    public interface IPointRepository
    {
        Task Add(Point point, CancellationToken cancellationToken = default);
        Task Update(Point point, CancellationToken cancellationToken = default);
        Task Delete(Guid id, CancellationToken cancellationToken = default);
        Task<Point> GetById(Guid id);
        Task<PagedList<Point>> Search(string? keyword,int? semester, Guid? subId,Guid? stuId, int page, int pagesize);
    }
}
