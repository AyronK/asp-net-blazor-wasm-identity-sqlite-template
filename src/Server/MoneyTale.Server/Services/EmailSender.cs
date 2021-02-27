using System.Threading.Tasks;
using MoneyTale.Server.Identity.Services;

namespace MoneyTale.Server.Services
{
    internal class EmailSender : IEmailSender
    {
        public Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            return Task.CompletedTask;
        }
    }
}
