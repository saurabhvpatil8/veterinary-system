using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class UserADO
    {
        DBConfig objDBConfig = new DBConfig();
        public int AddCompunder(string name, string email, string password, int? hospitalId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "INSERT INTO users (fname, email, password, user_type, hospital_id) VALUES (@fname, @email, @password, @user_type, @hospital_id);";

                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    // Add parameters and set their values
                    sqlCommand.Parameters.AddWithValue("@fname", name);
                    sqlCommand.Parameters.AddWithValue("@email", email);
                    sqlCommand.Parameters.AddWithValue("@password", password);
                    sqlCommand.Parameters.AddWithValue("@user_type", "Compunder");
                    sqlCommand.Parameters.AddWithValue("@hospital_id", hospitalId);

                    // Execute the command
                    iResult = sqlCommand.ExecuteNonQuery();
                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return iResult;
            }
            catch (Exception ex)
            {
                //error
                return -1;
            }
        }

        public User CheckUser(string email, string password)
        {
            try
            {
                User objUser = null;
                Hospital objHospital = null;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    MySqlCommand command = new MySqlCommand("select * from users where email='" + email + "' and password='" + password + "';", objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {
                        objUser = new User
                        {
                            iUserId = (int)data["user_id"],
                            strUserType = data["user_type"].ToString(),
                            strEmail = data["email"].ToString(),
                            strPassword = data["password"].ToString(),
                            iHospitalId = data["hospital_id"] != DBNull.Value ? (int)(data["hospital_id"]) : (int?)null,
                            strFName = data["fname"].ToString(),
                            strLName = data["lname"].ToString(),
                            strPhoneNo = data["phone_no"].ToString(),
                            strSpecialization = data["specialization"].ToString(),
                            strAddress = data["address"].ToString(),
                        };
                    }
                    Constants.objUser = objUser;

                    if (objUser != null)    //Get Hospital Information
                    {
                        command = new MySqlCommand("select * from hospitals where hospital_id=" + objUser.iHospitalId + ";", objDBConfig.Database);
                        dataAdapter = new MySqlDataAdapter(command);
                        dataAdapter.SelectCommand = command;

                        objDataTable = new DataTable();
                        dataAdapter.Fill(objDataTable);
                        foreach (DataRow data in objDataTable.Rows)
                        {
                            objHospital = new Hospital
                            {
                                iHospitalId = (int)data["hospital_id"],
                                strName = data["name"].ToString(),
                                strPhoneNumber = data["phone"].ToString(),
                                strEmail = data["email"].ToString(),
                                strType = data["type"].ToString(),
                                strState = data["state"].ToString(),
                                strCity = data["city"].ToString(),
                                strAddress = data["address"].ToString(),
                            };
                        }
                        Constants.objHospital = objHospital;
                    }

                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return objUser;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

    }
}