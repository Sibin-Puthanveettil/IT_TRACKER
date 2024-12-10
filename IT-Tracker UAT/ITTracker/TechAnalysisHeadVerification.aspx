<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="TechAnalysisHeadVerification.aspx.cs" Inherits="ITTracker.TechAnalysisHeadVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/TechAanalysisHeadVerification.js"></script>
    <link href="StyleAutoComplete.css" rel="stylesheet" />
    <style>
        .card-body {
            background: #fff;
        }

        .timeline1 {
            position: relative;
            padding: 50px 0;
        }

        header.note-toolbar {
            padding: 0 0 5px 5px;
            margin: 0;
            background: #197969;
        }

        .container {
            border: none !important;
        }

        .shadow {
            box-shadow: 5px 15px 5px 3px #0017304d;
        }

        .bg-success {
            background-color: #197969 !important;
        }

        .bg-success {
            background-color: #197969 !important;
        }

        .timeline1::before {
            content: '';
            background: #C5CAE9;
            width: 5px;
            height: 95%;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .timeline-item {
            width: 100%;
            margin-bottom: 5px;
        }

            .timeline-item:nth-child(even) .timeline-content {
                float: right;
                padding: 40px 30px 10px 30px;
            }

                .timeline-item:nth-child(even) .timeline-content .wf-date {
                    right: auto;
                    left: 0;
                }

                .timeline-item:nth-child(even) .timeline-content::after {
                    content: '';
                    position: absolute;
                    border-style: solid;
                    width: 0;
                    height: 0;
                    top: 30px;
                    left: -15px;
                    border-width: 10px 15px 10px 0;
                    border-color: transparent #f5f5f5 transparent transparent;
                }

            .timeline-item::after {
                content: '';
                display: block;
                clear: both;
            }

        .timeline-content {
            position: relative;
            width: 45%;
            padding: 10px 15px;
            border-radius: 4px;
            background: #fff;
            box-shadow: 0 20px 25px -15px rgba(0, 0, 0, 0.3);
        }

            .timeline-content::after {
                content: '';
                position: absolute;
                border-style: solid;
                width: 0;
                height: 0;
                top: 30px;
                right: -15px;
                border-width: 10px 0 10px 15px;
                border-color: transparent transparent transparent #f5f5f5;
            }

        .timeline-img {
            width: 30px;
            height: 30px;
            background: #197969;
            border-radius: 70%;
            position: absolute;
            left: 50%;
            margin-top: 25px;
            margin-left: -15px;
            color: #fff;
            text-align: center;
            padding-top: 7px;
        }

        .bnt-more {
            cursor: pointer;
            background: #3F51B5;
            color: #FFFFFF;
            padding: 3px 10px;
            text-transform: uppercase;
            font-size: 12px;
            display: inline-block;
            border-radius: 2px;
            box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.6);
        }

            .bnt-more:hover, .bnt-more:active, .bnt-more:focus {
                background: #32408f;
                color: #FFFFFF;
                text-decoration: none;
            }

        .timeline-card {
            padding: 0 !important;
        }

            .timeline-card p {
                padding: 0 20px;
            }

            .timeline-card a {
                margin-left: 20px;
            }

        .timeline-item .timeline-img-header {
            background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.4)), url("https://picsum.photos/1000/800/?random") center center no-repeat;
            background-size: cover;
        }

        .timeline-img-header {
            height: 200px;
            position: relative;
            margin-bottom: 20px;
        }

            .timeline-img-header h2 {
                color: #FFFFFF;
                position: absolute;
                bottom: 5px;
                left: 20px;
            }

        .note-editor.note-frame .note-editing-area .note-editable[contenteditable="false"] {
            background-color: #a3e39a0a !important;
        }



        .card {
            border: none !important;
        }

        .card-body {
            border: none !important;
        }

        .wf-date {
            background: #197969;
            display: inline-block;
            color: #FFFFFF;
            padding: 5px;
            position: absolute;
            top: 0;
            right: 0;
            font-size: .75rem;
        }

        @media screen and (max-width: 768px) {
            .timeline::before {
                left: 50px;
            }

            .timeline1 .timeline-img {
                left: 50px;
            }

            .timeline1 .timeline-content {
                max-width: 100%;
                width: auto;
                margin-left: 70px;
            }

            .timeline1 .timeline-item:nth-child(even) .timeline-content {
                float: none;
            }

            .timeline1 .timeline-item:nth-child(odd) .timeline-content::after {
                content: '';
                position: absolute;
                border-style: solid;
                width: 0;
                height: 0;
                top: 30px;
                left: -15px;
                border-width: 10px 15px 10px 0;
                border-color: transparent #f5f5f5 transparent transparent;
            }
        }

        .read-more-state {
            display: none;
        }

        .read-more-target {
            opacity: 0;
            max-height: 0;
            font-size: 0;
            transition: .25s ease;
        }

        .read-more-state:checked ~ .read-more-wrap .read-more-target {
            opacity: 1;
            font-size: inherit;
            max-height: 999em;
        }

        .read-more-state ~ .read-more-trigger:before {
            content: 'Show more';
        }

        .read-more-state:checked ~ .read-more-trigger:before {
            content: 'Show less';
        }
    </style>

    <style>
        @media screen and (min-width: 1000px) {
            .modal-dialog {
                max-width: 1000px; /* New width for default modal */
            }
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice {
            background-color: #2962ff !important;
            padding: 0px 12px !important;
            color: #ffffff !important;
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
    <div class="card card-5 rightmarg">
        <form class="form-inline" runat="server" method="post" enctype="multipart/form-data">
            <%--  <div class="loaderColorCont">
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--dot"></div>
                <div class="loaderColorCont--text"></div>
            </div>--%>
            <div class="card-body">
                <div class="card-body shadow" style="background: #fff;">
                    <div class="row col-md-12 col-md-6 col-md-4" style="padding-left: 30%;">
                        <h4><b>CRF OVER SIGHT MODULE</b></h4>
                    </div>
                    </br></br>
 <div class="row col-sm-12" style="padding-left: 200px">
     <div class="form-group col-sm-4">
         <label>From Date <span class="required text-danger">*</span> </label>
         <input type="text" id="txt_fromdate" class="form-control" style="width: 100%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" readonly="readonly" />


     </div>
     <div class="form-group col-sm-4">
         <label>To Date <span class="required text-danger">*</span> </label>
         <input type="text" id="txt_Todate" class="form-control" style="width: 100%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" readonly="readonly"  />
     </div>
     <div class="form-group col-sm-3">
                            <a href="#" class="btn btn-sm animated-button thar-one btn-success" style="width: 80%; margin: 5px;"
                                onclick="return getDate();" id="btnSubmit">Search</a>

                        </div>

 </div>
                    </br></br>
                    
                   <div class="row">
                       <label class="col-md-2 align-left ">TA Completed CRF <span class="required text-danger">*</span> </label>
                       <%--<div class="col-md-10 align-left">--%>
                       <select id="ddlCrf" class="form-control" style="width: 80%;" name="CRF_Sel" onchange="fillCRFData()">
                           <option value="-1">Choose CRF</option>
                       </select>
                       <%-- </div>--%>
                   </div>
                    </br></br>
                      <div class="row">

                          <label class="col-md-2 align-left ">Verified percentage<span class="required text-danger">*</span> </label>

                          <input type="text" class="form-control" style="width: 10%; box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" maxlength="3" id="TNoc1" title="TNoc1" onkeypress="return isNumber(event, this.value, 0)" readonly="readonly" />

                      </div>
                </div>
                </br>
               
         
            <div class="card-body shadow" style="background: #fff;" id="frsdiv">
                <div class="row">
                    <div class="col-md-4 text-left font-12">
                        <div class="form-group">
                            <div class="col-md-3" id="sNameDiv">
                            </div>
                            <div class="col-md-9">
                                <strong><span id="lblCreateBy" class="head5 text-primary" style="margin-left: 10px; margin-top: -40px;"></span>
                                    <br />
                                    <span id="lblDepartment" style="margin-left: 10px; margin-top: -40px;" class="head7"></span></strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label style="font-size: 14px;">SUBJECT :</label>
                            <span id="lblSubject" class="head5 text-primary"></span>
                        </div>
                    </div>
                    <div class="col-md-2 align-left" style="display: none;" id="btnEnQuiry">
                        <a href="#" class="btn btn-block btn-danger btn-flat" data-target="#ModeModal" data-toggle="modal" onclick="ModFill();" style="width: 100%; margin: 0px;">
                            <i class="fa fa-reply-all"></i>&nbsp;&nbsp;Enquiry&nbsp;&nbsp;<span class=" flashit badge badge-light animation-fadeIn" id="pendCntView">0</span></a>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-4">
                        <label style="font-size: 14px;">CRF ID :</label>
                        <span id="lblNoteId" class="head5 text-primary"></span>
                        <input type="hidden" name="NoteId" id="hdnNoteId" /><input type="hidden" name="NoteOrderId" id="hdnNoteOrderId" />
                        &nbsp&nbsp&nbsp&nbsp<strong><span class="label label-rounded" id="lblPriority"></span></strong>
                    </div>
                    <div class="col-md-4 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">CREATED DATE  : </label>
                            <strong><span id="lblCreateDate" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>

                    <div class="col-md-4 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">TECHLEAD :</label>
                            <strong><span id="lblDocType" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">DEVELOPER : </label>
                            <strong><span id="lblFirm" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">TESTER : </label>
                            <strong><span id="lblTester" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                </div>

                <div class="row col-md-2 col-sm-2 col-xs-4" id="showDeleteButton" style="display: none">
                    <a href="#" class="btn btn-block btn-outline-danger btn-flat" style="width: 100%; margin: 0px;"
                        onclick="return noteDelete();" id="showCancelBtn"><i class="fa fa-trash"></i>&nbsp;&nbsp;Delete</a>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">OBJECTIVE : </label>
                            <strong><span id="lblobj" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>

                    <div class="col-md-4 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">CRF COST :</label>
                            <strong><span id="costid" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">IMPACTING MODULE  :</label>
                            <strong><span id="lblimpact" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>

                    <div class="col-md-4 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">USER NUMBER :</label>
                            <strong><span id="USERPHNNUM" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">TESTER SUGGESTION  :</label>
                            <strong><span id="lblsuggestion" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                    <div class="col-md-4 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">CIRCULAR_ID/PAPERLESS_ID :</label>
                            <strong><span id="circularid" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                </div>

                <%-- <div class="row">
                    <div class="col-md-6 font-10">
                        <div class="form-group">
                            <label style="font-size: 14px;">CRF COST :</label>
                        </div>
                    </div>
                    <div class="col-md-6 align-left">
                        <div class="form-group">
                            <strong><span id="costid" class="font-14 text-primary"></span></strong>
                        </div>
                    </div>
                </div>--%>
            </div>
                <br />
                <div class="row" id="tbl1">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table1 table-hover" id="tblTarStatus">
                            </table>
                        </div>
                    </div>
                </div>

                <div class="card-body shadow" id="scnddiv">
                    <h5 class="modal-title" id="myLargeModalLabel">CRF Content</h5>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">

                            <div class="summernoteview">
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="card-body shadow" id="docs">

                    <h3 class="panel-title align-left">Attachments</h3>

                    <hr />
                    <div class="row ">
                        <div class="col-md-6" id="attFiles" style="display: none">
                            <h6 class="modal-title" id="lblFiles">Requirement</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblFiles">
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6" id="testCases" style="display: none">
                            <h6 class="modal-title" id="lblTestCase">Test Cases</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblTestCase">
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6" id="attChange_doc" style="display: none">
                            <h6 class="modal-title" id="lblChange_doc">Change Documents</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblChange_doc">
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6" id="testArtifacts" style="display: none">
                            <h6 class="modal-title" id="lblTestArtifact">Testing Artifacts</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblTestArtifact">
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" id="attReleaseDoc" style="display: none">
                            <h6 class="modal-title" id="lblReleaseDoc">Release Notes</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblReleaseDoc">
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6" id="otherDoc" style="display: none">
                            <h6 class="modal-title" id="lblotherDoc">Other Documents/Approvals</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblotherDoc">
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6" id="testresult" style="display: none">
                            <h6 class="modal-title" id="lbltestresult">TestResult Form</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tbltestresult">
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6" id="Testrequestform" style="display: none">
                            <h6 class="modal-title" id="lblTestrqstfrm">Test Request Form </h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblTestrqstfrm">
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" id="BADoc" style="display: none">
                            <h6 class="modal-title" id="BADocment">BA ATTACHED FILES</h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="BADocments">
                                </table>
                            </div>
                        </div>

                    </div>
                    <%--  code review attachments  --%>
                    <div class="row">
                        <div class="col-md-6" id="codeReviewRmkDiv" style="display: none">
                            <h6 class="modal-title" id="hRemarks">Source Code Review </h6>
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblCodeReview">
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <br />
                <div class="card-body shadow" id="developtadetls">
                    <div class="row" id="taDetails" style="display: none">
                        <div id="devTA" class="panel-group col-md-12 align-center padding-bottom-10px">


                            <h3 class="panel-title align-left">Development TA Details</h3>

                            <hr />
                            <table class="table table-hover align-center " id="tabChange">
                                <tbody>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <br />
                <div class="card-body shadow" id="Testingdetls">
                    <div class="row">

                        <div class="col-md-12" id="test_TA" style="display: none">
                            <h5 class="modal-title" id="lblFdiles">Testing TA Details</h5>
                            <hr />
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblTestingTADtls">
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <br />
                <div class="card-body shadow" id="developdetls">
                    <div class="row">

                        <div class="col-md-12" id="Devlp_wise">
                            <h5 class="modal-title" id="lblF">Developers Details </h5>
                            <hr />
                            <div class="table-responsive">
                                <table class="table1 table-hover" id="tblDeveloperwise">
                                </table>
                            </div>
                        </div>

                    </div>
                </div>

                <br />
                <div class="card-body shadow" id="wrkflow">
                    <h5 class="modal-title" id="lblWrkFlow">Work Flow</h5>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card animated bounceIn" style="background-color: #fff;" id="WorkFlowSection">
                                <section class="timeline1">
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <div id="ModeModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="row col-md-12">
                                    <h4 <%--style="font-size:30%; width:100%;"--%> class="col-md-11 align-left ">Ask Here.!</h4>
                                    <div class="col-md-1 col-sm-2 col-xs-4">
                                        <button type="button" class="btn btn-block btn-outline-danger btn-sm" onclick="ClearPopUp();" style="text-align: center;" data-dismiss="modal">x</button>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-body">

                                <!-- Main content -->
                                <section class="content">
                                    <%--<div class="container-fluid">--%>
                                    <%--<div class="row">
                        <div class="col-md-12">--%>
                                    <!-- Default box -->
                                    <div class="card">
                                        <div class="card-body">
                                            <form role="form">

                                                <div class="row col-md-12" style="padding-bottom: 10px;">
                                                    <label class="col-md-2 align-left ">Choose Request</label>
                                                    <div class="form-group col-md-4" style="padding-left: 0;">
                                                        <select class="form-control tlead select2" style="width: 100%;" onchange="DdlEnquiryToFill();" id="ddlCrfReq">
                                                        </select>
                                                    </div>
                                                    <label class="col-md-2 align-left ">Enquiry To</label>

                                                    <div class="form-group col-md-4" style="padding-left: 0;">
                                                        <select class="form-control tlead select2" style="width: 102%;" onchange="" id="ddlToUser">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row col-md-12" style="padding-bottom: 10px;">
                                                    <label class="col-md-2 align-left ">Message</label>
                                                    <div class="form-group col-md-10" style="padding-left: 0;">
                                                        <textarea rows="1" cols="" class="form-control" style="width: 100%" name="Remarks" id="txtMessage" title="Remarks" oninput="this.value = this.value.replace(/[^-@.,/#&+\w\s]/g, '');">
                                                </textarea>
                                                    </div>
                                                </div>
                                                <div class="row col-md-12" style="padding-bottom: 10px;">
                                                    <label class=" col-md-2 align-right">Type of Enquiry </label>
                                                    <div class="col-md-2 align-left ">
                                                        <input type="radio" name="rbEnqType" id="rbDelay" /><span style="color: blue"> &nbsp;&nbsp;Delay &nbsp;&nbsp;&nbsp;&nbsp; </span>
                                                        <input type="radio" name="rbEnqType" id="rbOther" /><span style="color: blue"> &nbsp;&nbsp;Other</span>
                                                    </div>
                                                </div>

                                                <div class="row col-md-12" style="padding-bottom: 10px;">
                                                    <label class="col-md-2 align-left "></label>
                                                    <div class="form-group col-md-2" style="padding-left: 0;">
                                                        <button type="button" class="btn btn-block btn-outline-info btn-flat" onclick="return EnquiryConfirm();"><i class="fa  fa-envelope">&nbsp;&nbsp;</i>Sent</button>
                                                    </div>
                                                    <div class="form-group col-md-2" style="padding-left: 0;">
                                                        <button type="button" class="btn btn-block btn-outline-danger btn-flat" data-dismiss="modal" onclick="return ClearPopUp();">Exit</button>
                                                    </div>
                                                    <div class="form-group col-md-2" style="padding-left: 0;">
                                                    </div>
                                                    <div class="form-group col-md-4" style="padding-left: 0;">
                                                        <input class="" type="checkbox" id="chkConfirm" />
                                                        <label for="chkConfirm" class="">&nbsp;&nbsp;Enquiry Fininshed</label>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </section>
                            </div>
                            <div class="modal-footer">
                                <div class="card-body shadow" id="IdTree" style="display: none; padding-bottom: 10px;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class=" animated bounceIn" style="background-color: #fff;" id="WorkFlowSectionPop">
                                                <section class="timeline1 card">
                                                </section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                </br>
            
             
             
                    <div class="row" id="cnfrm">
                        <div class="card-body shadow" style="background: #fff;">
                            <div class="form-group col-sm-8">
                                <label class="col-md-4 "  style="padding-left:70px;">TA status verification<span class="required text-danger">*</span> </label>

                                <div class="div-select-dark">
                                    <select class="select-dark"  name="status" id="ddlstatus" style="width: 100px;">

                                        <option value="-1" selected disabled>select</option>
                                        <option value="1">YES</option>
                                        <option value="2">NO</option>

                                    </select>
                                </div>
                            </div>


                            </br></br>
                    <div class="row">

                        <label class="pure-material-textfield-outlined">
                            <textarea rows="2" cols="100" name="Remarks" id="txtRemarks" maxlength="3500" title="Remarks" oninput="this.value = this.value.replace(/[^-@.,/#&+\w\s]/g, '');"></textarea>
                            <span>Remarks</span>
                        </label>

                    </div>
                            </br></br>
                   

                    <div class="row" id="showSubmitBtn" style="padding-left: 300px;">
                        <div class="col-md-3 align-left ">
                            <a href="#" class="btn btn-sm animated-button thar-one btn-success" style="width: 100%; margin: 5px;"
                                onclick="return ConfirmHeadverification();" id="btnSubmit1"><i class="fa fa-thumbs-up"></i>Confirm</a>

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
    <input id="hdUserId" type="hidden" runat="server" />
    <input id="hdRqstID" type="hidden" runat="server" />
    <input id="hdBranchId" type="hidden" runat="server" />
    <input id="hdFirmId" type="hidden" runat="server" />
    <input id="hdSesssion" type="hidden" runat="server" />
</asp:Content>
