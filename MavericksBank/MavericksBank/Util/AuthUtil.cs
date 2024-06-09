using MavericksBank.Models;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MavericksBank.Util
{
    public class AuthUtil
    {
        public static string GenerateJwtToken(Customer customer)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("4649167A2A8AFC2B33A8FBC1973E0D2A1D6EFA537A9A5B83D8D9F5A20A3540C00F19A28FBD45FC8E1E95F6C60A5431E4D1F5A1047C487E9C86A7A74F93500C30"));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha512Signature);

            var claims = new List<Claim>
            {
                new Claim("Name", customer.Name),
                new Claim("Email", customer.Email),
                new Claim("Username", customer.Username),
            };

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials
            );
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
