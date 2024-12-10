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
    public partial class MorningMeetingVerification : System.Web.UI.Page
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

        //[WebMethod(EnableSession = true)]
        //public static string getmomverificationrpt(string pageVal, string pageval1, string pageval2)
        //{
        //    DataSet ds;
        //    string str = "", str1 = "", str2 = "", str3 = "", str4 = "", str5 = "", str6 = "", str7 = "", str8 = "", str9 = "";
        //    string rslt = "";
        //    ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
        //    ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "");
        //    try
        //    {
        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
        //            str = ds.Tables[0].Rows[0][0].ToString();
        //            str1 = ds.Tables[0].Rows[0][1].ToString();
        //            str2 = ds.Tables[0].Rows[0][2].ToString();
        //            str3 = ds.Tables[0].Rows[0][3].ToString();
        //            str4 = ds.Tables[0].Rows[0][4].ToString();
        //            str5 = ds.Tables[0].Rows[0][5].ToString();
        //            str6 = ds.Tables[0].Rows[0][6].ToString();
        //            str7 = ds.Tables[0].Rows[0][7].ToString();
        //            str8 = ds.Tables[0].Rows[0][8].ToString();
        //            str9 = ds.Tables[0].Rows[0][8].ToString();
        //            rslt = str + 'æ' + str1 + 'æ' + str2 + 'æ' + str3 + 'æ' + str4 + 'æ' + str5 + 'æ' + str6 + 'æ' + str7 + 'æ' + str8 + 'æ' + str9;

        //        }

        //    }
        //    catch (Exception e)
        //    {

        //    }
        //    return rslt;

        //}
        [WebMethod(EnableSession = true)]
        public static string getmomverificationrpt(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            string str = "", str1 = "", str2 = "", str3 = "", str4 = "", str5 = "", str6 = "", str7 = "", str8 = "", str9 = "";
            string rslt = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "");
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        rslt = rslt + dr[0].ToString() + '*' + dr[1].ToString() + '*' + dr[2].ToString() + '*' + dr[3].ToString() + '*' + dr[4].ToString() + '*' + dr[5].ToString() + '*' + dr[6].ToString() + '*' + dr[7].ToString() + '*' + dr[8].ToString() + '*' + dr[9].ToString() + "§";

                        
                    }

                }

            }
            catch (Exception e)
            {

            }
            return rslt;

        }

        [WebMethod(EnableSession = true)]
        public static string momverificationconfirm(string pageVal, string pageval1, string pageval2)
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
