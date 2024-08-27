using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
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
        public static bool AddNewPet(Animal objAnimal)
        {
            objAnimal.iUserId = Constants.objUser.iUserId;
            Random rand = new Random();
            objAnimal.iAnimalNumber = DateTime.Now.ToString("ssHHddMMyy" + rand.Next(10, 99));

            ADO.AnimalADO AnimalADO = new ADO.AnimalADO();
            return AnimalADO.AddNewPet(objAnimal);
        }
    }
}