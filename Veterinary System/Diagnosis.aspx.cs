using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veterinary_System.ADO;
using Veterinary_System.Classes;

namespace Veterinary_System
{
    public partial class Diagnosis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static AnimalWithOwner SearchAnimalByNumber(string animalNumber)
        {
            DiagnosisADO diagnosisADO = new DiagnosisADO();
            AnimalWithOwner objAnimalWithOwner = diagnosisADO.SearchAnimalByNumber(animalNumber);

            return objAnimalWithOwner;
        }

        [WebMethod]
        public static HospitalsWithDoctors GetHospitalWithDoctor()
        {
            int iHospitalId = Constants.objHospital.iHospitalId;
            return Constants.lstHospitalsWithDoctors.Where(x => x.objHospital.iHospitalId == iHospitalId).FirstOrDefault();
        }

        [WebMethod]
        public static string AddDiagnosisDetails(int iDoctorId, int iAnimalId, string strSymtoms, string strDosage, string strDescription, string strFollowUpDate)
        {
            DiagnosisADO diagnosisADO = new DiagnosisADO();
            bool bResult = diagnosisADO.AddDiagnosisDetails(iDoctorId, iAnimalId, strSymtoms, strDosage, strDescription, strFollowUpDate);



            return "success";
        }   

    }
}