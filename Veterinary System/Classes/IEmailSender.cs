using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Veterinary_System.Classes
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string email, string subject, string message);
    }
}