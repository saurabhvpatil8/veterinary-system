using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.Classes
{
    public class Animal
    {
        public int iAnimalId { get; set; }
        public string strAnimalNumber { get; set; }
        public int? iUserId { get; set; }
        public string strName { get; set; }
        public string strSpecie { get; set; }
        public string strBreed { get; set; }
        public string strGender { get; set; }
        public string strWeight { get; set; }
        public DateTime dtBirthDate { get; set; }
        public string strDescription { get; set; }
    }

    public class AnimalWithOwner
    {
        public Animal objAnimal { get; set; }
        public User objUser { get; set; }
    }
    public class AnimalData
    {
        public List<Species> species { get; set; }
    }
    public class Species
    {
        public string name { get; set; }
        public List<string> breeds { get; set; }
    }
}