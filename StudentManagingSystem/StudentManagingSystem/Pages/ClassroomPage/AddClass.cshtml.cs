using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StudentManagingSystem.Model;
using StudentManagingSystem.Model.Interface;
using StudentManagingSystem.Repository;
using StudentManagingSystem.Repository.IRepository;
using StudentManagingSystem.Utility;
using StudentManagingSystem.ViewModel;
using System.Data;

namespace StudentManagingSystem.Pages.ClassRoomPage
{
    [Authorize(Roles = RoleConstant.ADMIN + "," + RoleConstant.TEACHER)]
    public class AddClassModel : PageModel
    {
        private readonly IRoomRepository _repository;
        private readonly IUserRepository _userRepository;
        private readonly IDepartmentRepository _departmentRepository;
        private readonly SmsDbContext _smsDbContext;
        private readonly IMapper _mapper;

        [BindProperty]
        public ClassRoomAddRequest ClassRoomAddRequest { get; set; }
        public List<Department> listDept { get; set; }
        public List<AppUser> listUser { get; set; }
        public AddClassModel(IRoomRepository repository, SmsDbContext smsDbContext, IDepartmentRepository departmentRepository, IUserRepository userRepository, IMapper mapper)
        {
            _repository = repository;
            _userRepository = userRepository;
            _smsDbContext = smsDbContext;
            _departmentRepository = departmentRepository;
            _mapper = mapper;
        }
        public async Task<IActionResult> OnGetAsync()
        {
            listDept = await _departmentRepository.GetAll();
            listUser = await _userRepository.GetAll();
            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {

            listDept = await _departmentRepository.GetAll();
            listUser = await _userRepository.GetAll();
            var dept = _mapper.Map<ClassRoom>(ClassRoomAddRequest);
            dept.Id = Guid.NewGuid();
            dept.CreatedDate = DateTime.Now;
            dept.LastModifiedDate = null;

            var res = await _smsDbContext.ClassRooms.ToListAsync();
            foreach (var item in res)
            {
                if (item.ClassCode == dept.ClassCode || item.ClassName == dept.ClassName)
                {
                    var errorMessage = "The Class Name has been exist!";
                    ViewData["Error"] = errorMessage;
                    //    ViewData.error = "The class code has been exist ";
                    return Page();

                }
            }
            await _repository.Add(dept);
            return RedirectToPage("/ClassRoomPage/ClassRoom");
        }
    }
}
