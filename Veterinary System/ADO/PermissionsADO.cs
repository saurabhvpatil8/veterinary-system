using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Veterinary_System.Classes;

namespace Veterinary_System.ADO
{
    public class PermissionsADO
    {
        DBConfig objDBConfig = new DBConfig();


        public List<Permission> GetPermissions(int? iHospitalId)
        {
            try
            {
                List<Permission> lstPermissions = new List<Permission>();
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "SELECT permission.*, users.fname, users.lname FROM permission JOIN users ON permission.user_id = users.user_id WHERE users.user_type = 'Compounder'; ";

                    MySqlCommand command = new MySqlCommand(strQuery, objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {
                        Permission objPermission = new Permission();

                        objPermission = new Permission
                        {
                            iPermissionId = (int)data["permission_id"],
                            iUserId = (int)data["user_id"],
                            strCompounderFName = data["fname"].ToString(),
                            strCompounderLName = data["lname"].ToString(),
                            bPermission = (int)data["permission"] == 1 ? true : false,
                            bDashboard = (int)data["dashboard"] == 1 ? true : false,
                            bDiagnosis = (int)data["diagnosis"] == 1 ? true : false,
                            bBilling = (int)data["billing"] == 1 ? true : false,
                        };
                        lstPermissions.Add(objPermission);
                    }
                }
                return lstPermissions;
            }
            catch (Exception ex)
            {
                return null;   // error
            }
            finally
            {
                if (objDBConfig.Database.State == ConnectionState.Open)
                    objDBConfig.Database.Close();
            }
        }
        public Permission GetPermissionsById(int iUserId)
        {
            try
            {
                Permission objPermission = new Permission();
                using (objDBConfig.Database)
                {
                    if (objDBConfig.Database.State == ConnectionState.Closed)
                        objDBConfig.Database.Open();

                    string strQuery = "SELECT * from permission where user_id = " + iUserId;

                    MySqlCommand command = new MySqlCommand(strQuery, objDBConfig.Database);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    dataAdapter.SelectCommand = command;

                    DataTable objDataTable = new DataTable();
                    dataAdapter.Fill(objDataTable);
                    foreach (DataRow data in objDataTable.Rows)
                    {
                        objPermission = new Permission
                        {
                            iPermissionId = (int)data["permission_id"],
                            iUserId = (int)data["user_id"],
                            bPermission = (int)data["permission"] == 1 ? true : false,
                            bDashboard = (int)data["dashboard"] == 1 ? true : false,
                            bDiagnosis = (int)data["diagnosis"] == 1 ? true : false,
                            bBilling = (int)data["billing"] == 1 ? true : false,
                        };
                    }
                }
                return objPermission;
            }
            catch (Exception ex)
            {
                return null;   // error
            }
            finally
            {
                if (objDBConfig.Database.State == ConnectionState.Open)
                    objDBConfig.Database.Close();
            }

        }

        public bool UpdatePermissions(List<Permission> lstPermissions)
        {
            try
            {
                if (objDBConfig.Database.State == ConnectionState.Closed)
                    objDBConfig.Database.Open();
                using (MySqlTransaction transaction = objDBConfig.Database.BeginTransaction())
                {
                    foreach (var permission in lstPermissions)
                    {
                        string strQuery = "UPDATE permission SET dashboard = @dashboard, diagnosis = @diagnosis, billing = @billing WHERE permission_id = @permission_id;";
                     
                        using (MySqlCommand cmd = new MySqlCommand(strQuery, objDBConfig.Database, transaction))
                        {
                            cmd.Parameters.AddWithValue("@dashboard", permission.bDashboard == true ? 1 : 0);
                            cmd.Parameters.AddWithValue("@diagnosis", permission.bDiagnosis == true ? 1 : 0);
                            cmd.Parameters.AddWithValue("@billing", permission.bBilling == true ? 1 : 0);
                            cmd.Parameters.AddWithValue("@permission_id", permission.iPermissionId);

                            cmd.ExecuteNonQuery();
                        }
                    }
                    transaction.Commit();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;   // error
            }
            finally
            {
                if (objDBConfig.Database.State == ConnectionState.Open)
                    objDBConfig.Database.Close();
            }

        }
    }
}