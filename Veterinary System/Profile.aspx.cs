using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veterinary_System.Classes;

namespace Veterinary_System
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetUserType()
        {
            return Constants.objUser.strUserType;
        }

        [WebMethod]
        public static User GetUserData()
        {
            return Constants.objUser;
        }

        [WebMethod]
        public static Hospital GetHospitalData()
        {
            return Constants.objHospital;
        }

        [WebMethod]
        public static List<string> GetAllStates()
        {
            List<string> lstStates = Constants.objCountryData.states.Select(x => x.name).ToList();
            return lstStates;
        }

        [WebMethod]
        public static List<string> GetCityByState(string stateName)
        {
            List<string> lstCities = Constants.objCountryData.states.Where(x => x.name == stateName).Select(x => x.cities).FirstOrDefault();
            return lstCities;
        }

        [WebMethod]
        public static bool UpdateUserData(User objUser)
        {
            ADO.UserADO objAnimalADO = new ADO.UserADO();
            return objAnimalADO.UpdateUserData(objUser, Constants.objUser.iUserId);
        }

        [WebMethod]
        public static bool UpdateHospitalData(Hospital objHospital)
        {
            ADO.UserADO objAnimalADO = new ADO.UserADO();
            return objAnimalADO.UpdateHospitalData(objHospital, Constants.objHospital.iHospitalId);
        }
    }
}