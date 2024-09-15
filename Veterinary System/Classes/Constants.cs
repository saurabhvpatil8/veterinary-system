using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Veterinary_System.ADO;

namespace Veterinary_System.Classes
{
    public class Constants
    {
        public static User objUser
        {
            get
            { return (User)HttpContext.Current.Session["User"]; }
            set
            { HttpContext.Current.Session["User"] = value; }
        }
        public static Permission objPermission
        {
            get
            { return (Permission)HttpContext.Current.Session["Permission"]; }
            set
            { HttpContext.Current.Session["Permission"] = value; }
        }
        public static AnimalData objAnimalData
        {
            get
            { return (AnimalData)HttpContext.Current.Session["AnimalData"]; }
            set
            { HttpContext.Current.Session["AnimalData"] = value; }
        }
        public static Hospital objHospital
        {
            get
            { return (Hospital)HttpContext.Current.Session["Hospital"]; }
            set
            { HttpContext.Current.Session["Hospital"] = value; }
        }

        public static CountryData objCountryData
        {
            get
            { return (CountryData)HttpContext.Current.Session["CountryData"]; }
            set
            { HttpContext.Current.Session["CountryData"] = value; }
        }

        public static List<HospitalsWithDoctors> lstHospitalsWithDoctors
        {
            get
            { return (List<HospitalsWithDoctors>)HttpContext.Current.Session["HospitalsWithDoctors"]; }
            set
            { HttpContext.Current.Session["HospitalsWithDoctors"] = value; }
        }

        public static void OnLoad()
        {
            string jsonFilePathAnimalData = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "bin", "AnimalData.json");
            string strJSONAnimalData = File.ReadAllText(jsonFilePathAnimalData);
            objAnimalData = JsonConvert.DeserializeObject<AnimalData>(strJSONAnimalData);

            string jsonFilePathStateCity = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "bin", "statecity.json");
            string strJSONStateCity = File.ReadAllText(jsonFilePathStateCity);
            objCountryData = JsonConvert.DeserializeObject<CountryData>(strJSONStateCity);

            lstHospitalsWithDoctors = HospitalsADO.GetHospitalsWithDoctors();

        }

    }

    public class CountryData
    {
        public List<State> states { get; set; }
    }
    public class State
    {
        public string name { get; set; }
        public List<string> cities { get; set; }
    }
}