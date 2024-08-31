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
    public partial class SignUp : System.Web.UI.Page
    {
        DBConfig objDBConfig = new DBConfig();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {

                string strName = txtName.Text.ToString().Trim();
                string strEmail = txtEmail.Text.ToString().Trim();
                string strPassword = txtPassword.Text.ToString().Trim();
                string strUserType = drpLstUserType.SelectedValue.Trim();
                string strHospitalName = txtHospitalName.Text.ToString().Trim();
                int iResult = 0;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    if (strUserType.Equals("User"))
                    {
                        //insert into user table
                        string strQuery = "INSERT INTO users (fname, email, password, user_type) VALUES (@fname, @email, @password, @user_type);";
                        MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                        sqlCommand.Parameters.AddWithValue("@fname", strName);
                        sqlCommand.Parameters.AddWithValue("@email", strEmail);
                        sqlCommand.Parameters.AddWithValue("@password", strPassword);
                        sqlCommand.Parameters.AddWithValue("@user_type", strUserType);

                        iResult = sqlCommand.ExecuteNonQuery();
                    }
                    else
                    {
                        //insert into hospital table
                        string strQuery = "INSERT INTO hospitals (name) VALUES (@name); select LAST_INSERT_ID();";
                        MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                        sqlCommand.Parameters.AddWithValue("@name", strHospitalName);
                        int iHospitalId = Convert.ToInt32(sqlCommand.ExecuteScalar());

                        //insert into user table
                        strQuery = "INSERT INTO users (fname, email, password, user_type, hospital_id) VALUES (@fname, @email, @password, @user_type, @hospital_id); select LAST_INSERT_ID();";
                        sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                        sqlCommand.Parameters.AddWithValue("@fname", strName);
                        sqlCommand.Parameters.AddWithValue("@email", strEmail);
                        sqlCommand.Parameters.AddWithValue("@password", strPassword);
                        sqlCommand.Parameters.AddWithValue("@user_type", strUserType);
                        sqlCommand.Parameters.AddWithValue("@hospital_id", iHospitalId);

                        int iUserId = Convert.ToInt32(sqlCommand.ExecuteScalar());

                        //insert into permission table
                        strQuery = "INSERT INTO permission (user_id, dashboard, permission, billing) VALUES (@user_id, @dashboard, @permission, @billing);";
                        sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                        sqlCommand.Parameters.AddWithValue("@user_id", iUserId);
                        sqlCommand.Parameters.AddWithValue("@dashboard", 1);
                        sqlCommand.Parameters.AddWithValue("@permission", 1);
                        sqlCommand.Parameters.AddWithValue("@billing", 1);

                        iResult = sqlCommand.ExecuteNonQuery();
                    }

                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                    if (iResult > 0)
                    {
                        Response.Redirect("SignIn.aspx");
                        //   inserted successfully
                    }
                    else
                    {
                        // not inserted into Database, might be some DB related error
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}