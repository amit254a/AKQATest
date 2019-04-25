using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace WebClient
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //PrintName("Amit Kumar", Convert.ToDecimal(128.45));
        }

        [System.Web.Services.WebMethod]
        public static string PrintName(string name, string Number)
        {
            decimal number = (string.IsNullOrEmpty(Number) ? 0 : Convert.ToDecimal(Number));
            EMPNAMEReference.EMPNameServiceClient sc = new EMPNAMEReference.EMPNameServiceClient();
            EMPNAMEReference.User u = sc.ConvertNameNumberinWords(name, number);

            return u.Name + " " + Environment.NewLine + u.Number.ToUpper();
        }
    }
}
