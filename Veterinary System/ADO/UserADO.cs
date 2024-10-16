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

        public int AddDoctor(string name, string email, int? hospitalId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    //insert into user table
                    string strPassword = name + "@123";
                    string strQuery = "INSERT INTO users (fname, email, password, user_type, hospital_id) VALUES (@fname, @email, @password, @user_type, @hospital_id); select LAST_INSERT_ID();";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@fname", name);
                    sqlCommand.Parameters.AddWithValue("@email", email);
                    sqlCommand.Parameters.AddWithValue("@password", strPassword);
                    sqlCommand.Parameters.AddWithValue("@user_type", "Doctor");
                    sqlCommand.Parameters.AddWithValue("@hospital_id", hospitalId);

                    int iUserId = Convert.ToInt32(sqlCommand.ExecuteScalar());

                    //insert into permission table
                    strQuery = "INSERT INTO permission (user_id, dashboard, permission, billing) VALUES (@user_id, @dashboard, @permission, @billing);";
                    sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@user_id", iUserId);
                    sqlCommand.Parameters.AddWithValue("@dashboard", 1);
                    sqlCommand.Parameters.AddWithValue("@permission", 1);
                    sqlCommand.Parameters.AddWithValue("@billing", 1);

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

        public int AddCompounder(string name, string email, int? hospitalId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    //insert into user table
                    string strPassword = name.Replace(" ", "") + "@123";

                    string strQuery = "INSERT INTO users (fname, email, password, user_type, hospital_id) VALUES (@fname, @email, @password, @user_type, @hospital_id); select LAST_INSERT_ID();";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@fname", name);
                    sqlCommand.Parameters.AddWithValue("@email", email);
                    sqlCommand.Parameters.AddWithValue("@password", strPassword);
                    sqlCommand.Parameters.AddWithValue("@user_type", "Compounder");
                    sqlCommand.Parameters.AddWithValue("@hospital_id", hospitalId);

                    int iUserId = Convert.ToInt32(sqlCommand.ExecuteScalar());

                    //insert into permission table
                    strQuery = "INSERT INTO permission (user_id, dashboard, permission, billing) VALUES (@user_id, @dashboard, @permission, @billing);";
                    sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@user_id", iUserId);
                    sqlCommand.Parameters.AddWithValue("@dashboard", 0);
                    sqlCommand.Parameters.AddWithValue("@permission", 0);
                    sqlCommand.Parameters.AddWithValue("@billing", 0);

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
                Permission objPermission = null;

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
                            strState = data["state"].ToString(),
                            strCity = data["city"].ToString(),
                            strLName = data["lname"].ToString(),
                            strPhoneNo = data["phone_no"].ToString(),
                            strSpecialization = data["specialization"].ToString(),
                            strAddress = data["address"].ToString()
                        };
                    }
                    Constants.objUser = objUser;

                    if (objUser != null && objUser.strUserType != "User")
                    {
                        //Get Permissions
                        command = new MySqlCommand("select * from permission where user_id=" + objUser.iUserId + ";", objDBConfig.Database);
                        dataAdapter = new MySqlDataAdapter(command);
                        dataAdapter.SelectCommand = command;

                        objDataTable = new DataTable();
                        dataAdapter.Fill(objDataTable);
                        foreach (DataRow data in objDataTable.Rows)
                        {
                            objPermission = new Permission
                            {
                                iPermissionId = (int)data["permission_id"],
                                iUserId = (int)data["user_id"],
                                bDashboard = (int)data["dashboard"] == 0 ? false : true,
                                bPermission = (int)data["permission"] == 0 ? false : true,
                                bDiagnosis = (int)data["diagnosis"] == 0 ? false : true,
                                bBilling = (int)data["billing"] == 0 ? false : true
                            };
                        }
                        Constants.objPermission = objPermission;

                        //Get Hospital Data
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


        public bool UpdateUserData(User objUser, int iUserId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "UPDATE users SET email = @email, fname = @fname, lname = @lname, phone_no = @phone_no, specialization = @specialization, state = @state, city = @city, address = @address WHERE user_id = @user_id;";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@user_id", iUserId);
                    sqlCommand.Parameters.AddWithValue("@email", objUser.strEmail == "" ? null : objUser.strEmail);
                    sqlCommand.Parameters.AddWithValue("@fname", objUser.strFName == "" ? null : objUser.strFName);
                    sqlCommand.Parameters.AddWithValue("@lname", objUser.strLName == "" ? null : objUser.strLName);
                    sqlCommand.Parameters.AddWithValue("@phone_no", objUser.strPhoneNo == "" ? null : objUser.strPhoneNo);
                    sqlCommand.Parameters.AddWithValue("@specialization", objUser.strSpecialization == "" ? null : objUser.strSpecialization);
                    sqlCommand.Parameters.AddWithValue("@state", objUser.strState == "" ? null : objUser.strState);
                    sqlCommand.Parameters.AddWithValue("@city", objUser.strCity == "" ? null : objUser.strCity);
                    sqlCommand.Parameters.AddWithValue("@address", objUser.strAddress == "" ? null : objUser.strAddress);

                    iResult = Convert.ToInt32(sqlCommand.ExecuteNonQuery());

                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return iResult > 0 ? true : false;
            }
            catch (Exception ex)
            {   //error
                return false;
            }
        }

        public bool UpdateHospitalData(Hospital objHospital, int iHospitalId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "UPDATE hospitals SET name = @name, phone = @phone, email = @email, type = @type, state = @state, city = @city, address = @address WHERE hospital_id = @hospital_id;";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@hospital_id", iHospitalId);
                    sqlCommand.Parameters.AddWithValue("@name", objHospital.strName == "" ? null : objHospital.strName);
                    sqlCommand.Parameters.AddWithValue("@phone", objHospital.strPhoneNumber == "" ? null : objHospital.strPhoneNumber);
                    sqlCommand.Parameters.AddWithValue("@email", objHospital.strEmail== "" ? null : objHospital.strEmail);
                    sqlCommand.Parameters.AddWithValue("@type", objHospital.strType== "" ? null : objHospital.strType);
                    sqlCommand.Parameters.AddWithValue("@state", objHospital.strState == "" ? null : objHospital.strState);
                    sqlCommand.Parameters.AddWithValue("@city", objHospital.strCity == "" ? null : objHospital.strCity);
                    sqlCommand.Parameters.AddWithValue("@address", objHospital.strAddress == "" ? null : objHospital.strAddress);

                    iResult = Convert.ToInt32(sqlCommand.ExecuteNonQuery());

                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return iResult > 0 ? true : false;
            }
            catch (Exception ex)
            {   //error
                return false;
            }
        }

        //public List<Hospital> GetHospitalWithDoctors()
        //{
        //    List<Hospital> lstHospitalsWithDoctors = new List<Hospital>();
        //    DBConfig objDBConfig = new DBConfig();
        //    int iHospitalId = 0;

        //    try
        //    {
        //        int iResult = -1;
        //        using (objDBConfig.Database)
        //        {

        //            MySqlCommand command = new MySqlCommand("select * from hospitals;", objDBConfig.Database);
        //            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
        //            dataAdapter.SelectCommand = command;

        //            DataTable objDataTable = new DataTable();
        //            dataAdapter.Fill(objDataTable);
        //            foreach (DataRow data in objDataTable.Rows)
        //            {
        //                iHospitalId = (int)data["hospital_id"];

        //                ////////////just added uptill here, start from here bitch


        //                Hospital = new Hospital
        //                {

        //                    iUserId = (int)data["user_id"],
        //                    strUserType = data["user_type"].ToString(),
        //                    strEmail = data["email"].ToString(),
        //                    strPassword = data["password"].ToString(),
        //                    iHospitalId = data["hospital_id"] != DBNull.Value ? (int)(data["hospital_id"]) : (int?)null,
        //                    strFName = data["fname"].ToString(),
        //                    strLName = data["lname"].ToString(),
        //                    strPhoneNo = data["phone_no"].ToString(),
        //                    strSpecialization = data["specialization"].ToString(),
        //                    strAddress = data["address"].ToString()
        //                };
        //            }
        //        }



        //            if (objDBConfig.Database.State == ConnectionState.Closed)
        //                objDBConfig.Database.Open();

        //            string strQuery = "SELECT * FROM hospitals;";
        //            MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);
        //            iResult = Convert.ToInt32(sqlCommand.ExecuteNonQuery());


        //            if (objDBConfig.Database.State == ConnectionState.Open)
        //                objDBConfig.Database.Close();
        //        //}
        //        return lstHospitalsWithDoctors.Count > 0 ? lstHospitalsWithDoctors : null;
        //    }
        //    catch (Exception ex)
        //    {   //error
        //        return null;
        //    }

        //}

    }
}