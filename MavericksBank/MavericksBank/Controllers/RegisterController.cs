using MavericksBank.DTO;
using MavericksBank.Models;
using MavericksBank.Util;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MavericksBank.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly MavericksBankDb2Context _context;

        public RegisterController(MavericksBankDb2Context context)
        {
            _context = context;
        }

        [HttpPost("Register")]

        public IActionResult RegisterUser(UserDto Model)
        {
            try
            {
                if (Model.Password != Model.ConfirmPassword)
                    return BadRequest("Password is not matching");
                var customer = new Customer
                {
                    Email = Model.Email,
                    Name = Model.Name,
                    Password = HashUtil.HashPassword(Model.Password),
                    Username = Model.Username,
                    Address = Model.Address,
                    Phone = Model.Phone,
                    Token = JwtUtil.GenerateJwtToken(Model.Username, "Customer")
                };

                _context.Customers.Add(customer);
                _context.SaveChanges();
                return Ok();
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
