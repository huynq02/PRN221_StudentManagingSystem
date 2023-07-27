using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using StudentManagingSystem.Repository.IRepository;
using StudentManagingSystem.Utility;
using System.Data;

namespace StudentManagingSystem.Pages.ClassRoomPage
{
    [Authorize(Roles = RoleConstant.ADMIN)]
    public class DeleteClassModel : PageModel
    {
        private readonly IRoomRepository _repository;

        public DeleteClassModel(IRoomRepository repository)
        {
            _repository = repository;
        }
        public async Task<IActionResult> OnGetAsync(Guid id)
        {
            try
            {
                /*// Kiểm tra xem lớp học có học sinh hay không
                var studentsInClass = await _repository.(id);
                if (studentsInClass.Any())
                {
                    // Lớp học có học sinh, không thể xoá
                    TempData["ErrorMessage"] = "Không thể xoá lớp học có học sinh.";
                    return RedirectToPage("/ClassRoomPage/ClassRoom");
                }*/

                // Xoá lớp học nếu không có học sinh
                await _repository.Delete(id);
                return RedirectToPage("/ClassRoomPage/ClassRoom");
            }
            catch (Exception ex)
            {
                var er = "The Class has a Student!";
                return RedirectToPage("/ClassRoomPage/ClassRoom", new { mess = er });
            }
            //await _repository.Delete(id);
            //return RedirectToPage("/ClassRoomPage/ClassRoom");
        }
    }
}
