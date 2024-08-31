using System;
using System.Collections.Generic;
using System.Linq;
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

                int iResult = objUserADO.AddCompunder(strName, strEmail, Constants.objUser.iHospitalId);

                if (iResult > 0)
                {
                    //added
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myscript", "alert('New Compounder Added.');");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myscript", "alert('Database error, Please try after some time..!');");
                    //not added, DB error maybee vroo
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
    }
}