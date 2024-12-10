﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="BugStatusReport.aspx.cs" Inherits="ITTracker.BugStatusReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleAutoComplete.css" rel="stylesheet" />
    <script src="AutoCompleteJS.js"></script>
    <script src="js/BugReport.js"></script>
    <style>


        .select2-container--default .select2-selection--multiple .select2-selection__choice {
    background-color: #2962ff !important;
    padding: 0px 12px !important;
    color:#ffffff !important;
}

        .select2-container .select2-selection--multiple {
    box-sizing: border-box;
    cursor: pointer;
    display: table !important;
    min-height: auto;
    user-select: none;
    -webkit-user-select: none;
    min-width: 100% !important;
}
        </style>
     <style>
        .pure-material-textfield-outlined {
            --pure-material-safari-helper1: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
            position: relative;
            display: inline-block;
            padding-top: 7px;
            /*font-family: var(--pure-material-font, "Roboto", "Segoe UI", BlinkMacSystemFont, system-ui, -apple-system);*/
            font-size: 12px;
            line-height: 1.5;
            overflow: hidden;
            width: 100%;
            /*height: 2.3em;*/
        }

            /* Input, Textarea */
            .pure-material-textfield-outlined > input,
            .pure-material-textfield-outlined > textarea {
                box-sizing: border-box;
                margin: 0;
                border: solid 1px; /* Safari */
                border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
                border-top-color: transparent;
                border-radius: 4px;
                padding: 5px 13px 5px;
                width: 100%;
                height: inherit;
                color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
                background-color: transparent;
                box-shadow: none; /* Firefox */
                font-family: inherit;
                font-size: inherit;
                line-height: inherit;
                caret-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
                transition: border 0.2s, box-shadow 0.2s;
            }

                /* Span */
                .pure-material-textfield-outlined > input + span,
                .pure-material-textfield-outlined > textarea + span {
                    position: absolute;
                    top: 0;
                    left: 0;
                    display: flex;
                    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
                    width: 100%;
                    max-height: 80%;
                    color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
                    font-size: 75%;
                    line-height: 15px;
                    cursor: text;
                    transition: color 0.2s, font-size 0.2s, line-height 0.2s;
                }

                    /* Corners */
                    .pure-material-textfield-outlined > input + span::before,
                    .pure-material-textfield-outlined > input + span::after,
                    .pure-material-textfield-outlined > textarea + span::before,
                    .pure-material-textfield-outlined > textarea + span::after {
                        content: "";
                        display: block;
                        box-sizing: border-box;
                        margin-top: 6px;
                        border-top: solid 1px;
                        border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
                        min-width: 10px;
                        height: 8px;
                        pointer-events: none;
                        box-shadow: inset 0 1px transparent;
                        transition: border-color 0.2s, box-shadow 0.2s;
                    }

                    .pure-material-textfield-outlined > input + span::before,
                    .pure-material-textfield-outlined > textarea + span::before {
                        margin-right: 4px;
                        border-left: solid 1px transparent;
                        border-radius: 4px 0;
                    }

                    .pure-material-textfield-outlined > input + span::after,
                    .pure-material-textfield-outlined > textarea + span::after {
                        flex-grow: 1;
                        margin-left: 4px;
                        border-right: solid 1px transparent;
                        border-radius: 0 4px;
                    }

            /* Hover */
            .pure-material-textfield-outlined:hover > input,
            .pure-material-textfield-outlined:hover > textarea {
                border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
                border-top-color: transparent;
            }

                .pure-material-textfield-outlined:hover > input + span::before,
                .pure-material-textfield-outlined:hover > textarea + span::before,
                .pure-material-textfield-outlined:hover > input + span::after,
                .pure-material-textfield-outlined:hover > textarea + span::after {
                    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
                }

                .pure-material-textfield-outlined:hover > input:not(:focus):placeholder-shown,
                .pure-material-textfield-outlined:hover > textarea:not(:focus):placeholder-shown {
                    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
                }

            /* Placeholder-shown */
            .pure-material-textfield-outlined > input:not(:focus):placeholder-shown,
            .pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown {
                border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
            }

                .pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span,
                .pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span {
                    font-size: inherit;
                    line-height: 50px;
                }

                    .pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span::before,
                    .pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::before,
                    .pure-material-textfield-outlined > input:not(:focus):placeholder-shown + span::after,
                    .pure-material-textfield-outlined > textarea:not(:focus):placeholder-shown + span::after {
                        border-top-color: transparent;
                    }

            /* Focus */
            .pure-material-textfield-outlined > input:focus,
            .pure-material-textfield-outlined > textarea:focus {
                border-color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
                border-top-color: transparent;
                box-shadow: inset 1px 0 var(--pure-material-safari-helper1), inset -1px 0 var(--pure-material-safari-helper1), inset 0 -1px var(--pure-material-safari-helper1);
                outline: none;
            }

                .pure-material-textfield-outlined > input:focus + span,
                .pure-material-textfield-outlined > textarea:focus + span {
                    color: rgb(var(--pure-material-primary-rgb, 33, 150, 243));
                }

                    .pure-material-textfield-outlined > input:focus + span::before,
                    .pure-material-textfield-outlined > input:focus + span::after,
                    .pure-material-textfield-outlined > textarea:focus + span::before,
                    .pure-material-textfield-outlined > textarea:focus + span::after {
                        border-top-color: var(--pure-material-safari-helper1) !important;
                        box-shadow: inset 0 1px var(--pure-material-safari-helper1);
                    }

            /* Disabled */
            .pure-material-textfield-outlined > input:disabled,
            .pure-material-textfield-outlined > input:disabled + span,
            .pure-material-textfield-outlined > textarea:disabled,
            .pure-material-textfield-outlined > textarea:disabled + span {
                border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
                border-top-color: transparent !important;
                color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38);
                pointer-events: none;
            }

                .pure-material-textfield-outlined > input:disabled + span::before,
                .pure-material-textfield-outlined > input:disabled + span::after,
                .pure-material-textfield-outlined > textarea:disabled + span::before,
                .pure-material-textfield-outlined > textarea:disabled + span::after {
                    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
                }

                .pure-material-textfield-outlined > input:disabled:placeholder-shown,
                .pure-material-textfield-outlined > input:disabled:placeholder-shown + span,
                .pure-material-textfield-outlined > textarea:disabled:placeholder-shown,
                .pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span {
                    border-top-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.38) !important;
                }

                    .pure-material-textfield-outlined > input:disabled:placeholder-shown + span::before,
                    .pure-material-textfield-outlined > input:disabled:placeholder-shown + span::after,
                    .pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::before,
                    .pure-material-textfield-outlined > textarea:disabled:placeholder-shown + span::after {
                        border-top-color: transparent !important;
                    }

        /* Faster transition in Safari for less noticable fractional font-size issue */
        @media not all and (min-resolution:.001dpcm) {
            @supports (-webkit-appearance:none) {
                .pure-material-textfield-outlined > input,
                .pure-material-textfield-outlined > input + span,
                .pure-material-textfield-outlined > textarea,
                .pure-material-textfield-outlined > textarea + span,
                .pure-material-textfield-outlined > input + span::before,
                .pure-material-textfield-outlined > input + span::after,
                .pure-material-textfield-outlined > textarea + span::before,
                .pure-material-textfield-outlined > textarea + span::after {
                    transition-duration: 0.1s;
                }
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-5 animated bounceIn " style="background-color:white;">
    <form id="Form1" class="form-horizontal" runat="server" method="post" enctype="multipart/form-data" action="#" style="padding-top:10px;">
        <section class="panel <%--vh-75 scrollable--%>" id="contentDivID">
        <div class="row ">
            <div class="ma-header col-4"></div>
            <div class="ma-header">

                <h4 style="align-items: center; align-content: center">BUG TRACKING STATUS REPORT</h4>

            </div>
        </div>

        <div class=" card-body">
            <div id="valid" class="row" style="margin-bottom:1%;">
                 <label class="col-md-1.5">Choose Report Type:</label>
                <%-- <div class="form-control clearfix" id="idRpt">--%>
                     <div class="col-md-2 icheck-primary d-inline">
                         <input type="radio" name="Rpt" value="0" id="rbcpt" checked="checked" onchange="return showtstDlyRpt();"/>
                         <label for="rbcpt">Testing Status Report</label>
                     </div>
                 
                    <div class="col-md-2 icheck-success d-inline">
                         <input type="radio" name="Rpt" value="1" id="rbretest" onchange="return showtstDlyRpt();"/>
                         <label for="rbLow">Retesting status Report</label>                  
                     </div>
                <div style="display:none" id ="butdelay">
                    <div class="col-md-1.5 icheck-primary d-inline" >
                         <input type="radio" name="Rpt" value="2" id="rbdelay" onchange="return showtstDlyRpt();"/>
                         <label for="rbtwr">Delay report</label>&nbsp;
                     </div>
                </div>
                     
                     <div class="col-md-2 icheck-primary d-inline">
                         <input type="radio" name="Rpt" value="3" id="rbbug" onchange="return showtstDlyRpt();"/>
                         <label for="rbQArpt">Bug report</label>
                     </div>

                    <div class="col-md-2 icheck-primary d-inline">
                         <input type="radio" name="Rpt" value="4" id="rbbugdtl" onchange="return showtstDlyRpt();"/>
                         <label for="rbQArpt">Bug detail report</label>&nbsp;
                     </div>
                 
                <div class="col-md-1.5 icheck-primary d-inline">
                         <input type="radio" name="Rpt" value="5" id="dlyrpt"  onchange="return showtstDlyRpt();"/>
                         <label for="rbQArpt">Tester Delay Report</label>
                     </div>

                 <%--</div>--%>
             </div>

           
            <div class="row col-sm-12" style="padding-bottom:20px">
                <div class="form-group col-sm-2" style="padding-left: 0;">
                    <label>Initial From Date <span class="required text-danger">*</span> </label>
                    <input type="text" id="txtFromDate" class="form-control" style="width: 100%" readonly="readonly" onmousedown="getDate();" />
                </div>
                <div class="form-group col-sm-2" style="padding-left: 0;">
                    <label>Initial To Date <span class="required text-danger">*</span> </label>
                    <input type="text" id="txtToDate" class="form-control" style="width: 100%" readonly="readonly" onmousedown="getDate();" />
                </div>
                <div id="status" class="form-group col-md-3" style="padding-left: 0;">
                    <label>Status</label>
                    <select class="form-control dept select2" style="width: 100%" multiple="multiple" id="ddlStatus">
                    </select>
                </div>
                <div  id="techlead" class="form-group col-md-3" style="padding-left: 0;">
                    <label>Tech lead </label>
                    <select class="form-control tlead select2" style="width: 100%" multiple="multiple" id="ddlTLead">
                    </select>
                </div>

                </div>
           
            <%--<div id="div2" class="form-group col-md-12 row  padding-bottom-10px p-2">
                <label class="col-md-1 align-left  ">From Date : </label>
                <div class="col-md-3">
                    <input type="text" placeholder="From Date.." class="form-control" id="txtFromDate" title="Subject" />
                </div>
                <label class="col-md-1 align-left  ">To Date : </label>
                <div class="col-md-3">
                    <input type="text" placeholder="To Date.." class="form-control" id="txtToDate" title="Subject" />
                </div>

          <label class="col-md-1 align-left ">Status : </label>
                <div class="col-md-3">
                        <select class="form-control select2" name="Dept" id="ddlStatus"></select>
                </div>

            </div>--%>
            <div class="row col-sm-12" style="padding-bottom:20px">
            <div class="form-group col-md-3" style="padding-left: 0;">
                    <label>CRF ID : </label>
                   <input type="text" placeholder="CRF ID.." class="form-control" onkeypress="return onlyNos(event,this);" maxlength="6" id="txtCrdId" title="crf" />
                   
                </div>

               <div class="form-group col-md-3" style="padding-left: 0;">
                    <label>Request ID : </label>
                <input type="text" placeholder="Request ID.." class="form-control" onkeypress="return onlyNos(event,this);" maxlength="4" id="txtRequestId" title="requestid" />
                   
                </div> 


                <div class="form-group col-md-4" style="padding-left: 0;">
                    <label>Tester</label>
                    <select class="form-control dept select2" style="width: 100%" multiple="multiple" id="ddlTester" onclick="GetTester()">
                    </select>
                </div>

                </div>


            <%--<div id="div4" class="form-group col-md-12 row  padding-bottom-10px p-2">
                <label class="col-md-1 align-left  ">CRF ID : </label>
                <div class="col-md-3">
                   <input type="text" placeholder="CRF ID.." class="form-control" onkeypress="return onlyNos(event,this);" maxlength="6" id="txtCrdId" title="crf" />
                </div>--%>



                  <%--<label class="col-md-1 align-left  ">Request ID : </label>
                <div class="col-md-3">
                <input type="text" placeholder="Request ID.." class="form-control" onkeypress="return onlyNos(event,this);" maxlength="4" id="txtRequestId" title="requestid" />

                </div>--%>
              
               <%-- <label class="col-md-1 align-left ">Tester  <span class="required">*</span> </label>
            <div class="col-md-3 align-left">
<%--               <select class="form-control select2" id="ddlTester" style="width: 100%" name="Tester" >--%>
                   <%-- <option value="-1">Choose Tester</option>--%>

                <%-- <select class="form-control select2" name="Tester" id="ddlTester"></select>

               
            </div>--%>


             <%--   <div class="form-group col-md-3"style="padding-left: 0;">
                    <label>Tester  </label>
                    <select class="form-control devlp select2" style="width: 100%" multiple="multiple" id="ddlTester">
                    </select>
                </div>--%>
          

            <%--</div>--%>
             <%-- <div id="div5" class="form-group col-md-12 row  padding-bottom-10px p-2">
             <%--   <label class="col-md-1 align-left  ">Department : </label>
                <div class="col-md-3">
                   <select class=" form-control" name="DocType" id="ddlDept"></select>
            <%--    </div>--%>
              <%--</div>--%>
                <hr/>
                <div class=" form-group col-md-12 row  padding-bottom-10px p-2">
              
                        <div class="col-md-2 ">
                            <input id="btnConfirm" type="button" value="Generate" class="btn btn-block btn-outline-primary btn-sm" onclick="viewBugReport()" data-toggle="modal" data-backdrop="false" />

                        </div>
                       <div class="col-md-2 ">

                            <input id="btnExit" type="button" value="Exit" class=" btn btn-block btn-outline-danger btn-sm" onclick="frmExit()" data-toggle="modal" data-backdrop="false" />
                        </div>
                 
                </div>
       
          

        </div>

</section>
    </form>
   </div>
    <input id="hdFirmId" type="hidden" runat="server" />
    <input id="hdBranchId" type="hidden" runat="server" />
    <input id="hdUserId" type="hidden" runat="server" />
   
</asp:Content>
