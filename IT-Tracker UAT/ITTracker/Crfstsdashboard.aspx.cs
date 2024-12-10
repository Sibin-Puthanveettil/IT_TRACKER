using ITTacker;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace ITTracker
{
    public partial class Crfstsdashboard : System.Web.UI.Page
    {
        public void Page_Init(object o, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)





        {
            string usr, bid, fimid;
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.Redirect("SessionExpired.aspx");
            }
            else
            {
                //TMS_Service.TMS_ServiceClient obj = new TMS_Service.TMS_ServiceClient();
                //DataTable dt = new DataTable();
                //string user = Session["username"].ToString();
                //string result = obj.TestService("", user);
                //DataTable alertdt = new DataTable();
                //alertdt = obj.TreasuryFillData("TRESURYLOAN", "getAlertCount", user, "").Tables[0];
                //if (alertdt.Rows.Count > 0)
                //{
                //    alertPending.InnerHtml = alertdt.Rows[0][0].ToString();
                //}
                usr = Session["username"].ToString();
                bid = Session["branch_id"].ToString();
                fimid = Session["firm_id"].ToString();
               // teamid= Session["teamid"].ToString();
                this.hdUserId.Value = usr;
                this.hdBranchId.Value = bid;
                this.hdFirmId.Value = fimid;
                //this.hdteamid.Value = teamid;
            }
        }

        public class getListData
        {
            public string lst { get; set; }
        }

        [WebMethod(EnableSession = true)]
        public static string getcrfsts(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            string str = "";
            int i = 0;
            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
          //  ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
            ds = obj1.TrackerSelect("badashbd", pageVal, pageval1, "", "");
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                    //{
                    //    if (pageVal == "GetWorkVerifyAlert" || pageVal == "GeneralP" || pageVal == "TakingCount")
                    //        str = ds.Tables[0].Rows[0][0].ToString();
                    //    else
                    //        str = str + Convert.ToString(ds.Tables[0].Rows[i][0]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][1]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][2]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][3]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][4]) +"^"+ Convert.ToString(ds.Tables[0].Rows[i][5])+ "~";
                    //   i = i + 1;
                    //    //str = str + ds.Tables[0].Rows[i][0].ToString() + "~" + ds.Tables[0].Rows[i][3].ToString() + "µ";
                    //   // str = ds.Tables[0].Rows[0][0].ToString();
                    //}
                    foreach(DataRow dr in ds.Tables[0].Rows)
                    {
                        str = str + Convert.ToString(ds.Tables[0].Rows[i][0]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][1]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][2]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][3]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][4]) + "^" + Convert.ToString(ds.Tables[0].Rows[i][5]) + "~";
                       i = i + 1;
                    }
                }

            }
            catch (Exception e)
            {

            }
            return str;

        }

        

        [WebMethod(EnableSession = true)]
        public static string getaccess(string pageVal, string pageval1)
        {

            DataSet ds;
            DataTable dt = new DataTable();

            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
            ds = obj1.TrackerSelect("badashbd", pageVal, pageval1, "", "");


          
            dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0][0].ToString();
            }
            else

            { return "NA"; }

        }

        [WebMethod(EnableSession = true)]
        public static string PendingWorkVerify(string pageVal, string pageval1)
        {
            DataSet ds;
            string str = "";
            int i = 0;
            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
            try
                {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        if (pageVal == "GetWorkVerifyAlert" || pageVal == "GeneralP" || pageVal == "TakingCount")
                            str = ds.Tables[0].Rows[0][0].ToString();
                        else
                            str = str + ds.Tables[0].Rows[i][0].ToString() + "~" + ds.Tables[0].Rows[i][3].ToString() + "µ";
                    }
                }

            }
            catch (Exception e)
            {

            }
            return str;

        }




    }
}