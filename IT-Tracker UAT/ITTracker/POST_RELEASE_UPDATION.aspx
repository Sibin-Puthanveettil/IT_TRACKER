﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="POST_RELEASE_UPDATION.aspx.cs" Inherits="ITTracker.POST_RELEASE_UPDATION" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


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
                border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.87);
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
                    border-color: rgba(var(--pure-material-onsurface-rgb, 0, 0, 0), 0.6);
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
    <script src="js/Post_Release_Updation.js"></script>
    
    <link href="css/textbox.css" rel="stylesheet" />
    <link href="css/teststar.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>--%>
    <link href="css/MultipleUpload.css" rel="stylesheet" />
    <script src="js/MultipleUpload.js"></script>
    <link href="StyleAutoComplete.css" rel="stylesheet" />
    <script src="AutoCompleteJS.js"></script>
    <script src="js/aes.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-5 rightmarg">
        <form class="form-inline" runat="server" method="post" enctype="multipart/form-data">
            <div class="card-body">
                <div class="row">
                    <label class="col-md-1 align-left ">CRF <span class="required">*</span> </label>
                    <div class="col-md-10 align-left">
                        <select id="ddlCrf" class="form-control" style="width: 100%;" name="CRF_Sel" onchange="fillCRFData()">
                            <option value="-1">Choose CRF</option>
                        </select>
                    </div>

                </div>
                <div class="padding-bottom-10px p-t-40"></div>
                <div class="row" style="padding-top: 10px">

                    <label class="col-md-1 align-right " id="myLargeModalLabel">Content </label>
                    <div id="snote" class="form-group col-md-10 padding-bottom-10px" style="color: black; display: block; text-align: initial;" contenteditable="false">
                        <div class="summernoteview" id="content">
                        </div>
                    </div>
                </div>
                <div id="CrfDetailsID" style="display: none">
                    <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">IT Team : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTeam" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Request Type : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblType" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Requested By: </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblReqtr" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                    <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">Requested Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblRqstDt" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Target Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTarDt" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Priority : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblPrior" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">User Expected Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblUserExpectDate" style="width: 100%; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right" style="color: red">Error Report Impact : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblErrorImpact" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-3 ">QA Post Release Status:<span class="required text-danger">*</span> </label>

                        <div class="div-select-dark">
                            <select class="select-dark" name="status" id="ddlstatus" style="width: 200px;" onchange="drpselect();">

                                <option value="-1" selected disabled>select</option>
                                <option value="1">Working</option>
                                <option value="2">Not Working</option>
                                <option value="3">Inprogress</option>
                                <option value="4">Release Pending</option>

                            </select>
                        </div>



                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                          <label id="rdt">Release Date:<span class="required text-danger" >*</span> </label>
                        &nbsp; &nbsp;&nbsp;<input type="text" id="txt_Releasedate" class="form-control" style="width: 22%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" readonly="readonly" />
                    </div>
                </div>
                </br>
                  <div class="col-md-12" id="parallelrow">
                      <div class="form-group">
                          <label for="rdbNature" class="col-md-3">Attach File : &nbsp&nbsp&nbsp</label>
                          <div class="file-upload">
                              <div class="file-select">
                                  <div class="file-select-button" id="fileName">Choose File</div>
                                  <div class="file-select-name" id="noFile">No file chosen...</div>
                                  <div class="file-chooser">
                                      <input type="file" class="file-chooser__input" />
                                  </div>
                              </div>
                          </div>
                          <div class="file-uploader__message-area">
                              <p>Select a file to upload</p>
                          </div>
                      </div>
                  </div>
                </br>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-3" for="manualchcking">Manually Entering CrfID ? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="checkbox" class="toggle" id="manualchcking" />
                        <label for="manualchcking">
                            <span class="on" onclick="Automaticchcking();">Yes</span>
                            <span class="off" onclick="manualchcking();">No</span>
                        </label>


                    </div>
                </div>
                </br>
                <div class="row">
                    <div class="col-md-12">


                        <label class="pure-material-textfield-outlined">

                            <textarea rows="1" cols="15" name="Remarks" id="txtRemarks" maxlength="3500" title="Remarks" oninput="this.value = this.value.replace(/[^-@.,/#&+\w\s]/g, '');"></textarea>
                            <span>Remarks</span>
                        </label>

                    </div>
                </div>


                <div class="row" id="showSubmitBtn">
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-primary" style="width: 100%; margin: 5px;"
                            onclick="return ConfirmNote();" id="btnSubmit"><i class="fa fa-thumbs-up"></i>Confirm</a>
                    </div>
                    <%-- <div class="col-md-2 col-sm-2 col-xs-4">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-orange" style="width: 100%; margin: 5px;"
                            onclick="return ReturnNote();" id="btnReturn"><i class="fa fa-thumbtack"></i>Return</a>
                    </div>
                    --%>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-red" style="width: 100%; margin: 5px;"
                            onclick="return frmExit();"><i class="fa fa-sign-out-alt"></i>Exit</a>
                    </div>


                </div>


            </div>

        </form>
    </div>
    <input id="hdUserId" type="hidden" runat="server" />
    <input id="hdBranchId" type="hidden" runat="server" />
    <input id="hdFirmId" type="hidden" runat="server" />
    <input id="hdnSystemIP" type="hidden" runat="server" />
    <input id="hdSesssion" type="hidden" runat="server" />
    <input id="hdRqstID" type="hidden" runat="server" />
    <input id="HdStar1" type="hidden" runat="server" />
    <input id="HdStar2" type="hidden" runat="server" />
    <input id="HdStar3" type="hidden" runat="server" />
    <input id="HdStar4" type="hidden" runat="server" />
    <input id="HdStar5" type="hidden" runat="server" />
</asp:Content>
