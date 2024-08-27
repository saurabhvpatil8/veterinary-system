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
                        //string strQuery1 = "INSERT INTO hospitals (name) VALUES (@name); select LAST_INSERT_ID();";
                        //MySqlCommand sqlCommand = new MySqlCommand(strQuery1, objDBConfig.Database);
                        //sqlCommand.Parameters.AddWithValue("@name", strHospitalName);

                        //int iHospitalId = Convert.ToInt32(sqlCommand.ExecuteScalar());



                        string strQuery = "INSERT INTO users (fname, email, password, user_type) VALUES (@fname, @email, @password, @user_type);";

                        MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                        // Add parameters and set their values
                        sqlCommand.Parameters.AddWithValue("@fname", strName);
                        sqlCommand.Parameters.AddWithValue("@email", strEmail);
                        sqlCommand.Parameters.AddWithValue("@password", strPassword);
                        sqlCommand.Parameters.AddWithValue("@user_type", strUserType);

                        // Execute the command
                        iResult = sqlCommand.ExecuteNonQuery();
                    }
                    else
                    {

                        string strQuery1 = "INSERT INTO hospitals (name) VALUES (@name); select LAST_INSERT_ID();";
                        MySqlCommand sqlCommand = new MySqlCommand(strQuery1, objDBConfig.Database);
                        sqlCommand.Parameters.AddWithValue("@name", strHospitalName);

                        int iHospitalId = Convert.ToInt32(sqlCommand.ExecuteScalar());



                        string strQuery2 = "INSERT INTO users (fname, email, password, user_type, hospital_id) VALUES (@fname, @email, @password, @user_type, @hospital_id);";

                        sqlCommand = new MySqlCommand(strQuery2, objDBConfig.Database);

                        // Add parameters and set their values
                        sqlCommand.Parameters.AddWithValue("@fname", strName);
                        sqlCommand.Parameters.AddWithValue("@email", strEmail);
                        sqlCommand.Parameters.AddWithValue("@password", strPassword);
                        sqlCommand.Parameters.AddWithValue("@user_type", strUserType);
                        sqlCommand.Parameters.AddWithValue("@hospital_id", iHospitalId);

                        // Execute the command
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