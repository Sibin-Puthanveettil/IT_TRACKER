<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="TA_HeadVerificationRPT.aspx.cs" Inherits="ITTracker.TA_HeadVerificationRPT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/TA_HeadVerificationDTRPT.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-5 rightmarg">
        <form class="form-inline" runat="server" method="post" enctype="multipart/form-data">
            <div class="card-body">
                <div class="card-body shadow" style="background: #fff;">
                    <div class="row col-md-12 col-md-6 col-md-4" style="padding-left: 30%;">
                        <h4><b>CRF OVER SIGHT REPORT</b></h4>
                    </div>
                    </br></br>
                    <div class="row">
                        <div class="row col-sm-12" style="padding-left: 200px">
                            <div class="form-group col-sm-4">
                                <label>From Date <span class="required text-danger">*</span> </label>
                                <input type="text" id="txt_fromdate" class="form-control" style="width: 100%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" readonly="readonly" />


                            </div>
                            <div class="form-group col-sm-4">
                                <label>To Date <span class="required text-danger">*</span> </label>
                                <input type="text" id="txt_Todate" class="form-control" style="width: 100%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" readonly="readonly" />
                            </div>

                        </div>
                    </div>
                    </br>
                    <div class="row">

                        <div class="row col-sm-12" style="padding-left: 200px">
                            <div class="form-group col-sm-4">
                                <label>status <span class="required text-danger">*</span> </label>
                                <div class="div-select-dark">
                                    <select class="select-dark" name="Status" id="ddlstatus" style="width: 200px; max-width: 200px;">

                                        <option value="-1" selected disabled>select</option>
                                        <option value="0">All</option>
                                        <option value="1">Approved</option>
                                        <option value="2">Exception</option>

                                    </select>
                                </div>

                            </div>


                        </div>
                    </div>
                    </br></br></br>
                       <div class="row" id="showSubmitBtn" style="padding-left: 300px;">
                           <div class="col-md-3 align-left ">
                               <a href="#" class="btn btn-sm animated-button thar-one btn-success" style="width: 100%; margin: 5px;"
                                   onclick="return ConfirmHeadverificationrpt();" id="btnSubmit1"><i class="fa fa-thumbs-up"></i>Confirm</a>

                           </div>
                           <div class="col-md-3 align-left ">
                               <a href="#" class="btn btn-sm animated-button thar-one btn-primary" style="width: 100%; margin: 5px;"
                                   onclick="return frmExit();"><i class="fa fa-sign-out-alt"></i>Exit</a>
                           </div>

                       </div>
                </div>
            </div>
        </form>
    </div>
    <input id="hdFirmId" type="hidden" runat="server" />
    <input id="hdBranchId" type="hidden" runat="server" />
    <input id="hdUserId" type="hidden" runat="server" />
</asp:Content>
