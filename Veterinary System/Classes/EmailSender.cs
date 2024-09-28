using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;

namespace Veterinary_System.Classes
{
    public class EmailSender : IEmailSender
    {
        public Task SendEmailAsync(string email, string subject, string message)
        {
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                EnableSsl = true,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("saurabhvpatil5@gmail.com", "sau4abhpat!l")
            };

            return client.SendMailAsync(
                new MailMessage(from: "saurabhvpatil5@gmail.com",
                                to: email,
                                subject,
                                message
                                ));
        }
    }
}