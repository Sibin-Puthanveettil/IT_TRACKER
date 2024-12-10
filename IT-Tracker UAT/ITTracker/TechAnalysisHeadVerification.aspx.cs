using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;
namespace ITTracker
{
    public partial class TechAnalysisHeadVerification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usr, bid, fimid, ipaddres, sessn;
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.Redirect("SessionExpired.aspx");
            }
            else
            {
                usr = Session["username"].ToString();
                bid = Session["branch_id"].ToString();
                fimid = Session["firm_id"].ToString();
                ipaddres = Session["system_ip"].ToString();
                sessn = Session["sessionkey"].ToString();
                this.hdUserId.Value = usr;
                this.hdBranchId.Value = bid;
                this.hdFirmId.Value = fimid;
                this.hdSesssion.Value = sessn;


                //hdPag.Value = Request.QueryString["pag"];
            }
        }
        public class getDropDownData
        {
            public string id { get; set; }
            
            public string name { get; set; }
        }

        [WebMethod(EnableSession = true)]
        public static List<getDropDownData> getFillData(string pageVal, string pageval1)
        {
            DataSet ds;
            List<getDropDownData> getData = new List<getDropDownData>();
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1,"", "", "");
            //PWA_Service.PWA_ServiceClient obj1 = new PWA_Service.PWA_ServiceClient();
            //ds = obj1.PwaSelectData("PWAAPP", pageVal, pageval1, "", "");
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        getData.Add(new getDropDownData()
                        {
                            id = dr[0].ToString(),
                            
                            name = dr[1].ToString()
                        });
                    }
                }
            }
            catch (Exception e)
            {

            }
            return getData;
        }
        [WebMethod(EnableSession = true)]
        public static string getcrfverificationcnt(string pageVal, string pageval1)
        {
            DataSet ds;
            string str = "";
            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    str = ds.Tables[0].Rows[0][0].ToString();
                }
            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string getdayscount(string pageVal, string pageval1)
        {
            DataSet ds;
            string str = "";
            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    str = ds.Tables[0].Rows[0][0].ToString();
                }
            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string getTableData(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            string str = "";
            ITTracker.ITService.ITServiceClient obj1 = new ITTracker.ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "", "");
            //PWA_Service.PWA_ServiceClient obj1 = new PWA_Service.PWA_ServiceClient();
            //ds = obj1.PwaSelectData("PWAAPP", pageVal, pageval1, pageval2, "");
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        string row1 = "";
                        foreach (DataColumn dc in ds.Tables[0].Columns)
                        {
                            row1 = row1 + dr[dc] + "µ";
                        }
                        str = str + row1 + "Θ";
                    }

                    if (pageVal == "TargetDateAndStatus")
                    {
                        // 1855~15-JAN-21µ1855~MD APPROVED ASSIGNED TO DEVELOPER¶1856~02-FEB-21µ1856~DEVELOPMENT COMPLETED
                        str = str.Replace("Θ", "");
                        //    string[] details = str.Split('µ');
                        //    str = "";
                        //    foreach (string s in details )
                        //    {


                        //    }

                    }

                }

            }
            return str;
        }

        [WebMethod(EnableSession = true)]
        public static string confirm(string pageVal, string pageval1, string pageval2)
        {
            string str = "";
            DataSet ds;
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "");
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    str = ds.Tables[0].Rows[0][0].ToString();
                    return str;
                }

            }
            catch (Exception e)
            {

            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string Accessibility(string pageVal, string pageval1)
        {
            string rslt = "";
            DataTable dt = new DataTable();

            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            dt = obj1.TrackerSelect(pageVal, pageval1, "", "", "").Tables[0];
            try
            {
                if (dt.Rows.Count > 0)
                {
                    rslt = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return rslt;
        }

    }
}