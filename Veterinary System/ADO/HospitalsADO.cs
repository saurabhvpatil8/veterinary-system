using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class HospitalsADO
    {

        public static List<HospitalsWithDoctors> GetHospitalsWithDoctors()
        {
            List<HospitalsWithDoctors> lstHospitalsWithDoctors = new List<HospitalsWithDoctors>();
            DBConfig objDBConfig = new DBConfig();

            try
            {
                using (objDBConfig.Database)
                {
                    MySqlCommand command = new MySqlCommand("select * from hospitals;", objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {
                        HospitalsWithDoctors objHospitalsWithDoctors = new HospitalsWithDoctors();
                        objHospitalsWithDoctors.objHospital = new Hospital();
                        objHospitalsWithDoctors.lstDoctors = new List<User>();

                        objHospitalsWithDoctors.objHospital.iHospitalId = (int)data["hospital_id"];
                        objHospitalsWithDoctors.objHospital.strName = data["name"].ToString();
                        objHospitalsWithDoctors.objHospital.strPhoneNumber = data["phone"].ToString();
                        objHospitalsWithDoctors.objHospital.strEmail = data["email"].ToString();
                        objHospitalsWithDoctors.objHospital.strType = data["type"].ToString();
                        objHospitalsWithDoctors.objHospital.strState = data["state"].ToString();
                        objHospitalsWithDoctors.objHospital.strCity = data["city"].ToString();
                        objHospitalsWithDoctors.objHospital.strAddress = data["address"].ToString();
                        //objHospitalsWithDoctors.objHospital.is = data["is_authenticate"];

                        MySqlCommand command2 = new MySqlCommand("select * from users where hospital_id = " + objHospitalsWithDoctors.objHospital.iHospitalId + " and user_type = 'Doctor';", objDBConfig.Database);
                        MySqlDataAdapter dataAdapter2 = new MySqlDataAdapter(command);
                        dataAdapter2.SelectCommand = command2;

                        DataTable objDataTable2 = new DataTable();
                        dataAdapter2.Fill(objDataTable2);
                        foreach (DataRow data2 in objDataTable2.Rows)
                        {
                            User objDoctor = new User();
                            objDoctor.iUserId = (int)data2["user_id"];
                            objDoctor.strUserType = data2["hospital_id"].ToString();
                            objDoctor.iHospitalId = (int)data2["hospital_id"];
                            objDoctor.strEmail = data2["email"].ToString();
                            objDoctor.strFName = data2["fname"].ToString();
                            objDoctor.strLName = data2["lname"].ToString();
                            objDoctor.strPhoneNo = data2["phone_no"].ToString();
                            objDoctor.strSpecialization = data2["specialization"].ToString();
                            objDoctor.strState = data2["state"].ToString();
                            objDoctor.strCity = data2["city"].ToString();
                            objDoctor.strAddress = data2["address"].ToString();
                            objHospitalsWithDoctors.lstDoctors.Add(objDoctor);
                        }
                        lstHospitalsWithDoctors.Add(objHospitalsWithDoctors);
                    }
                }

                //if (objDBConfig.Database.State == ConnectionState.Closed)
                //    objDBConfig.Database.Open();

                //string strQuery = "SELECT * FROM hospitals;";
                //MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);
                //iResult = Convert.ToInt32(sqlCommand.ExecuteNonQuery());


                if (objDBConfig.Database.State == ConnectionState.Open)
                    objDBConfig.Database.Close();
                //}
                return lstHospitalsWithDoctors.Count > 0 ? lstHospitalsWithDoctors : null;
            }
            catch (Exception ex)
            {   //error
                return null;
            }
        }
    }
}