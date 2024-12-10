using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Net.Mail;
using System.Drawing.Imaging;
using System.Text;

namespace ITTracker
{
    public partial class PostReleaseUpdationManual : System.Web.UI.Page
    {
        private static string imagePath;

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
                this.hdnSystemIP.Value = ipaddres;
                this.hdSesssion.Value = sessn;
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
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
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
        public static string getRequestNote(string pageVal, string pageval1, string pageval2)
        {
            DataSet ds;
            string str = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "", "");

            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    str = ds.Tables[0].Rows[0][0].ToString();
                }

            }
            catch (Exception e)
            {
                return e.Message;
            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string Confirmdata(string pageVal, string pageval1, string pageval2, string pageval3)
        {
            DataSet ds, ds1, ds2;
            string cc = "";
            string str = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, pageval3, "");
            List<string> ccList = new List<string>();

            string[] notes = pageval2.Split('§');
            string noteid = notes[0].ToString();

            try
            {
                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        str = ds.Tables[0].Rows[0][0].ToString();

                        try
                        {

                            DataTable dt1, dt2, dt3, dt4;
                            dt1 = obj1.TrackerSelect("GetEmailNoteRequest", noteid, "", "", "").Tables[0];
                            string reqmailid = dt1.Rows[0][0].ToString() + "@manappuram.com";
                            string reqname = dt1.Rows[0][1].ToString();
                            string reqdate = dt1.Rows[0][2].ToString();

                            dt4 = obj1.TrackerSelect("GetEmailNoteHOD", noteid, "", "", "").Tables[0];
                            string hodmailid = dt4.Rows[0][0].ToString() + "@manappuram.com";


                            dt2 = obj1.TrackerSelect("GetEmailReviewNext", noteid, "", "", "").Tables[0];
                            string NextReviewrsId = dt2.Rows[0][0].ToString();
                            string NextReviewrsName = dt2.Rows[0][1].ToString();

                            dt3 = obj1.TrackerSelect("GetApprovedRDLCheader", noteid, "", "", "").Tables[0];
                            string tblHead = ExportDatatableToHtmlHeading(dt3);
                            string[] NextReviewrs = NextReviewrsId.Split(',');
                            string[] reviwnames = NextReviewrsName.Split(',');
                            int j = 0;
                            if (dt1.Rows.Count > 0)
                            {
                                string imageUrlLog = GetImageUrl("files/img/manappuram_logo.png");
                                string imageContentLog = "<img src='" + imageUrlLog + "' alt='Alternate Text' />";
                                string imageUrlPaperless = GetImageUrl("files/img/paperlessBanner.png");
                                string imageContentPaperless = "<img src='" + imageUrlPaperless + "' alt='Alternate Text' />";


                                if (NextReviewrs.Length > 0)
                                {
                                    foreach (string i in NextReviewrs)
                                    {

                                        string revwmailid = i.ToString() + "@manappuram.com";
                                        string revwname = reviwnames[j].ToString();
                                        j = j + 1;
                                        ccList.Add(revwmailid);
                                        cc = revwmailid + ";" + cc;
                                    }
                                    cc = hodmailid + ";" + cc;
                                    string bdy = "<p style='font-family: Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);'>Dear " + reqname + ",<br/><br/> CRF - Live & Closed <b>" + reqdate + ".</b><br/><br/> <br/><br/><u><b>CRF Details</b></u><br/><br/> " + tblHead + " <br/><br/><br/><br/>  Thanks & Regards,<br/>IT Portal<br/><span style = 'font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:gray' lang='EN-IN'>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</span></p>" + imageContentLog + "   " + imageContentPaperless + "<p><span style = 'color:rgb(105,105,105); font-size:7pt; font-family:arial,sans-serif; line-height:normal; background-color:rgba(0,0,0,0)' >Please be aware that this email/attachment contains MAFIL confidential/sensitive data. You are requested to follow MAFIL Information Security and data sharing policies in case the data is shared further. Feel free to contact AGM Information Security when youare in doubt.</span></p>";
                                    string subj = "CRF -: " + noteid + " - Live & Closed";
                                    string dtls = "10µ" + reqmailid + "µ" + cc + "µµ" + subj + "µ" + noteid + "µAMS";
                                    //SendMail(reqmailid, ccList, bdy, subj);
                                    ///ds1 = obj1.TrackerSelect("InsertEmail", "InsertEmail", dtls, "", bdy);

                                }

                            }
                        }
                        catch (Exception ef)
                        {
                            //return ef.Message;
                            string msg = ef.Message;
                        }

                    }
                    else
                        str = "0";
                }
                else
                    str = "0";

            }
            catch (Exception e)
            {
                return e.Message;
            }
            return str;
        }

        private static string ExportDatatableToHtmlHeading(DataTable dt3)
        {
            throw new NotImplementedException();
        }

        private static string GetImageUrl(string v)
        {
            //System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(imagePath));
            System.Drawing.Image image = System.Drawing.Image.FromFile(System.Web.HttpContext.Current.Server.MapPath(imagePath));
            MemoryStream memoryStream = new MemoryStream();
            image.Save(memoryStream, ImageFormat.Png);
            Byte[] bytes = new Byte[memoryStream.Length];
            memoryStream.Position = 0;
            memoryStream.Read(bytes, 0, (int)bytes.Length);
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            string imageUrl = "data:image/png;base64," + base64String;
            return imageUrl;
        }
        [WebMethod(EnableSession = true)]
        public static string getpath(string pageVal, string pageval1)
        {
            DataSet ds;
            string str = "";
            string str1 = "";
            string str2 = "";

            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");

            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //str = ds.Tables[0].Rows[0][0].ToString();

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        //str = dr[0].ToString() + "±" + dr[0].ToString();

                        str1 += dr[0].ToString() + ",";
                        str2 += dr[1].ToString() + ",";

                        //str = ds.Tables[0].Rows[0][0].ToString();
                    }

                    str = str1 + "§" + str2;
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string UploadingFiles(string ImageData, string InputData)
        {
            String InputDataDecrypted = ClientsideEncryption.AESEncrytDecry.DecryptStringAES(InputData);
            //List<string> extentions = new List<string>();
            //extentions.Add("913020010321699");

            List<string> extentions = new List<string>();

            extentions.InsertRange(extentions.Count, new string[] { "pdf", "jpg", "gif", "jpeg", "bmp", "tif", "tiff", "png", "xps", "doc", "docx", "fax", "wmp", "ico", "txt", "rtf", "xls", "xlsx", "ppt", "pptx", "odc", "odt" });

            string InputDataExt = InputDataDecrypted.Split('µ')[2];
            try
            {
                if (extentions.Contains(InputDataExt))
                {
                    string result = "";
                    string InputString = ImageData.Split(',')[1];
                    Byte[] imgByte = Convert.FromBase64String(InputString);
                    ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
                    result = obj1.TrackerDocumentUpload("52", InputDataDecrypted, imgByte);
                    return result;
                }
                else
                {
                    return "666";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
    }
}