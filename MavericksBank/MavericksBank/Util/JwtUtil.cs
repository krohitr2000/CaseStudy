using MavericksBank.Models;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MavericksBank.Util
{
    public class JwtUtil
    {
        public static string GenerateJwtToken(string userName, string role)
        {
            var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("4649167A2A8AFC2B33A8FBC1973E0D2A1D6EFA537A9A5B83D8D9F5A20A3540C00F19A28FBD45FC8E1E95F6C60A5431E4D1F5A1047C487E9C86A7A74F93500C30"));
            var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha512Signature);

            var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, userName),
                    new Claim(ClaimTypes.Role, role)
                };

            //var tokeOptions = new JwtSecurityToken(
            //    issuer: "http://localhost:5126/",
            //    audience: "http://localhost:5126/",
            //    claims: claims,
            //    expires: DateTime.Now.AddDays(1),
            //    signingCredentials: signinCredentials
            //);
            var tokenDescription = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddMinutes(30),
                SigningCredentials = signinCredentials
            };
            //var tokenString = new JwtSecurityTokenHandler().WriteToken(tokeOptions);
            //return tokenString;

            var tokenHandler = new JwtSecurityTokenHandler();
            var myToken = tokenHandler.CreateToken(tokenDescription);
            var token = tokenHandler.WriteToken(myToken);

            return token;
        }
    }
}
