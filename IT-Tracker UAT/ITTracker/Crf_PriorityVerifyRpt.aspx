<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="Crf_PriorityVerifyRpt.aspx.cs" Inherits="ITTracker.Crf_PriorityVerifyRpt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/CrfPrioritycheckrpt.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="card-5 animated bounceIn " style="background-color:white;">
    <form id="Form1" class="form-horizontal" runat="server" method="post" enctype="multipart/form-data" action="#" style="padding-top:10px;">
        <section class="panel <%--vh-75 scrollable--%>" id="contentDivID">
        <div class="row ">
            <div class="ma-header col-4" ></div>
            <div class="ma-header" > 

                <h4 style="align-items: center; align-content: center;">CRF PRIORITY CHANGE REPORT</h4>

            </div>
        </div>

        <div class=" card-body">
             <div class="row col-sm-12" style="padding-bottom:20px">
                 
                <div class="form-group col-sm-2" style="padding-left: 0;">
                    <label>From Date <span class="required text-danger">*</span> </label>
                    <input type="text" id="txt_TASrtDate" class="form-control" style="width: 100%" readonly="readonly" />
                </div>
                <div class="form-group col-sm-2" style="padding-left: 0;">
                    <label>To Date <span class="required text-danger">*</span> </label>
                    <input type="text" id="txt_TarDate" class="form-control" style="width: 100%" readonly="readonly"/>
                </div>
                </div>
           
          
           


         
                <hr/>
                <div class=" form-group col-md-12 row  padding-bottom-10px p-2">
              
                        <div class="col-md-2 ">
                            <input id="btnConfirm" type="button" value="Generate" class="btn btn-block btn-outline-primary btn-sm" onclick="viewReport()" data-toggle="modal" data-backdrop="false" />

                        </div>
                       <div class="col-md-2 ">

                            <input id="btnExit" type="button" value="Exit" class=" btn btn-block btn-outline-danger btn-sm" onclick="frmExit()" data-toggle="modal" data-backdrop="false" />
                        </div>
                 
                </div>
       
          

        </div>

</section>
    </form>
   </div>
       
     <input id="hdBranchId" type="hidden" runat="server" />
    <input id="hdUserId" type="hidden" runat="server" />
        

   
</asp:Content>
