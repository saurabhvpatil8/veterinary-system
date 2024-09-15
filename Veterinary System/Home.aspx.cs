using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using Veterinary_System.ADO;
using Veterinary_System.Classes;

namespace Veterinary_System
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //drpSpecies.Items.Clear();

                //foreach (var species in objAnimalData.species)
                //{
                //    drpSpecies.Items.Add(species.name);
                //}
                //drpSpecies_SelectedIndexChanged();
            }
        }
        [WebMethod]
        public static List<string> GetAllSpecies()
        {
            List<string> lstSpecies = Constants.objAnimalData.species.Select(x => x.name).ToList();
            return lstSpecies;
        }

        [WebMethod]
        public static List<string> GetBreedBySpecie(string speciesName)
        {
            List<string> lstBreeds = Constants.objAnimalData.species.Where(x => x.name == speciesName).Select(x => x.breeds).FirstOrDefault();
            return lstBreeds;
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
        public static bool AddNewPet(Animal objAnimal)
        {
            objAnimal.iUserId = Constants.objUser.iUserId;
            Random rand = new Random();
            objAnimal.strAnimalNumber = DateTime.Now.ToString("ssHHddMMyy" + rand.Next(10, 99));
             
            ADO.AnimalADO AnimalADO = new ADO.AnimalADO();
            return AnimalADO.AddNewPet(objAnimal);
        }

        [WebMethod]
        public static List<Animal> GetAnimals()
        {
            ADO.AnimalADO objAnimalADO = new ADO.AnimalADO();
            List<Animal> lstAnimals = objAnimalADO.GetAnimalsByUserId(Constants.objUser.iUserId);

            return lstAnimals;
        }

        [WebMethod]
        public static List<HospitalsWithDoctors> GetHospitalWithDoctors(string strState, string strCity)
        {
            List<HospitalsWithDoctors> lstHospitalsWithDoctors = Constants.lstHospitalsWithDoctors;

            return lstHospitalsWithDoctors.Where(x => x.objHospital.strState == strState && x.objHospital.strCity == strCity).ToList();
        }

    }
}