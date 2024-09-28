using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class AppointmentADO
    {
        DBConfig objDBConfig = new DBConfig();

        public int AddAppointment(int doctorId, int animalId, DateTime dtAppointmentDate)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    //insert into user table
                    string strQuery = "INSERT INTO appointments (doctor_id, animal_id, appointment_date, status) VALUES (@doctor_id, @animal_id, @appointment_date, @status);";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);
                    sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@doctor_id", doctorId);
                    sqlCommand.Parameters.AddWithValue("@animal_id", animalId);
                    sqlCommand.Parameters.AddWithValue("@appointment_date", dtAppointmentDate);
                    sqlCommand.Parameters.AddWithValue("@status", Appointment.enumAppointmentStatus.Pending);

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

        public List<AppointmentForDoctor> GetAppointments(int? iHospitalId)
        {
            try
            {
                List<AppointmentForDoctor> lstAppointmentForDoctors = new List<AppointmentForDoctor>();

                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "SELECT appoint.*, doctor.fname as doctorFName, doctor.lname as doctorLName, animal.specie, animal.breed, u2.fname as userFName, u2.lname as userLName FROM appointments appoint JOIN users doctor ON appoint.doctor_id = doctor.user_id JOIN animals animal ON appoint.animal_id = animal.animal_id JOIN users u2 ON u2.user_id = animal.user_id WHERE appoint.doctor_id in (select user_id from users where hospital_id = " + iHospitalId + " AND user_type = 'Doctor');";

                    MySqlCommand command = new MySqlCommand(strQuery, objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {
                        AppointmentForDoctor objAppointmentForDoctor = new AppointmentForDoctor();
                        int status = (int)data["status"];

                        objAppointmentForDoctor = new AppointmentForDoctor
                        {
                            iAppointmentId = (int)data["appointment_id"],
                            iDoctorId = (int)data["doctor_id"],
                            strDoctorFName = data["doctorFName"].ToString(),
                            strDoctorLName = data["doctorLName"].ToString(),
                            strUserFName = data["userFName"].ToString(),
                            strUserLName = data["userLName"].ToString(),
                            iAnimalId = (int)data["animal_id"],
                            strSpecie = data["specie"].ToString(),
                            strBreed = data["breed"].ToString(),
                            dtAppointmentDate = (DateTime)data["appointment_date"],
                            enumStatus = (AppointmentForDoctor.enumAppointmentStatus)status
                            //    iHospitalId = data["hospital_id"] != DBNull.Value ? (int)(data["hospital_id"]) : (int?)null,
                        };
                        lstAppointmentForDoctors.Add(objAppointmentForDoctor);
                    }

                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return lstAppointmentForDoctors;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool ApproveAppointment(int iAppointmentId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "Update appointments set status = @status where appointment_id = @id;";
                    MySqlCommand command = new MySqlCommand(strQuery, objDBConfig.Database);

                    command.Parameters.AddWithValue("@status", Appointment.enumAppointmentStatus.Approved);
                    command.Parameters.AddWithValue("@id", iAppointmentId);

                    iResult = Convert.ToInt32(command.ExecuteNonQuery());
                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return iResult > 0 ? true : false;
            }
            catch (Exception ex)
            {
                return false;   // error
            }
        }

        public bool RejectAppointment(int iAppointmentId)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "Update appointments set status = @status where appointment_id = @id;";
                    MySqlCommand command = new MySqlCommand(strQuery, objDBConfig.Database);

                    command.Parameters.AddWithValue("@status", Appointment.enumAppointmentStatus.Rejected);
                    command.Parameters.AddWithValue("@id", iAppointmentId);

                    iResult = Convert.ToInt32(command.ExecuteNonQuery());
                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                return iResult > 0 ? true : false;
            }
            catch (Exception ex)
            {
                return false;   // error
            }
        }


    }
}