using MavericksBank.DTO;
using MavericksBank.Models;
using MavericksBank.Util;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MavericksBank.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly MavericksBankDb2Context _context;

        public LoginController(MavericksBankDb2Context context)
        {
            _context = context;
        }

        [HttpPost("Login")]
        public IActionResult Login(LoginDto model)
        {
            try
            {
                var user = _context.Customers.FirstOrDefault(x => x.Username == model.Username);
                if (user == null || BCrypt.Net.BCrypt.Verify(HashUtil.HashPassword(model.Password), user.Password))
                {
                    return NotFound("User Not Found!");
                }

                var token = AuthUtil.GenerateJwtToken(user);
                user.Token = token;
                return Ok(user);
            }
            catch (Exception ex)
            {
                return BadRequest("An error Occured"+ex.Message);
            }
            
        }
    }
}
