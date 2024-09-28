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
    public partial class Permissions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Permission> GetPermissions()
        {
            PermissionsADO objPermissionsADO = new PermissionsADO();
            List<Permission> lstPermissions = objPermissionsADO.GetPermissions(Constants.objUser.iHospitalId);

            return lstPermissions;
        }

        [WebMethod]
        public static Permission GetLoggedUserPermission()
        {
            PermissionsADO objPermissionsADO = new PermissionsADO();
            Permission objPermission = null;
            if (Constants.objUser.strUserType != "User")
            {
                objPermission = objPermissionsADO.GetPermissionsById(Constants.objUser.iUserId);
            }
            return objPermission;
        }

        [WebMethod]
        public static bool UpdatePermissions(List<Permission> permissions)
        {
            PermissionsADO objPermissionsADO = new PermissionsADO();
            bool bResult = objPermissionsADO.UpdatePermissions(permissions);

            return bResult;
        }




    }
}