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
                if (objUser != null)
                {
                    if (Constants.objUser.iHospitalId != null)
                        Response.Redirect("Dashboard.aspx");
                    else
                        Response.Redirect("Home.aspx");
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