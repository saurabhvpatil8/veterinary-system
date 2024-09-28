using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veterinary_System.ADO;
using Veterinary_System.Classes;

namespace Veterinary_System.Doctor
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void btnAddNewCompounder_Click(object sender, EventArgs e)
        {
            UserADO objUserADO = new UserADO();

            if (CheckValidation())
            {
                string strName = txtName.Text.ToString().Trim();
                string strEmail = txtEmail.Text.ToString().Trim();

                int iResult = objUserADO.AddCompounder(strName, strEmail, Constants.objUser.iHospitalId);

                if (iResult > 0)
                {
                    //added
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New Compounder Added.');", true);
                }
                else
                {
                    //not added, DB error maybee vroo
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Database error, Please try after some time..!');", true);
                }
            }
        }
        public bool CheckValidation()
        {
            if (String.IsNullOrEmpty(txtName.Text.ToString().Trim()))
                return false;
            if (String.IsNullOrEmpty(txtEmail.Text.ToString().Trim()))
                return false;
            return true;
        }

        [WebMethod]
        public static Permission GetPermissions()
        {
            return Constants.objPermission;
        }

        [WebMethod]
        public static int AddDoctor(string strName, string strEmail)
        {
            UserADO objUserADO = new UserADO();
            int iResult = objUserADO.AddDoctor(strName, strEmail, Constants.objUser.iHospitalId);

            return iResult;
        }

        [WebMethod]
        public static List<AppointmentForDoctor> GetAppointments()
        {
            AppointmentADO objAppointmentADO = new AppointmentADO();
            List<AppointmentForDoctor> lstAppointmentForDoctors = objAppointmentADO.GetAppointments(Constants.objUser.iHospitalId);

            return lstAppointmentForDoctors;
        }

        [WebMethod]
        public static bool ApproveAppointment(int id, DateTime newDate)
        {
            AppointmentADO objAppointmentADO = new AppointmentADO();
            string strToEmail = objAppointmentADO.ApproveAppointment(id, newDate);

            if (!string.IsNullOrEmpty(strToEmail))
            {
                SendMail(toEmail: strToEmail, strSubject: "Approval of Appointment Request", strBody: "Your appointment request has been accepted. You can come on " + newDate.ToString("dd-MM-yyyy") + " for your pet's further diagnosis.");
                return true;
            }
            else
            {
                return false;
            }
        }

        public static void SendMail(string toEmail, string strSubject, string strBody)
        {
            MailMessage objMailMessage = new MailMessage("saurabhvpatil5@gmail.com", toEmail);
            objMailMessage.Subject = strSubject;
            objMailMessage.Body = strBody;
            //objMailMessage.Body = "Yaa, I'm nervious that day also, and today also..!";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "saurabhvpatil5@gmail.com",      // From
                Password = "rnwi xgik bmnd lcpl"        // Google account app password
            };

            smtpClient.EnableSsl = true;
            smtpClient.Send(objMailMessage);

        }

        private Task SendEmailAsync1(string email, string subject, string message)
        {
            try
            {
                // Configure the SmtpClient
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential("your_email@gmail.com", "your_password_or_app_password")
                };

                // Create the mail message
                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress("your_email@gmail.com"),
                    Subject = subject,
                    Body = message
                };

                mailMessage.To.Add(email);

                // Send the email asynchronously
                return client.SendMailAsync(mailMessage);
            }
            catch (Exception ex)
            {
                // Handle error (e.g., log it or display an error message)
                return Task.FromException(ex);
            }
        }

        [WebMethod]
        public static bool RejectAppointment(int id)
        {
            AppointmentADO objAppointmentADO = new AppointmentADO();
            bool bResult = objAppointmentADO.RejectAppointment(id);

            return bResult;
        }
    }
}