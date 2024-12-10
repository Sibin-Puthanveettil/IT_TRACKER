<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="CrfDelayReport.aspx.cs" Inherits="ITTracker.CrfDelayReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" title="currentStyle">
			@import "css/demo_page.css"; 
			@import "css/demo_table.css";
			@import "css/jquery-ui-1.8.4.custom.css";
			@import "css/TableTools.css";
            .scroll {
                overflow-x: auto;
                white-space: nowrap;
            }
    </style>
  
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            var oTable = $('#example').dataTable({
                "bJQueryUI": true,
                "sPaginationType": "full_numbers",
                "sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
                "bAutoWidth": false,
                "oTableTools": {
                    "aButtons": [
                        "copy", "csv", "xls", "pdf",
                        {
                        	"sExtends":    "collection",
                        	"sButtonText": "Save",
                        	"aButtons":    [ "csv", "xls", "pdf" ]
                        }
                    ]
                }
            });

        });

        function GetASORPT(fromdt, todt, mnuId, unid, stid) {
            window.open('CrfDelayReport.aspx');
            //window.open('DailyReportSMS_dtl.aspx?frdt=' + fromdt + '&todt=' + todt + '&mnuId=' + mnuId + '&unid=' + unid + '&stid=' + stid + '', '_self');
        }
    </script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/ZeroClipboard.js"></script>
    <script src="js/TableTools.js"></script>
    <script src="js/FixedColumns.js"></script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="Form1" class="form-horizontal row-border" action="#" runat="server" >
        <div class="container">
           <div class="col-md-12 well align-center">
               <div class="col-md-12 align-right" style="margin: 35px auto; text-align: center">               
                   <asp:Button ID="btn_Excel" runat="server"  
                     EnableTheming="True" Font-Bold="True" Font-Names="Book Antiqua" Font-Size="10pt"
                     ForeColor="Black" Height="30%" class="btn btn-outline-secondary"  style="padding: 10px 0; border-radius: 100px;" Text="EXPORT TO EXCEL"
                     Width="168px" OnClick="btn_Excel_Click"/>
                   <%--<input id="btnPrint" onclick="window.print()" style="font-weight: bold;
                    width: 73pt; cursor: hand; font-family: 'Book Antiqua'; background-color: lightsteelblue"
                    type="button" value="PRINT" />--%>
               </div>
               <div class="col-md-12 align-center">
                   <asp:Label ID="lbldate" runat="server" Font-Bold="True" ForeColor="Navy" Width="25%"></asp:Label><br />
                   <asp:Label ID="lblTime" runat="server" Font-Bold="True" ForeColor="Navy" Width="258px"></asp:Label><br />
               </div>
               <div class="col-md-12 align-center">
                   <asp:Panel ID="Panel1" runat="server" Height="16%" Style="z-index: 100; left: 11px; top: 7px" Width="100%">
                        <div style="margin-left: auto; margin-right: auto; text-align: center">
                             <asp:Label ID="Label2" runat="server" BackColor="Transparent" Font-Bold="True" Font-Size="X-Large"
                                 ForeColor="Green" Height="28px" Text="MANAPPURAM FINANCE LIMITED" Width="100%"></asp:Label>
                            <asp:Label ID="lblTitle" runat="server" BackColor="Transparent" Font-Bold="True" Font-Size="Large"
                                 ForeColor="Purple" Height="21px" Width="100%">TEAM DELAY REPORT</asp:Label><br />
                        </div>
                        <div id="demo" class="scroll">
                            <div id="MyTable" runat="server" style="margin-left: auto; margin-right: auto; text-align: center">
                            </div>
                        </div>
                   </asp:Panel>
               </div>
        
        
    
    </div>
            </div>
        </form>
</asp:Content>
