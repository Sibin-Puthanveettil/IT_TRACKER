
$(window).on('load', function () {
    debugger;
    CRFLoad();
});
$(document).ready(function () {
    $('.summernoteview').summernote({
        height: 200, 
        minHeight: null, 
        maxHeight: null, 
        focus: false, 
        toolbar: [
        ]
    });
    $(".summernoteview").summernote("disable");
    $("#summernoteview").summernote("fullscreen.toggle");
});
function CRFLoad() {

    var usr = $("[id*=hdUserId]").val();

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/getFillData",
        data: "{pageVal:'sourceCodeReviewListObj', pageval1 :'" + usr + "'}",
        dataType: "json",
        success: function (Result) {
           
            Result = Result.d;
            
            $.each(Result, function (key, value) {
                $('#ddlCrf').append($("<option></option>").val(value.id).html(value.name));
                
            });
        }
    });
}
function fillCRFData() {
    debugger;
    var CRFID = $("#ddlCrf").val();
   

    $("#buttongro").show();
   
    CRFSearch(CRFID); 
    $("#snote").show();
    if (CRFID == -1) {
        $("#CrfDetailsID").hide();
    }
    else {
        $("#CrfDetailsID").show();
        //handleReturn(CRFID);

    }
    $("#textgroup1").show();
    $("#atta").show();
    $("#remar").show();
    detailsLoad(CRFID);
    GetRequestId(CRFID);
    TestCaseUploadFile(CRFID);
    Tafill(CRFID);
    var crf = $("[id*=hdRqstID]").val();
    $("#txtRemarks").val("");
}
function GetRequestId(CRFID) {

    var usr = $("[id*=hdUserId]").val();
    usr = usr + '^' + CRFID;
    var dtl = $('#ddlCrf option:selected').text();
    var ddtl = dtl.split('~');

    $("[id*=hdRqstID]").val(ddtl[0]);

}
function CRFSearch(CRFID) {
    alert('search crf')
    debugger;
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/getFillData",
        data: "{pageVal:'DraftApproveDetailTaTargetDate', pageval1 :'" + CRFID + "'}",
        dataType: "json",
        success: function (Result) {
            debugger;
            Result = Result.d;
            console.log(Result);
            $.each(Result, function (key, value) {
                var crfdtl = value.id;

                var cdtl = crfdtl.split('±');
               
                $('#lblTeam').html(cdtl[0]);
                $('#lblType').html(cdtl[1]);
                $('#lblReqtr').html(cdtl[2]);
                $('#lblRqstDt').html(cdtl[3]);
                $('#lblTarDt').html(cdtl[6]);
                $('#lblUserExpectDate').html(cdtl[4]);
                debugger;
                if ((cdtl[8] == 63) || (cdtl[8] ==64)) {
                    $('#btnReturn').hide();
                }

                if (cdtl[7] == 1) {
                    $('#lblErrorImpact').html("Yes");
                   
                }
                else {
                    $('#lblErrorImpact').html("No");
                    
                }
                if (cdtl[5] == 1) {
                    $('#lblPrior').html("High");
                    $('#lblPrior').prop(color = red);
                } else if (cdtl[5] == 2) {
                    $('#lblPrior').html("Medium");
                    $('#lblPrior').prop(color, red);
                } if (cdtl[5] == 3) {
                    $('#lblPrior').html("Low");
                    $('#lblPrior').prop(color, red);

                }
            });
        },
        error: function (Result) {

            alert(Result);
        }
    });

}
function handleReturn(noteid) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/getReturnStatus",
        data: "{pageVal:'" + noteid + "'}",
        dataType: "json",
        success: function (Result) {
            debugger;
            Result = Result.d;
        }
    });
}
function detailsLoad(noteid) {
  
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/getRequestNote",
        async: false,
        data: "{pageVal:'GetRequestNotes', pageval1:'" + noteid + "',pageval2:'2'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $('.summernoteview').summernote('code', Result);
        }
    });
}

function TestCaseUploadFile(CRFID) {
    $("#tblFiles").empty();
    var filenm = $("[id*=hdUserId]").val() + "_";
    var reqId = $("[id*=hdRqstID]").val();
   


    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/getFileData",
        async: false,
        data: "{pageVal:'GetsrccodervwDevopfile', pageval1 :'" + reqId + "', pageval2 :'" + filenm + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var valData, valData1;

            var n = 0;
            valData = Result.split('Θ');
            if ($("#tblFiles tr").length == 0) {
                $('#tblFiles').append('<thead class="bg-success text-white"><tr><th scope="col">File No</th><th scope="col">File Name</th></tr></thead>');
            }

            for (j = 0; j < valData.length - 1; j++) {

                var contentDtl = valData[j].split('µ');
                var binaryString = contentDtl[3];
                var filename = filenm + contentDtl[1];
                var extension = contentDtl[2];
                var _location = document.location.toString();
                var applicationNameIndex = _location.indexOf('/', _location.indexOf('://') + 3);
                var applicationName = _location.substring(0, applicationNameIndex) + '/';
                var myUrl;
                if (document.location.hostname === "localhost") {

                    myUrl = applicationName + "Images/" + filename;
                }
                else {

                    myUrl = applicationName + "AMS/Images/" + filename;
                }

                $('#tblFiles').append('<tbody><tr>' +
                    '<td>' + contentDtl[0] + '</td>' +
                    '<td><a href="' + myUrl + '" download="' + filename + '" class="file-list1">' + contentDtl[1] + '</a></td>' +
                    '</tr> </tbody>');
            }


        },
        error: function (Result) {

        }
    });

    if ($("#tblFiles tr").length > 1) {
        $("#attFiles").show();
    }
    else $("#attFiles").hide();
}

function frmExit() {
    window.open("index.aspx", "_self");
}

$(document).on('click', '.remove', function () {

    $(this).closest('tr').remove();
    dirRemovefromHidden();
    return false;
});
function dirRemovefromHidden() {
    var data = "";

    var table = document.getElementById('tblObject');

    var rowLength = table.rows.length;

    for (var i = 1; i < rowLength; i += 1) {
        var row = table.rows[i];

        

        var cellLength = row.cells.length;
        for (var y = 0; y < cellLength - 1; y += 1) {
            var cell = row.cells[y];
            data = data + cell.innerText + '^';
        }
        data = data + '¶';
    }

    $("[id*=hddata]").val(data);


}


function return_Developer() {

    debugger;

    var crf = $("#ddlCrf").val();
    if (crf == -1) {
        alert("Please select a CRF.!");
        $("#ddlCrf").focus();
        return false;
    }
  

    var usr = $("[id*=hdUserId]").val();
    var objdata = $("[id*=hddata]").val();


    uploadedElements = $(".file-uploaded");
        if (uploadedElements.length <= 0) {

            alert("Please Attach File..!");
            return false;
    }

    var remark = $("#txtRemarks").val();
    if (remark == "") {
        alert("Please enter remark!");
        $("#txtRemarks").focus();
        return false;
    }
    Testrequestform();
    DATA = crf + '^' + usr + '^' + $("[id*=hdRqstID]").val();

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/confirm",
        data: "{pageVal:'Returnsourcecode',pageval1 :'" + DATA + "',pageval2 :'" + remark + "', pageval3:'" + objdata + "'}",
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
                    html: "Success!! ",
                    
                    allowOutsideClick: false,
                    timer: 10000,
                    onBeforeOpen: () => {
                        
                        timerInterval = setInterval(() => {
                            Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                        window.open('SourceCodeReview.aspx', '_self');
                    }
                }).then((result) => {
                    if (
                       
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        window.open('SourceCodeReview.aspx', '_self');
                    }
                })
            }
            else {
                alert("Something went wrong..! Please contact IT support.!");
            }

        }
    });

}

function updat() {

    var crf = $("#ddlCrf").val();
    if (crf == -1) {
        alert("Please select a CRF.!");
        $("#ddlCrf").focus();
        return false;
    }
    var crfSelect = $("#ddlCrf option:selected").val();
    var remark = $("#txtRemarks").val();
    var mdn = $("#mdnames").val();
    var ff = $("#filetfs").val();
    var ul = $("#uatlink").val();
    var pro = $("#proc").val();
    var tt = $("#table").val();
    var usr = $("[id*=hdUserId]").val();
   
    var objdata = $("[id*=hddata]").val();
    var dtl;


    



        uploadedElements = $(".file-uploaded");
        if (uploadedElements.length <= 0) {

            alert("Please Attach File..!");
            return false;
        }
        Testrequestform();

    

  

DATA = crf + '^' + usr + '^' + $("[id*=hdRqstID]").val() ;

    debugger;

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "SourceCodeReview.aspx/confirm",
        data: "{pageVal:'Confirmsourcecode',pageval1 :'" + DATA + "',pageval2 :'" + remark + "', pageval3:'" + objdata + "'}",
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
                    html: "Success!! ",
                    
                    allowOutsideClick: false,
                    timer: 10000,
                    onBeforeOpen: () => {
                        
                        timerInterval = setInterval(() => {
                            Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                        window.open('SourceCodeReview.aspx', '_self');
                    }
                }).then((result) => {
                    if (
                        
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        window.open('SourceCodeReview.aspx', '_self');
                    }
                })
            }
            else {
                alert("Something went wrong..! Please contact IT support.!");
            }

        }
    });
    
}




function Testrequestform() {

    uploadedElements = $(".file-uploaded");
    if (uploadedElements.length <= 0) {

        alert("Please Attach File..! ", 3000);
        return false;
    }


    else {

        for (let i = 0; i < uploadedElements.length; i++) {

            let extension = "";
            let element = uploadedElements.eq(i)[0];
            let fileList = element.files;
            let fileReader = new FileReader();
            if (fileReader && fileList && fileList.length) {
                let fileSize = fileList[0].size / 1048576;
                if (fileSize > 10) {
                   
                    alert("Please Upload Files Less Than 10MB");
                    return false;
                }
                let fileName = fileList[0].name;
                
                extension = fileName.replace(/^.*\./, '');
                
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
                        url: "SourceCodeReview.aspx/UploadingFiles",
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
                           
                            let timerInterval
                            Swal.fire({
                                width: 400,
                                type: 'error',
                                title: 'Oops...!',
                                html: Result,
                                
                                allowOutsideClick: false,
                                timer: 5000,
                                onBeforeOpen: () => {
                                    
                                    timerInterval = setInterval(() => {
                                        Swal.getContent().querySelector('strong')
                                            .textContent = Swal.getTimerLeft()
                                    }, 100)
                                },
                                onClose: () => {
                                    clearInterval(timerInterval)
                                    
                                }
                            }).then((result) => {
                                if (
                                    
                                    result.dismiss === Swal.DismissReason.timer
                                ) {
                                    
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
}
