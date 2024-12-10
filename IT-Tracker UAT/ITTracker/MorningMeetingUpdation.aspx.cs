using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace ITTracker
{
    public partial class MorningMeetingUpdation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usr, fimid;
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.Redirect("SessionExpired.aspx");
            }
            else
            {
                usr = Session["username"].ToString();
                fimid = Session["firm_id"].ToString();
                this.hdUserId.Value = usr;
                this.hdFirmId.Value = fimid;
               
            }

        }
        public class getDropDownData
        {
            public string id { get; set; }
            public string name { get; set; }
        }

        [WebMethod(EnableSession = true)]
        public static List<getDropDownData> getFillData(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            List<getDropDownData> getData = new List<getDropDownData>();
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "", "");
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
        public static string getFileData(string pageVal, string pageval1, string pageval2)
        {
            DataTable dt = new DataTable();
            string rslt = "";


            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            dt = obj1.TrackerSelect(pageVal, pageval1, pageval2, "", "").Tables[0];
            try
            {
                if (dt.Rows.Count > 0)
                {
                    rslt = dt.Rows[0][0].ToString();
                }
                return rslt;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        [WebMethod(EnableSession = true)]
        public static string getcount(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            string str = "", str1="", str2 = "", str3 = "";
            string rslt = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "");
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    str = ds.Tables[0].Rows[0][0].ToString();
                    str1 = ds.Tables[0].Rows[0][1].ToString();
                    str2 = ds.Tables[0].Rows[0][2].ToString();
                    str3 = ds.Tables[0].Rows[0][3].ToString();
                    rslt = str + 'æ' + str1 + 'æ' + str2 + 'æ' + str3;
                   
                }
               
            }
            catch (Exception e)
            {

            }
            return rslt;

        }
        [WebMethod(EnableSession = true)]
        public static string momupdationconfirm(string pageVal,string pageval1, string pageval2)
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


    }
}