﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StudentManagingSystem.Model;
using StudentManagingSystem.Model.Interface;
using StudentManagingSystem.Utility;

namespace StudentManagingSystem.Repository.IRepository
{
    public class PointRepository : IPointRepository
    {
        private readonly ISmsDbContext _context;
        private readonly IMapper _mapper;

        public PointRepository(ISmsDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task Add(Point point, CancellationToken cancellationToken = default)
        {
            var p = new Point();
            var newP = _mapper.Map<Point, Point>(point, p);
            await _context.Points.AddAsync(newP);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task Delete(Guid id, CancellationToken cancellationToken = default)
        {
            var point = await _context.Points.FirstOrDefaultAsync(i => i.Id == id);
            if (point == null) throw new ArgumentException("Can not find !!!");
            _context.Points.Remove(point);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task<Point> GetById(Guid id)
        {
            var point = await _context.Points.FirstOrDefaultAsync(i => i.Id == id);
            if (point == null) throw new ArgumentException("Can not find !!!");
            return point;
        }

        public async Task<PagedList<Point>> Search(string? keyword,int? semester, Guid? subId, Guid? stuId, int page, int pagesize)
        {
            var query = _context.Points.AsQueryable();
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(c => (!string.IsNullOrEmpty(c.Subject.SubjectName) && c.Subject.SubjectName.Contains(keyword.ToLower().Trim()))
                                      || (!string.IsNullOrEmpty(c.Subject.SubjectCode) && c.Subject.SubjectCode.Contains(keyword.ToLower().Trim()))
                                      || (!string.IsNullOrEmpty(c.Student.StudentName) && c.Student.StudentName.Contains(keyword.ToLower().Trim()))
                                      || (!string.IsNullOrEmpty(c.Student.StudentCode) && c.Student.StudentCode.Contains(keyword.ToLower().Trim())));
            }
            if (subId != null)
            {
                if (subId == Guid.Empty)
                {
                    query = query.Where(i => i.Subject.Id == null);
                }
                query = query.Where(i => i.Subject.Id == subId);
            }
            if (stuId != null)
            {
                if (stuId == Guid.Empty)
                {
                    query = query.Where(i => i.Student.Id == null);
                }
                query = query.Where(i => i.Student.Id == stuId);
            }
            if (semester != null)
            {
                query = query.Where(i =>i.Subject.Semester == semester);
            }
            var query1 = query.Include(i => i.Subject).Include(i => i.Student).OrderByDescending(c => c.CreatedDate);
            var query2 = await query1.Skip((page - 1) * pagesize)
                .Take(pagesize).ToListAsync();
            var res = await query1.ToListAsync();
            
            return new PagedList<Point>
            {
                Data = query2,
                TotalCount = res.Count
            };
        }

        public async Task Update(Point point, CancellationToken cancellationToken = default)
        {
            var dept = await _context.Points.FirstOrDefaultAsync(i => i.Id == point.Id);
            if (dept != null)
            {
                var newDept = _mapper.Map<Point, Point>(point, dept);
                _context.Points.Update(newDept);
                await _context.SaveChangesAsync(cancellationToken);
            }
        }
    }
}
