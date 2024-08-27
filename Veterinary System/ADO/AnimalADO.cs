using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class AnimalADO
    {
        DBConfig objDBConfig = new DBConfig();
        public bool AddNewPet(Animal objAnimal)
        {
            try
            {
                int iResult = -1;
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "INSERT INTO animals (animal_number, user_id, name, specie, breed, gender, weight, birth_date, description) VALUES (@animal_number, @user_id, @name, @specie, @breed, @gender, @weight, @birth_date, @description);";
                    MySqlCommand sqlCommand = new MySqlCommand(strQuery, objDBConfig.Database);

                    sqlCommand.Parameters.AddWithValue("@animal_number", objAnimal.iAnimalNumber);
                    sqlCommand.Parameters.AddWithValue("@user_id", objAnimal.iUserId);
                    sqlCommand.Parameters.AddWithValue("@name", objAnimal.strName);
                    sqlCommand.Parameters.AddWithValue("@specie", objAnimal.strSpecie);
                    sqlCommand.Parameters.AddWithValue("@breed", objAnimal.strBreed);
                    sqlCommand.Parameters.AddWithValue("@gender", objAnimal.strGender);
                    sqlCommand.Parameters.AddWithValue("@weight", objAnimal.strWeight);
                    sqlCommand.Parameters.AddWithValue("@birth_date", objAnimal.dtBirthDate);
                    sqlCommand.Parameters.AddWithValue("@description", objAnimal.strDescription);

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