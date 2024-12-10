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
    public partial class SourceCodeReview : System.Web.UI.Page
    {
        public static string editContent;
        public void Page_Init(object o, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

            Response.Cache.SetNoStore();
        }

        
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
                            
                            name = dr[1].ToString(),
                            
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
        public static string getReturnStatus(string pageVal)
        {
            DataSet ds;
            string str = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect("GetCrfReturnStatus",pageVal, "", "", "");

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
        public static string getFileData(string pageVal, string pageval1, string pageval2)
        {
            try
            {

                DataSet ds;
                string str = "";
                byte[] fileByt;
                ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
                ds = obj1.TrackerSelect(pageVal, pageval1, pageval2, "", "");

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            string row1 = "";
                            string DocFileName = "";
                            foreach (DataColumn dc in ds.Tables[0].Columns)
                            {
                                if (dc.ColumnName == "FILE_NAME")
                                {
                                    DocFileName = dr[dc].ToString();
                                    row1 = row1 + dr[dc] + "µ";

                                }
                                else if (dc.ColumnName == "FILE_DOC")
                                {
                                    fileByt = (byte[])(dr[dc]);
                                    CRFHODApprove d = new CRFHODApprove();
                                    d.DownloadFile(pageval2 + DocFileName, fileByt);
                                    row1 = row1 + DocFileName + "µ";
                                }
                                
                                else
                                {
                                    row1 = row1 + dr[dc] + "µ";
                                }

                            }
                            str = str + row1 + "Θ";
                        }

                    }

                }
                return str;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }



        [WebMethod(EnableSession = true)]
        public static string UploadingFiles(string ImageData, string InputData)
        {
            String InputDataDecrypted = ClientsideEncryption.AESEncrytDecry.DecryptStringAES(InputData);
            

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

                    result = obj1.TrackerDocumentUpload("51", InputDataDecrypted, imgByte);
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


        
        [WebMethod(EnableSession = true)]
        public static string confirm(string pageVal, string pageval1, string pageval2, string pageval3)
        {
            DataSet ds;
            string str = "";
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageVal, pageval1, pageval2, pageval3);
            
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



    }
}