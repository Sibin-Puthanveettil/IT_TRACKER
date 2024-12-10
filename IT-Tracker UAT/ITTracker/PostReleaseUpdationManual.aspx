<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="PostReleaseUpdationManual.aspx.cs" Inherits="ITTracker.PostReleaseUpdationManual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../App_Themes/Theme/assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/MultipleUpload.css" rel="stylesheet" />
    <script src="js/MultipleUpload.js"></script>
      <link href="StyleAutoComplete.css" rel="stylesheet" />
    <script src="AutoCompleteJS.js"></script>
    <script src="js/aes.js"></script>
     <style>
         div.containerr {
             padding: 10px;
         }

         .background-card {
             padding: 15px;
             padding-left: 15px;
             background: white;
             border-radius: 8px;
             box-shadow: 0px 0px 5px #00000030;
             padding-left: 40px;
             margin-left: 1%;
             margin-right: 1%;
             margin-top: 5%;
             height: auto;
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
    <script>
        $(window).on('load', function () {
             $("#txt_Releasedate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        maxDate: new Date(),
    });
        });
        $(document).ready(function () {
            $('.summernoteview').summernote({
                height: 100, // set editor height
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: false, // set focus to editable area after initializing summernote
                toolbar: [
                ]
            });
            $(".summernoteview").summernote("disable");
            $("#summernoteview").summernote("fullscreen.toggle");
        });

        function Decrypt(value) {
    var result = "";
    var array = value.split("-");

    for (i = 0; i < array.length; i++) {
        result += String.fromCharCode(array[i] - 10);
    }
    return result;
}

        function fillCRFData() {
             if ($("#crfid").val() == "") {
     alert("Please enter crf id ...!");
     
     return false;
            }
            $("#btnSearch").hide();
            $("#ddlCrf").focus();
            var CRFID = $("#crfid").val()
           
            CRFSearch(CRFID);

            detailsLoad(CRFID);
            loadreqids(CRFID);
            getuserid(CRFID);


        }
        function loadreqids(CRFID) {

             $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "PostReleaseUpdationManual.aspx/getFillData",
        data: "{pageVal:'getrequest', pageval1 :'" + CRFID + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
           
            $.each(Result, function (key, value) {
                $('#ddlreq').append($("<option></option>").val(value.id).html(value.name));
            });
        }
    });

        }

        function getuserid(CRFID) {

             $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "PostReleaseUpdationManual.aspx/getFillData",
        data: "{pageVal:'getusrid', pageval1 :'" + CRFID + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
          
            $.each(Result, function (key, value) {
                $('#ddlusrid').append($("<option></option>").val(value.id).html(value.name));
            });
        }
    });

        }
        function CRFSearch(CRFID) {
         
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                url: "PostReleaseUpdationManual.aspx/getFillData",
                data: "{pageVal:'DraftApproveDetailTaTargetDate', pageval1 :'" + CRFID + "'}",
                dataType: "json",
                success: function (Result) {

                    Result = Result.d;
                    $.each(Result, function (key, value) {
                        $("#dtls").show();
                        var crfdtl = value.id;

                        var cdtl = crfdtl.split('±');

                        $('#lblTeam1').html(cdtl[0]);
                        $('#lblType1').html(cdtl[1]);
                        $('#lblReqtr1').html(cdtl[2]);
                        $('#lblRqstDt1').html(cdtl[3]);
                        $('#lblTarDt1').html(cdtl[6]);
                        $('#lblUserExpectDate1').html(cdtl[4]);
                        if (cdtl[7] == 1) {
                            $('#lblErrorImpact1').html("Yes");

                        }
                        else {
                            $('#lblErrorImpact1').html("No");

                        }
                        if (cdtl[5] == 1) {
                            $('#lblPrior1').html("High");
                            $('#lblPrior1').prop(color = red);
                        } else if (cdtl[5] == 2) {
                            $('#lblPrior1').html("Medium");
                            $('#lblPrior1').prop(color, red);
                        } if (cdtl[5] == 3) {
                            $('#lblPrior1').html("Low");
                            $('#lblPrior1').prop(color, red);

                        }
                    });
                },
                error: function (Result) {

                    alert(Result);
                }
            });

        }

        function detailsLoad(noteid) {
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                url: "PostReleaseUpdationManual.aspx/getRequestNote",
                data: "{pageVal:'GetRequestNotes', pageval1:'" + noteid + "',pageval2:'2'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    $('.summernoteview').summernote('code', Result);
                }
            });
        }

        function frmExit() {
    window.open("index.aspx", "_self");

        }
        function drpselect() {
    var status = $("#crfwrkstatus").val();
    if (status == 4) {
        $("#txt_Releasedate").hide();
        $("#rdt").hide();
    }
    else {
        $("#txt_Releasedate").show();
        $("#rdt").show();
    }
}
function ConfirmNote() {

            if ($("#crfid").val() == "") {
                alert("Please enter crf id ...!");
                $("#crfid").focus();
                return false;
            }
            
    if ($("#ddlreq").val() == -1) {
     alert("Please Choose request id...!");
     $("#ddlreq").focus();
     return false;
    }

           var req= $("#ddlreq").val();
            $("[id*=hdRqstID]").val(req);
           var requestid= $("[id*=hdRqstID]").val();
            

        

      if ($("#ddlusrid").val() == -1) {
     alert("Please Choose User id...!");
     $("#ddlusrid").focus();
     return false;
    }
            var stats1 = $('#crfstatus option:selected').val();
           
            if (stats1 == "-1") {
                alert("Please Select Is this CRF already released..");
                $("#crfstatus").focus();
                return false;
            }

            var stats = $('#crfwrkstatus option:selected').val();
            
    $("[id*=hdstatus]").val(stats);

            if (stats == "-1") {
                alert("Please Select QA Post Release Status..");
                $("#crfwrkstatus").focus();
                return false;
    }
    if (stats != 4) {
        txt_Releasedate = $('#txt_Releasedate').val();
        if (txt_Releasedate == "") {
            alert("Please choose Release date..!");

            return false;

        }
    }
            if (stats == "1") {
                uploadedElements = $(".file-uploaded");
                if (uploadedElements.length <= 0) {

                    alert("Please Attach File..! ");
                    return false;
                }
                
            }
           
            if ($("#txtRemarks").val() == "" || $("#txtRemarks").val() == null) {
                alert("Please add your remark..!");
                $("#txtRemarks").focus();
                return false;
    }
     var remm = $("#txtRemarks").val();
    if (remm.trim() == "") {
        Swal.fire("Kindly add Remarks..!");
        return false;

    }
    var usr = $("#ddlusrid").val();

            var type = 1;
             attachfile();
    if (stats == "4") {
        //                1                         2                             3                         4            5                 6             7            8
        var crfid = $("#crfid").val() + '§' + $("#ddlreq").val() + '§' + $("[id*=hdUserId]").val() + '§' + stats + '§' + '' + '§' + type + '§' + stats1 + '§' + usr;
    }
    else {
         //                1                         2                             3                         4                   5                 6             7            8
        var crfid = $("#crfid").val() + '§' + $("#ddlreq").val() + '§' + $("[id*=hdUserId]").val() + '§' + stats + '§' + txt_Releasedate + '§' + type + '§' + stats1 + '§' + usr;


    }
    var remark = $("#txtRemarks").val();


            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                url: "PostReleaseUpdationManual.aspx/Confirmdata",
                data: "{pageVal:'postreleasecrfupdation', pageval1 :'" + crfid + "',pageval2:'" + remark + "',pageval3:''}",
                dataType: "json",
                async: false,
                success: function (Result) {
                    $('.block-ui').addClass('clear');
                    Result = Result.d;

                    var noteid = Result;
                    if (noteid.includes("µ")) {
                        var msg = noteid.split("µ");
                        var stat = msg[0];
                        var content = msg[1];
                        if (stat == "9") {
                            dangerAlert(content, 5000);
                            return false;
                        }
                    }
                    if (noteid != "0") {
                        let timerInterval
                        Swal.fire({
                            width: 400,
                            type: 'success',
                            title: 'Success!',
                            html: "Success ",
                            //showConfirmButton: false,
                            allowOutsideClick: false,
                            timer: 10000,
                            onBeforeOpen: () => {
                                //Swal.showLoading()
                                timerInterval = setInterval(() => {
                                    Swal.getContent().querySelector('strong')
                                        .textContent = Swal.getTimerLeft()
                                }, 100)
                            },
                            onClose: () => {
                                clearInterval(timerInterval)
                                window.open('PostReleaseUpdationManual.aspx', '_self');
                            }
                        }).then((result) => {
                            if (
                                // Read more about handling dismissals
                                result.dismiss === Swal.DismissReason.timer
                            ) {
                                window.open('PostReleaseUpdationManual.aspx', '_self');
                            }
                        })
                    }
                    else {
                        alert("Someting went wrong.! Please contact IT Support.!");
                    }

                }
            });
        }
        
        function attachfile() {
            debugger;
             uploadedElements = $(".file-uploaded");
               

                    for (let i = 0; i < uploadedElements.length; i++) {

                        let extension = "";
                        let element = uploadedElements.eq(i)[0];
                        let fileList = element.files;
                        let fileReader = new FileReader();
                        if (fileReader && fileList && fileList.length) {
                            let fileSize = fileList[0].size / 1048576;
                            if (fileSize > 10) {
                                //dangerAlert("Please Upload Files Less Than 10MB..!", 3000);
                                alert("Please Upload Files Less Than 10MB");
                                return false;
                            }
                            let fileName = fileList[0].name;
                            // Use a regular expression to trim everything before final dot
                            extension = fileName.replace(/^.*\./, '');
                            // Iff there is no dot anywhere in filename, we would have extension == filename,
                            // so we account for this possibility now
                            if (extension == fileName) {
                                extension = '';
                            } else {

                                extension = extension.toLowerCase();
                            }
                            fileReader.readAsDataURL(fileList[0]);
                            fileReader.onload = function () {

                                let fileno = i + 1;
                                let imageData1 = fileReader.result;
                                let InputData1 = $("[id*=hdRqstID]").val() + "µ" + fileno + "µ" + extension + "µ" + fileName.replace(/[^a-zA-Z0-9._]/g, '') + "µ" + $("[id*=hdUserId]").val();

                                var sessionkey = $("[id*=hdSesssion]").val();
                                var keySession = sessionkey.substring(0, 16);

                                var key = CryptoJS.enc.Utf8.parse(keySession);

                                var iv = CryptoJS.enc.Utf8.parse(keySession);

                                var encryptedInput = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(InputData1), key,
                                    {
                                        keySize: 128 / 8,
                                        iv: iv,
                                        mode: CryptoJS.mode.CBC,
                                        padding: CryptoJS.pad.Pkcs7
                                    });

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "PostReleaseUpdationManual.aspx/UploadingFiles",
                                    data: "{ImageData:'" + imageData1 + "',InputData:'" + encryptedInput + "'}",
                                    dataType: "json",
                                    async: false,
                                    success: function (Result) {


                                        if (Result.d.toString() == "666") {

                                            dangerAlert("Failed to upload files. File type not supported. Please try again.", 3000);
                                            return flase;

                                        }
                                        else {
                                            if (i == uploadedElements.length - 1) {



                                            }
                                        }

                                    },
                                    error: function (Result) {
                                        //alert(Result);
                                        let timerInterval
                                        Swal.fire({
                                            width: 400,
                                            type: 'error',
                                            title: 'Oops...!',
                                            html: Result,
                                            //showConfirmButton: false,
                                            allowOutsideClick: false,
                                            timer: 5000,
                                            onBeforeOpen: () => {
                                                //Swal.showLoading()
                                                timerInterval = setInterval(() => {
                                                    Swal.getContent().querySelector('strong')
                                                        .textContent = Swal.getTimerLeft()
                                                }, 100)
                                            },
                                            onClose: () => {
                                                clearInterval(timerInterval)
                                                //window.open('Approve2.aspx', '_self');
                                            }
                                        }).then((result) => {
                                            if (
                                                // Read more about handling dismissals
                                                result.dismiss === Swal.DismissReason.timer
                                            ) {
                                                //window.open('Approve2.aspx', '_self');
                                            }
                                        })
                                    }
                                });

                            };
                        }
                        else {

                            return false;
                        }


                    }
                
            
        }



 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card card-5 rightmarg">
        <form class="form-inline" runat="server" method="post" enctype="multipart/form-data">
            <div class="card-body">
               <div class="row ">
       <div class="ma-header">
            <center><div class="col-md-12">
                <h5 style="color: #091221;padding-left: 213px;"><i class="icon-reorder"></i>MANUALLY UPDATE POST RELEASE UPDATION</h5>
              
                <br />
            </div></center>
        </div>
    </div>
 <div class="background-card">
        <div class="row-col-md-12 ">

             <div class="card-body">
                <div class="row">
                      <div class="form-group col-sm-6" style="padding-left: 1%;">
                   <label >Enter CRF ID:<span class="required text-danger">*</span> </label>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <input type="text" id="crfid" class="form-control" title="Creater_Name" maxlength="6"  style="width: 50%;box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black"  />

                    </div>

                    <div class="form-group col-sm-6" style="padding-left: 0;">
                        <label>Choose Request ID:<span class="required text-danger">*</span></label>&nbsp&nbsp&nbsp&nbsp&nbsp
                       <select id="ddlreq" class="form-control select2" style="width: 50%;box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" name="req">
                            <option value="-1">Choose Request id</option>
                        </select>
                    </div>
                    </div>
               
                 </br>
                   <div class="row" style="padding-left: 1%;">

                          <a href="#" class="btn btn-sm animated-button thar-one btn-primary" style="width: 13%; margin: 5px;"
                            onclick="return fillCRFData();" id="btnSearch"><i class="fa fa-thumbs-up"></i>Search</a>
                    
                   </div></br>
                  
                  <label class="col-md-1 align-right " id="myLargeModalLabel" style="padding-left: 1%;">Content </label>
                    <div id="snote" class="form-group col-md-10 padding-bottom-10px" style="color: black; display: block; text-align: initial;" contenteditable="false">
                        <div class="summernoteview" id="content">
                        </div>
                    </div></br>
                     <div class="row" id="dtls" style="display:none;" >
                  <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">IT Team : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTeam1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Request Type : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblType1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Requested By: </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblReqtr1" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                    <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">Requested Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblRqstDt1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Target Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTarDt1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Priority : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblPrior1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">User Expected Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblUserExpectDate1" style="width: 100%; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right" style="color: red">Error Report Impact : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblErrorImpact1" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                 </div>
                 </br>
                      
                
                 <div class="row">
                    <div class="form-group col-sm-6" style="padding-left: 1%;">
                        <label>Enter User ID:<span class="required text-danger">*</span></label>&nbsp&nbsp&nbsp&nbsp&nbsp
<select id="ddlusrid" class="form-control select2" style="width: 50%;box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black" name="usr">
                            <option value="-1">Choose User Id</option>
                        </select>                    </div>

                    <div class="form-group col-sm-6" style="padding-left: 0;">

                        <label>Is this CRF already released:<span class="required text-danger">*</span></label>
<div class="div-select-dark">
                            <select  name="status" id="crfstatus" style="width: 270px;">

                                <option value="-1" selected disabled>select</option>
                                <option value="1">Yes</option>
                                <option value="2">No</option>


                            </select>
                        </div>
                    </div>


                </div> </br>
                  <div class="row">
                    <div class="form-group col-sm-6" style="padding-left: 1%;">
                        <label id="rdt">Release Date:<span class="required text-danger">*</span></label>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <input type="text" id="txt_Releasedate" class="form-control" title="Created_By" maxlength="199" style="width: 50%;box-shadow: 0 4px 6px -5px hsl(0, 0%, 40%), inset 0px 4px 6px -5px black""  readonly="readonly" />
                    </div>

                    <div class="form-group col-sm-6" style="padding-left: 0;">

                        <label>QA Post Release Status:<span class="required text-danger">*</span></label>
<div class="div-select-dark">
                            <select  name="status" id="crfwrkstatus" style="width: 270px;" onchange="drpselect();">

                                <option value="-1" selected disabled>select</option>
                                <option value="1">Working</option>
                                <option value="2">Not Working</option>
                                <option value="3">Inprogress</option>
                                <option value="4">Release Pending</option>


                            </select>
                        </div>
                    </div>


                </div> </br>
                   <div class="col-md-12" id="parallelrow">
                      <div class="form-group">
                          <label for="rdbNature" style="padding-left: 1%;">Attach File : </label>&nbsp&nbsp&nbsp&nbsp&nbsp
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
                  </div></br></br>
                 
                        <label class="pure-material-textfield-outlined">

                            <textarea rows="1" cols="15" name="Remarks" id="txtRemarks" maxlength="3500" title="Remarks" oninput="this.value = this.value.replace(/[^-@.,/#&+\w\s]/g, '');"></textarea>
                            <span>Remarks</span>
                        </label></br></br>

                   <div class="row" id="showSubmitBtn">
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-success" style="width: 100%; margin: 10px;"
                            onclick="return ConfirmNote();" id="btnSubmit"><i class="fa fa-thumbs-up"></i>Confirm</a>
                    </div>
            
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <a href="#" class="btn btn-sm animated-button thar-one btn-red" style="width: 100%; margin: 10px;"
                            onclick="return frmExit();"><i class="fa fa-sign-out-alt"></i>Exit</a>
                    </div>


                </div>
             </div>
      <%--        <div class="row" style="padding-top: 10px;padding-left: 1%;">

                <div id="summernote" ></div>
                <script>
                   
                    $('#summernote').summernote({
                        height: 120,
                        width: 820,
                        toolbar: [

                        ]
                    });
                     $("#summernote").summernote("disable");
                </script>
            </div>--%></br>
         <%--    <div class="row" id="dtls" >
                  <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">IT Team : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTeam1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Request Type : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblType1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Requested By: </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblReqtr1" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                    <div class="form-group row col-md-12 padding-bottom-10px" style="color: black;">
                        <label class=" col-md-2 align-right">Requested Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblRqstDt1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Target Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblTarDt1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">Priority : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblPrior1" style="width: 150px; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right">User Expected Date : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblUserExpectDate1" style="width: 100%; color: maroon"></label>
                        </div>
                        <label class=" col-md-2 align-right" style="color: red">Error Report Impact : </label>
                        <div class="col-md-2 align-left">
                            <label class="align-left" id="lblErrorImpact1" style="width: 150px; color: maroon"></label>
                        </div>
                    </div>
                 </div>--%>
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
    <input id="hdstatus" type="hidden" runat="server" />
</asp:Content>
