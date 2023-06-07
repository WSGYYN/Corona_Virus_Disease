using System.Web;
using System.Web.Mvc;

namespace Corona_Virus_Disease
{
	public class FilterConfig
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			filters.Add(new HandleErrorAttribute());
		}
	}
}
