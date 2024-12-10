<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="MorningMeetingVerification.aspx.cs" Inherits="ITTracker.MorningMeetingVerification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/MorningMeetingVerification.js?<%=DateTime.Now.Ticks.ToString()%>"></script>
    
      <style>
            @media screen and (min-width: 1000px) {
            .modal-dialog {
                max-width: 1000px; /* New width for default modal */
            }
        }
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
            margin-left: 90px;
            margin-right: 50px;
        }

        .label-head {
            display: block;
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
            width: 66%;
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
                width: 66%;
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
    <form id="Form1" class="form-horizontal" runat="server" method="post" enctype="multipart/form-data" action="#" style="padding-top:20px;">
        <section class="panel <%--vh-75 scrollable--%>" id="contentDivID">
             <div class="card-body">
             <div class="row ">
            <div class="ma-header col-4"></div>
            <div class="ma-header">

                <h4 style="align-items: center; align-content: center;color: #45457b">MORNING MEETING VERIFICATION</h4>

            </div>
                 
        </div>

                  <div class="row" style="padding-left: 150px;padding-top:30px;">
             <label class="col-md-1 align-left " >From Date: </label>
                 <div class="col-md-3 align-left ">
                   <%--  <input type="text" id="datepicker" class="form-control" style="width: 95%" readonly="readonly" />--%>
                      <input type="text" id="txtFromDate" class="form-control" style="width: 100%" readonly="readonly"/>
                 </div>
                   
                  <label class="col-md-1 align-left ">To Date: </label>
                  <div class="col-md-3 align-left ">
                    <input type="text" id="txtToDate" class="form-control" style="width: 100%" readonly="readonly" />
                </div>
                      
                 </div>
                  <div class="row" style="padding-left: 150px;padding-top:30px;">
                      <label class="col-md-1 align-left ">Tech lead:</label>
                       <div class="col-md-3 align-left ">
                    <select class="form-control tlead select2" style="width: 100%"  id="ddlTLead" onchange="countdetails()">
                    </select>
               </div>
                       <div class="col-md-3 align-left ">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-info btn-xs" style="width: 70%; margin: 5px;"
                            onclick="return viewdetails();" id="btnview"><i class="fa fa-magnifying-glass"></i>View Report</a>
                   
                  </div>

                  </div>
                      <div class="row" style="padding-left: 150px;padding-top:30px;">

                   <label class="pure-material-textfield-outlined">
                                <textarea rows="2" cols="15" name="Remarks" id="txtRemarks" maxlength="3500" title="Remarks" oninput="this.value = this.value.replace(/[^-@.,/#&+\w\s]/g, '');"></textarea>
                                <span>Remarks</span>
                            </label>
                  </div>
                  <div class="row" style="padding-left: 150px;padding-right: 230px;">
                   <table class="table-bordered align-centre col-md-12" id="tableData" style="width:50%; padding-left:50px; align-items: center;" ><tbody></tbody></table>
                </div>
                       <div class="row" id="showSubmitBtn"style="padding-left: 200px;">
                     <div class="col-md-3 align-left ">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-success" style="width: 70%; margin: 5px;"
                            onclick="return ConfirmMOMUpdn();" id="btnSubmit"><i class="fa fa-thumbs-up"></i>Confirm</a>
                   
                  </div>
                             <div class="col-md-3 align-left ">
                            <a href="#" class="btn btn-sm animated-button thar-one btn-danger" style="width: 70%; margin: 5px;"
                                onclick="return RejctCRF();"><i class="fa fa-thumbs-down"></i>Reject</a>
                        </div>
                     <div class="col-md-3 align-left ">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-primary" style="width: 70%; margin: 5px;"
                            onclick="return frmExit();"><i class="fa fa-sign-out-alt"></i>Exit</a>
                  </div>

                </div>
                 </div>
            </section>

        </form>
           </div>
      <input id="hdUserId" type="hidden" runat="server" />
   
    <input id="hdFirmId" type="hidden" runat="server" />
     <input id="hddetails" type="hidden" runat="server" />
</asp:Content>
