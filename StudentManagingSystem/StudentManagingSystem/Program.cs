using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using NToastNotify;
using ResumeSvc.Infrastructure.Extensions;
using StudentManagingSystem.Configurations;
using StudentManagingSystem.Model;
using StudentManagingSystem.Model.Interface;
using StudentManagingSystem.Model.SeedData;
using StudentManagingSystem.Repository;
using StudentManagingSystem.Repository.IRepository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddRazorPages();
builder.Services.AddDbContext<SmsDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbContext")));
builder.Services.AddIdentity<AppUser, IdentityRole>()
    .AddEntityFrameworkStores<SmsDbContext>()
    .AddRoles<IdentityRole>()
    .AddDefaultTokenProviders();
builder.Services.Configure<IdentityOptions>(options =>
{
    // Cấu hình các tùy chọn mật khẩu ở đây
    options.Password.RequireDigit = false; // Có thể đặt thành true nếu yêu cầu ít nhất một chữ số
    options.Password.RequireLowercase = false; // Có thể đặt thành true nếu yêu cầu ít nhất một chữ thường
    options.Password.RequireUppercase = false; // Có thể đặt thành true nếu yêu cầu ít nhất một chữ hoa
    options.Password.RequireNonAlphanumeric = false; // Có thể đặt thành true nếu yêu cầu ít nhất một ký tự đặc biệt
    options.Password.RequiredLength = 6; // Đặt độ dài tối thiểu của mật khẩu là 6 ký tự, có thể thay đổi theo ý muốn
    options.Password.RequiredUniqueChars = 1; // Đặt số lượng ký tự khác nhau yêu cầu trong mật khẩu, có thể thay đổi theo ý muốn
});
builder.Services.AddScoped<UserManager<AppUser>>();
builder.Services.AddScoped<SignInManager<AppUser>>();
builder.Services.AddScoped<ISmsDbContext, SmsDbContext>();
builder.Services.AddInfrastructure(builder.Configuration);
builder.Services.ConfigureApplicationCookie(config =>
{
    config.LoginPath = "/Login";
    config.AccessDeniedPath = "/Forbidden";
});
builder.Services.AddRazorPages().AddNToastNotifyToastr(new ToastrOptions()
{
    ProgressBar = true,
    PositionClass = ToastPositions.TopCenter,
    PreventDuplicates = true,
    CloseButton = true
});
var app = builder.Build();
// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

IServiceProvider serviceProvider = builder.Services.BuildServiceProvider();
app.UseApplicationDatabase<SmsDbContext>(serviceProvider);
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapRazorPages();

/*using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var context = services.GetRequiredService<SmsDbContext>();
    context.Database.Migrate();
    var userMgr = services.GetRequiredService<UserManager<AppUser>>();
    var roleMgr = services.GetRequiredService<RoleManager<IdentityRole>>();
    IdentitySeedData.Seed(context, userMgr, roleMgr).Wait();
}*/

app.Run();
