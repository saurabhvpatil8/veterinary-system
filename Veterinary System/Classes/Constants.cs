using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

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


        public static void OnLoad()
        {
            string jsonFilePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "bin", "AnimalData.json");
            string strJSON = File.ReadAllText(jsonFilePath);

            objAnimalData = JsonConvert.DeserializeObject<AnimalData>(strJSON);
        }

    }
}