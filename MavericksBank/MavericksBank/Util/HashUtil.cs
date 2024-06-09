namespace MavericksBank.Util
{
    public class HashUtil
    {
        public static string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }
    }
}
