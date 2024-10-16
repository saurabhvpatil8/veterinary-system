using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class DiagnosisADO
    {
        DBConfig objDBConfig = new DBConfig();

        public AnimalWithOwner SearchAnimalByNumber(string AnimalNumber)
        {
            try
            {
                AnimalWithOwner objAnimalWithOwner = new AnimalWithOwner();
                objAnimalWithOwner.objAnimal = new Animal();
                objAnimalWithOwner.objUser = new User();

                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    MySqlCommand command = new MySqlCommand("SELECT animals.*, users.fname, users.lname from animals join users on animals.user_id = users.user_id where animal_number = '" + AnimalNumber + "'; ", objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {

                        objAnimalWithOwner.objAnimal.iAnimalId = (int)data["animal_id"];
                        objAnimalWithOwner.objAnimal.strAnimalNumber = data["animal_number"].ToString();
                        objAnimalWithOwner.objAnimal.iUserId = (int)data["user_id"];
                        objAnimalWithOwner.objAnimal.strName = data["name"].ToString();
                        objAnimalWithOwner.objAnimal.strSpecie = data["specie"].ToString();
                        objAnimalWithOwner.objAnimal.strBreed = data["breed"].ToString();
                        objAnimalWithOwner.objAnimal.strGender = data["gender"].ToString();
                        objAnimalWithOwner.objAnimal.strWeight = data["weight"].ToString();
                        objAnimalWithOwner.objAnimal.dtBirthDate = (DateTime)data["birth_date"];
                        objAnimalWithOwner.objAnimal.strDescription = data["description"].ToString();
                        objAnimalWithOwner.objUser.strFName = data["fname"].ToString();
                        objAnimalWithOwner.objUser.strLName = data["lname"].ToString();
                    }

                }
                return objAnimalWithOwner;
            }
            catch (Exception ex)
            {
                return null;  //error
            }
            finally
            {
                if (objDBConfig.Database.State == ConnectionState.Open)
                    objDBConfig.Database.Close();
            }
        }

        public bool AddDiagnosisDetails(int iDoctorId, int iAnimalId, string strSymtoms, string strDosage, string strDescription, string strFollowUpDate)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();
                    int dosage = Convert.ToInt32(strDosage);
                    string strQuery = "INSERT INTO diagnoses (vet_id, animal_id, date, symptoms, dosage, description, follow_up_date) VALUES (@vet_id, @animal_id, @date, @symptoms, @dosage, @description, @follow_up_date);";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@vet_id", iDoctorId);
                    sqlCommand.Parameters.AddWithValue("@animal_id", iAnimalId);
                    sqlCommand.Parameters.AddWithValue("@date", DateTime.Now);
                    sqlCommand.Parameters.AddWithValue("@symptoms", strSymtoms);
                    sqlCommand.Parameters.AddWithValue("@dosage", dosage);
                    sqlCommand.Parameters.AddWithValue("@description", strDescription);
                    sqlCommand.Parameters.AddWithValue("@follow_up_date", strFollowUpDate);

                    iResult = sqlCommand.ExecuteNonQuery();
                    if (objDBConfig.Database.State == ConnectionState.Open)
                        objDBConfig.Database.Close();
                }
                if (iResult > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;  //error
            }
        }
    }
}