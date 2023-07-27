﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StudentManagingSystem.Model;
using StudentManagingSystem.Model.Interface;
using StudentManagingSystem.Repository.IRepository;
using StudentManagingSystem.Utility;
using System;
using System.Security.Cryptography;

namespace StudentManagingSystem.Repository
{
    public class RoomRepository : IRoomRepository
    {
        private readonly ISmsDbContext _context;
        private readonly IMapper _mapper;

        public RoomRepository(ISmsDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task Add(ClassRoom classRoom, CancellationToken cancellationToken = default)
        {
            await _context.ClassRooms.AddAsync(classRoom);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task Delete(Guid id, CancellationToken cancellationToken = default)
        {
            var c = await _context.ClassRooms.FirstOrDefaultAsync(i => i.Id == id);
            if (c == null) throw new ArgumentException("Can not find !!!");
            //var s = await _context.Students.Where(i => i.ClassRoomId == id).ToListAsync();
            //if (s.Count > 0)
            //{
            //    foreach (var item in s)
            //    {
            //        item.ClassRoomId = null;
            //    }
            //}
            _context.ClassRooms.Remove(c);
            await _context.SaveChangesAsync(cancellationToken);
        }

        public async Task<List<ClassRoom>> GetAll()
        {
            var list = await _context.ClassRooms.Where(i => i.Status == true).OrderByDescending(i => i.CreatedDate).ToListAsync();
            return list;
        }

        public async Task<ClassRoom> GetById(Guid id)
        {
            var c = await _context.ClassRooms.FirstOrDefaultAsync(i => i.Id == id);
            return c;
        }



        public async Task<PagedList<ClassRoom>> Search(string? keyword, bool? status, string? tid, int page, int pagesize)
        {
            var query = _context.ClassRooms.AsQueryable();
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(c => (!string.IsNullOrEmpty(c.ClassName) && c.ClassName.Contains(keyword.ToLower().Trim()))
                                      || (!string.IsNullOrEmpty(c.ClassCode) && c.ClassCode.Contains(keyword.ToLower().Trim())));
            }
            if (status != null)
            {
                query = query.Where(c => c.Status == status);
            }
            if (tid != null)
            {
                query = query.Where(i => i.UserId == tid);
            }
            var query1 = query.Include(i => i.Department).Include(i => i.User).OrderByDescending(c => c.CreatedDate);
            var query2 = await query1.Skip((page - 1) * pagesize)
                .Take(pagesize).ToListAsync();
            var res = await query1.ToListAsync();
            return new PagedList<ClassRoom>
            {
                Data = query2,
                TotalCount = res.Count
            };
        }

        public async Task<List<Student>> ListStudentByClass(Guid sid)
        {
            var list = await _context.Students.Where(i => i.Status == true && i.ClassRoomId == sid).Include(i => i.ClassRoom).OrderByDescending(c => c.CreatedDate).ToListAsync();
            return list;
        }

        public async Task<PagedList<ClassRoom>> SearchClassByStudent(string? keyword, bool? status, Guid? sid, int page, int pagesize)
        {
            var query = _context.Students.AsQueryable();

            var query1 = query.Where(i => i.Id == sid)
                .Include(i => i.ClassRoom).ThenInclude(i => i.Department)
                .Include(i => i.ClassRoom).ThenInclude(i => i.User)
                .OrderByDescending(c => c.CreatedDate);
            var query2 = await query1.Skip((page - 1) * pagesize)
                .Take(pagesize).Select(i => i.ClassRoom).ToListAsync();
            var res = await query1.ToListAsync();
            return new PagedList<ClassRoom>
            {
                Data = query2,
                TotalCount = res.Count
            };
        }

        public async Task Update(ClassRoom classRoom, CancellationToken cancellationToken = default)
        {
            var c = await _context.ClassRooms.FirstOrDefaultAsync(i => i.Id == classRoom.Id);
            if (c != null)
            {
                var newC = _mapper.Map<ClassRoom, ClassRoom>(classRoom, c);
                _context.ClassRooms.Update(newC);
                await _context.SaveChangesAsync(cancellationToken);
            }
        }
    }
}
