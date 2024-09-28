using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veterinary_System.ADO;
using Veterinary_System.Classes;

namespace Veterinary_System
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Constants.OnLoad();
            }

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (CheckValidation())
            {
                string strEmail = txtEmail.Text.ToString().Trim();
                string strPassword = txtPassword.Text.ToString().Trim();

                UserADO objUserADO = new UserADO();
                User objUser = objUserADO.CheckUser(strEmail, strPassword);

                PermissionsADO permissionsADO = new PermissionsADO();
                Permission objPermission = permissionsADO.GetPermissionsById(objUser.iUserId);

                if (objUser != null)
                {
                    if (objUser.strUserType == "User")
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        if (objPermission.bDashboard)
                        {
                            Response.Redirect("Dashboard.aspx");
                        }
                        else if (objPermission.bDiagnosis)
                        {
                            Response.Redirect("Diagnosis.aspx");
                        }
                        else if (objPermission.bPermission)
                        {
                            Response.Redirect("Permissions.aspx");
                        }
                        else if (objPermission.bBilling)
                        {
                            Response.Redirect("Billing.aspx");
                        }
                        else
                        {
                            Response.Redirect("Profile.aspx");
                        }
                    }
                }
                else
                {
                    // invalid user credentials (email or password is wrong)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myscript", "alert('Wrong email or password..!');");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myscript", "alert('Please enter proper email or password..!');");
                //not null validations
            }


        }
        public bool CheckValidation()
        {
            if (String.IsNullOrEmpty(txtEmail.Text.ToString()))
                return false;

            if (String.IsNullOrEmpty(txtPassword.Text.ToString()))
                return false;

            return true;
        }
    }
}