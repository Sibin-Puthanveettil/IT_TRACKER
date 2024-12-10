﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Services;


namespace ITTracker
{
    public partial class pmoverification : System.Web.UI.Page
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
            ds = obj1.TrackerSelect(pageVal, pageval1, "", "", "");
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
        public static List<getDropDownData> Getexmodule(string pageVal, string pageval1)
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
        public static string getFileData(string pageVal, string pageval1, string pageval2)
        {
            try
            {

                DataSet ds;
                string str = "";
                byte[] fileByt;
                ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
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
                            string DocFileName = "";
                            foreach (DataColumn dc in ds.Tables[0].Columns)
                            {
                                //str1 = dr[dc].ToString();
                                //1µ2µ3µ4µ8µ
                                if (dc.ColumnName == "FILE_NAME")
                                {
                                    DocFileName = dr[dc].ToString();
                                    row1 = row1 + dr[dc] + "µ";

                                }
                                else if (dc.ColumnName == "FILE_DATA")
                                {
                                    fileByt = (byte[])(dr[dc]);
                                    CRFHODApprove d = new CRFHODApprove();
                                    d.DownloadFile(pageval2 + DocFileName, fileByt);
                                    //return DocFileName;
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
        public void DownloadFile(string fn, byte[] s)
        {
            string FileName = fn;
            System.Web.HttpResponse Response = System.Web.HttpContext.Current.Response;
            using (Stream file = File.OpenWrite(Server.MapPath("~/Images/" + fn)))
            {
                file.Write(s, 0, s.Length);
            }
        }
        [WebMethod(EnableSession = true)]
        public static string PMOConfirm(string pageVal, string pageval1, string pageval2, string pageval3)
        {
            DataSet ds, ds1, ds2, ds3;
            string str = "";
            string bdy, subj, dtls;
            ITService.ITServiceClient obj1 = new ITService.ITServiceClient();
            ds = obj1.TrackerSelect(pageVal, pageVal, pageval1,  "","");
            //PWA_Service.PWA_ServiceClient obj1 = new PWA_Service.PWA_ServiceClient();
            //ds = obj1.PwaSelectData("PWAAPP", pageVal, pageval1, pageval2, newcontent);

            string[] notes = pageval1.Split('µ');
            string noteid = notes[1].ToString();


            try
            {
                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        str = ds.Tables[0].Rows[0][0].ToString();

                        try
                        {

                            DataTable dt1, dt2, dt3;
                            dt1 = obj1.TrackerSelect("GetEmailNoteRequest", noteid, "", "", "").Tables[0];
                            string reqmailid = dt1.Rows[0][0].ToString() + "@manappuram.com";
                            string reqname = dt1.Rows[0][1].ToString();
                            string reqdate = dt1.Rows[0][2].ToString();

                            dt2 = obj1.TrackerSelect("GetEmailReviewNext", noteid, "", "", "").Tables[0];
                            string NextReviewrsId = dt2.Rows[0][0].ToString();
                            string NextReviewrsName = dt2.Rows[0][1].ToString();

                            dt3 = obj1.TrackerSelect("GetApprovedRDLCheader", noteid, "", "", "").Tables[0];
                            string tblHead = ExportDatatableToHtmlHeading(dt3);
                            string[] NextReviewrs = NextReviewrsId.Split(',');
                            string[] reviwnames = NextReviewrsName.Split(',');
                            int j = 0;
                            if (NextReviewrs.Length > 0)
                            {
                                foreach (string i in NextReviewrs)
                                {

                                    string revwmailid = i.ToString() + "@manappuram.com";
                                    string revwname = reviwnames[j].ToString();
                                    string imageUrlLog = GetImageUrl("files/img/manappuram_logo.png");
                                    string imageContentLog = "<img src='" + imageUrlLog + "' alt='Alternate Text' />";

                                    string imageUrlPaperless = GetImageUrl("files/img/paperlessBanner.png");
                                    string imageContentPaperless = "<img src='" + imageUrlPaperless + "' alt='Alternate Text' />";
                                    if (pageval2 == "1")
                                    {
                                        bdy = "<p style='font-family: Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);'>Dear " + revwname + ",<br/><br/> A CRF has been assigned for Technical Analysis <br/>Kindly process the same at the earliest. <br/> <br/><br/><u><b>CRF Details</b></u><br/><br/> " + tblHead + " <br/><br/><br/><br/>  Thanks & Regards,<br/>IT Portal<br/><span style = 'font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:gray' lang='EN-IN'>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</span></p>" + imageContentLog + "   " + imageContentPaperless + "<p><span style = 'color:rgb(105,105,105); font-size:7pt; font-family:arial,sans-serif; line-height:normal; background-color:rgba(0,0,0,0)' >Please be aware that this email/attachment contains MAFIL confidential/sensitive data. You are requested to follow MAFIL Information Security and data sharing policies in case the data is shared further. Feel free to contact AGM Information Security when youare in doubt.</span></p>";
                                        subj = "CRF -: " + noteid + " - Assigned for TA";
                                        dtls = "10µ" + revwmailid + "µ" + reqmailid + "µµ" + subj + "µ" + noteid + "µAMS";
                                    }
                                    else if (pageval2 == "2")
                                    {
                                        string mtime, mdate;
                                        mdate = notes[4].ToString();
                                        mtime = notes[5].ToString();
                                        bdy = "<p style='font-family: Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);'>Dear " + revwname + ",<br/><br/> A CRF need to discuss on <b>" + mdate + "</b> at <b>" + mtime + ".</b> <br/>the earliest. <br/> <br/><br/><u><b>CRF Details</b></u><br/><br/> " + tblHead + " <br/><br/><br/><br/>  Thanks & Regards,<br/>IT Portal<br/><span style = 'font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:gray' lang='EN-IN'>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</span></p>" + imageContentLog + "   " + imageContentPaperless + "<p><span style = 'color:rgb(105,105,105); font-size:7pt; font-family:arial,sans-serif; line-height:normal; background-color:rgba(0,0,0,0)' >Please be aware that this email/attachment contains MAFIL confidential/sensitive data. You are requested to follow MAFIL Information Security and data sharing policies in case the data is shared further. Feel free to contact AGM Information Security when youare in doubt.</span></p>";
                                        subj = "CRF -: " + noteid + " - PMO Need Discussion";
                                        dtls = "10µ" + revwmailid + "µ" + reqmailid + "µµ" + subj + "µ" + noteid + "µAMS";

                                    }
                                    else if (pageval2 == "4")
                                    {

                                        bdy = "<p style='font-family: Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);'>Dear " + reqname + ",<br/><br/> Need to edit content.</b> <br/>the earliest. <br/> <br/><br/><u><b>CRF Details</b></u><br/><br/> " + tblHead + " <br/><br/><br/><br/>  Thanks & Regards,<br/>IT Portal<br/><span style = 'font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:gray' lang='EN-IN'>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</span></p>" + imageContentLog + "   " + imageContentPaperless + "<p><span style = 'color:rgb(105,105,105); font-size:7pt; font-family:arial,sans-serif; line-height:normal; background-color:rgba(0,0,0,0)' >Please be aware that this email/attachment contains MAFIL confidential/sensitive data. You are requested to follow MAFIL Information Security and data sharing policies in case the data is shared further. Feel free to contact AGM Information Security when youare in doubt.</span></p>";
                                        subj = "CRF -: " + noteid + " - Returned by PMO";
                                        dtls = "10µ" + reqmailid + "µµµ" + subj + "µ" + noteid + "µAMS";

                                    }
                                    else
                                    {
                                        bdy = "<p style='font-family: Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);'>Dear " + reqname + ",<br/><br/> A CRF Rejected by PMO.<br/><br/> <br/><br/><u><b>CRF Details</b></u><br/><br/> " + tblHead + " <br/><br/><br/><br/>  Thanks & Regards,<br/>IT Portal<br/><span style = 'font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:gray' lang='EN-IN'>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</span></p>" + imageContentLog + "   " + imageContentPaperless + "<p><span style = 'color:rgb(105,105,105); font-size:7pt; font-family:arial,sans-serif; line-height:normal; background-color:rgba(0,0,0,0)' >Please be aware that this email/attachment contains MAFIL confidential/sensitive data. You are requested to follow MAFIL Information Security and data sharing policies in case the data is shared further. Feel free to contact AGM Information Security when youare in doubt.</span></p>";
                                        subj = "CRF -: " + noteid + " - Rejected by PMO";
                                        dtls = "10µ" + reqmailid + "µ" + revwmailid + "µµ" + subj + "µ" + noteid + "µAMS";

                                    }

                                    ds2 = obj1.TrackerSelect("InsertEmail", "InsertEmail", dtls, "", bdy);
                                    j = j + 1;
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
                    {
                        str = "0";
                    }
                }
                else
                {
                    str = "0";
                }

            }
            catch (Exception e)
            {
                return e.Message;
            }
            return str;
        }
        [WebMethod(EnableSession = true)]
        public static string ExportDatatableToHtmlHeading(DataTable dt)
        {
            StringBuilder strHTMLBuilder = new StringBuilder();
            strHTMLBuilder.Append("<table style='border: 1px solid #ccc;width: 100%;'>");
            //strHTMLBuilder.Append("<thead><tr style='background-color: #f2f2f2;background-color: #3498db;color: white;font-size: 12pt;font-weight: bold; '><th>Reviewer Name</th><th>Designation </th><th>Department</th><th>Status</th><th >Updated Date</th><th>Remarks</th></tr></thead>");
            strHTMLBuilder.Append("<thead>");
            strHTMLBuilder.Append("<tr style='background-color: #d98fe3;color: black;font-size: 10pt;font-weight: bold; border: 1px solid #ccc;' >");
            foreach (DataColumn myColumn in dt.Columns)
            {
                strHTMLBuilder.Append("<th style='border: 1px solid #ccc; padding: 10px; '>");
                strHTMLBuilder.Append(myColumn.ColumnName);
                strHTMLBuilder.Append("</th>");
            }
            strHTMLBuilder.Append("</tr>");
            strHTMLBuilder.Append("</thead>");

            foreach (DataRow myRow in dt.Rows)
            {
                strHTMLBuilder.Append("<tr style='border: 1px solid #ccc; font-size: 12pt;'>");
                foreach (DataColumn myColumn in dt.Columns)
                {
                    strHTMLBuilder.Append("<td style='border: 1px solid #ccc; padding: 10px; '>");
                    strHTMLBuilder.Append(myRow[myColumn.ColumnName].ToString());
                    strHTMLBuilder.Append("</td>");
                }
                strHTMLBuilder.Append("</tr>");
            }

            //Close tags.  
            strHTMLBuilder.Append("</tbody>");
            strHTMLBuilder.Append("</table>");
            string Htmltext = strHTMLBuilder.ToString();

            return Htmltext;

        }
        [WebMethod(EnableSession = true)]
        public static string GetImageUrl(string imagePath)
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
    }
}