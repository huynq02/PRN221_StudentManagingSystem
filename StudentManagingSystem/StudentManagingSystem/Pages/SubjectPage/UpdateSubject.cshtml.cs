using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using StudentManagingSystem.Model;
using StudentManagingSystem.Repository.IRepository;
using StudentManagingSystem.Utility;
using System.Data;

namespace StudentManagingSystem.Pages.SubjectPage
{
    [Authorize]
    public class UpdateSubjectModel : PageModel
    {
        private readonly ISubjectRepository _repository;
        private readonly ISubjectRepository _subjectRepository;
        private readonly IMapper _mapper;

        [BindProperty]
        public Subject Subject { get; set; }
        public List<Subject> Subjects { get; set; }
        [BindProperty(SupportsGet = true)]
        public int PageIndex { get; set; }
        public UpdateSubjectModel(ISubjectRepository repository, ISubjectRepository subjectRepository, IMapper mapper)
        {
            _repository = repository;
            _subjectRepository = subjectRepository;
            _mapper = mapper;
        }
        public async Task<IActionResult> OnGetAsync(Guid id)
        {
            List<Subject> subjects = await _subjectRepository.GetAll();
            Subject = await _repository.GetById(id);
            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {
            Subject.LastModifiedDate = DateTime.Now;
            await _repository.Update(Subject);
            return RedirectToPage("/SubjectPage/Subject", new { pageIndex = PageIndex });
        }
    }
}
