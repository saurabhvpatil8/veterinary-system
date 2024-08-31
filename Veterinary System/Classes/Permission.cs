using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.Classes
{
    public class Permission
    {
        public int iPermissionId { get; set; }
        public int iUserId { get; set; }
        public bool bDashboard { get; set; }
        public bool bPermission { get; set; }
        public bool bBilling { get; set; }
    }
}