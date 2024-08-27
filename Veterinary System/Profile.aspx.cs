using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veterinary_System.Classes;

namespace Veterinary_System
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetUserType()
        {
            return Constants.objUser.strUserType;
        }

        [WebMethod]
        public static User GetUserData()
        {
            return Constants.objUser;
        }

        [WebMethod]
        public static Hospital GetHospitalData()
        {
            return Constants.objHospital;
        }

    }
}