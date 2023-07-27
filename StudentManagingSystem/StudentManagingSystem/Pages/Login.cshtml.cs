using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using StudentManagingSystem.Model;
using StudentManagingSystem.ViewModel;

namespace StudentManagingSystem.Pages
{
    public class LoginModel : PageModel
    {
        private readonly SignInManager<AppUser> _signInManager;
        private readonly UserManager<AppUser> _userManager;

        [BindProperty]
        public LoginViewModel Login { get; set; }

        public LoginModel(SignInManager<AppUser> signInManager, UserManager<AppUser> userManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            //if (ModelState.IsValid)
            //{
            //    var result = await _signInManager
            //        .PasswordSignInAsync(Login.Email, Login.Password, Login.RememberMe, lockoutOnFailure: false);
            //        var identityResult = await _userManager.FindByEmailAsync(Login.Email) &&;
            //    if (!identityResult.Activated)
            //    {
            //        ViewData["Title"] = "Account is not locked !";
            //        return Page();
            //    }
            //    if (result.Succeeded) return RedirectToPage("/Index");
            //    else ViewData["Title"] = "Wrong password !";
            //}
            //else
            //{
            //    ViewData["Title"] = "Incorrect email or password !";
            //}
            //return Page();
            if (ModelState.IsValid)
            {
                var result = await _signInManager.PasswordSignInAsync(Login.Email, Login.Password, Login.RememberMe, lockoutOnFailure: false);

                if (result.Succeeded)
                {
                    // Đăng nhập thành công
                    var user = await _userManager.FindByEmailAsync(Login.Email);
                    if (user != null && !user.Activated)
                    {
                        ViewData["Title"] = "Account is not activated!";
                        return Page();
                    }

                    return RedirectToPage("/Index");
                }
                else
                {
                    // Đăng nhập thất bại
                    ViewData["Title"] = "Wrong password or email!";
                }
            }
            else
            {
                ViewData["Title"] = "Incorrect email or password!";
            }

            return Page();
        }

    }
}
