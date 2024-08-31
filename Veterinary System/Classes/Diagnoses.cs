using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.Classes
{
    public class Diagnoses
    {
        public int iDiagnosesId { get; set; }
        public int iAnimalId { get; set; }
        public int iVetId { get; set; }
        public DateTime dtDiagnoses { get; set; }
        public string strSymptoms { get; set; }
        public string strDosage { get; set; }
        public string strDescription { get; set; }
        public DateTime dtFollowUp { get; set; }
    }
}