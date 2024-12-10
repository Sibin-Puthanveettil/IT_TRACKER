<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="CrfDelayReportMain.aspx.cs" Inherits="ITTracker.CrfDelayReportMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="js/crfDelayReport.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card col-md-12 card-5" style="min-height: 50vh; padding: 20px;">
        <div class="container-fluid">
            <h2 class="text-center">TEAM DELAY REPORT</h2>
        </div>
        <div class="row col-md-12 d-flex justify-content-start" style="margin-top: auto;">
            <div class="col-md-4" style="height:80px;">
             <label>Test Status Date <span class="required text-danger">*</span> </label>
             <input type="text" id="frm_Date" tabindex="100" class="form-control" style="width: 100%" readonly="readonly"  />
            </div>
            <div class="col-md-4" style="height:80px;">
             <label>Test Status Date <span class="required text-danger">*</span> </label>
             <input type="text" id="to_Date" tabindex="101" class="form-control" style="width: 100%" readonly="readonly" />
            </div>
        </div>
        <div class="row col-md-12 d-flex justify-content-start" style="margin-bottom: auto; margin-top: 20px;">
            <div class="col-md-4" style=" height:80px;">
                <span>Select Team :</span>
                <select class="form-control tlead select2" style="min-width: 60%;" tabindex="102" id="team_Select">
                </select>
            </div>
            <div class="col-md-4" style="height:80px;">
                <span>Delay Type:</span>
                <select class="form-control tlead select2" style="min-width: 60%;" tabindex="103" id="delay_Select">
                     <%--<option value="-1" selected disabled > Choose Delay Types </option>
                     <option value="01"> Development Start Delay </option>
                     <option value="02"> Development End Delay </option>
                     <option value="03"> Testing Delay </option>
                     <option value="04"> Reassigned to Developer </option>
                     <option value="05"> Project Target Date Delay </option>
                     <option value="06"> All...! </option>--%>
                </select>
            </div>
            <div class="col-md-4 text-center">
                <%-- <input type="button " class="btn-dark text-center rounded" value="VIEW REPORT" onclick="handleSubmit()" style=" padding:10px" />--%>
                 <button class="btn btn-outline-success text-center rounded" tabindex="104" onclick="btnViewReport()" style="height: 45px; padding: 0px 50px; margin-top: 10px; float:left">VIEW REPORT</button>        
             </div>
        </div>
         <%--<div class="row col-md-12" style="margin:auto">
             <div class="col text-center">
                 <button class="btn-dark text-center rounded" tabindex="104" onclick="btnViewReport()" style="height: 45px; padding: 0px 50px; margin-top: 10px;">VIEW REPORT</button>        
             </div>
         </div>--%>
        <input id="hdUserId" type="hidden" runat="server" />
        <input id="hdBranchId" type="hidden" runat="server" />
        <input id="hdFirmId" type="hidden" runat="server" />
    </div>
</asp:Content>
