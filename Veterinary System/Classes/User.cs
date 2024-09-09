using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.Classes
{
    public class User
    {
        public int iUserId { get; set; }
        public string strUserType { get; set; }
        public int? iHospitalId { get; set; }
        public string strEmail { get; set; }
        public string strPassword { get; set; }
        public string strFName { get; set; }
        public string strLName { get; set; }
        public string strPhoneNo { get; set; }
        public string strState { get; set; }
        public string strCity { get; set; }
        public string strSpecialization { get; set; }
        public string strAddress { get; set; }
    }
}