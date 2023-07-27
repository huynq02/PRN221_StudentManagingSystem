﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StudentManagingSystem.Model;
using StudentManagingSystem.Model.Interface;
using StudentManagingSystem.Pages;
using StudentManagingSystem.Repository.IRepository;
using StudentManagingSystem.Utility;

namespace StudentManagingSystem.Repository
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly ISmsDbContext _context;
        private readonly IMapper _mapper;

        public DepartmentRepository(ISmsDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task Add(Department department, CancellationToken cancellationToken = default)
        {
            await _context.Departments.AddAsync(department);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task Delete(Guid id, CancellationToken cancellationToken = default)
        {
            var department = await _context.Departments.FirstOrDefaultAsync(i => i.Id == id);
            if (department == null) throw new ArgumentException("Can not find !!!");
            var c = await _context.ClassRooms.FirstOrDefaultAsync(i => i.DepartmentId == id);
            if (c != null) c.DepartmentId = null;
            _context.Departments.Remove(department);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task<List<Department>> GetAll()
        {
            var list = await _context.Departments.Where(c => c.Status == true).OrderByDescending(c => c.CreatedDate).ToListAsync();
            return list;
        }

        public async Task<Department> GetById(Guid id)
        {
            var department = await _context.Departments.FirstOrDefaultAsync(i => i.Id == id);
            if (department == null) throw new ArgumentException("Can not find !!!");
            return department;
        }

        public async Task<PagedList<Department>> Search(string? keyword, bool? status, int page, int pagesize)
        {
            var query = _context.Departments.AsQueryable();
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(c => (!string.IsNullOrEmpty(c.DepartmentName) && c.DepartmentName.Contains(keyword.ToLower().Trim()))
                                      || (!string.IsNullOrEmpty(c.DepartmentCode) && c.DepartmentCode.Contains(keyword.ToLower().Trim())));
            }
            if (status != null)
            {
                query = query.Where(c => c.Status == status);
            }
            var query1 = query.OrderByDescending(c => c.CreatedDate);
            var query2 = await query1.Skip((page - 1) * pagesize)
                .Take(pagesize).ToListAsync();
            var res = await query1.ToListAsync();
            return new PagedList<Department>
            {
                Data = query2,
                TotalCount = res.Count
            };
        }

        public async Task Update(Department department, CancellationToken cancellationToken = default)
        {
            var dept = await _context.Departments.FirstOrDefaultAsync(i => i.Id == department.Id);
            if (dept != null)
            {
                var newDept = _mapper.Map<Department, Department>(department, dept);
                _context.Departments.Update(newDept);
                await _context.SaveChangesAsync(cancellationToken);
            }
        }
    }
}
