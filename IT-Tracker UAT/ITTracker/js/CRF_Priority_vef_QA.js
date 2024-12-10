$(window).on('load', function () {


  
    CRFLoad();
    $("#remar").hide();
    $("#chngp").hide();
    
});

function CRFLoad() {

    var usr = $("[id*=hdUserId]").val();

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "CRF_Priority_Verifctn.aspx/getFillData",
        data: "{pageVal:'CRF_for_Priority_chk', pageval1 :'" + usr + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            // $('#ddlCrf').append($("<option></option>").val("-1").html("Choose CRF"));
            $.each(Result, function (key, value) {
                $('#ddlCrf').append($("<option></option>").val(value.id).html(value.name));
            });
        }
    });
}

$(document).ready(function () {
    $('.summernoteview').summernote({
        height: 200, // set editor height
        minHeight: null, // set minimum height of editor
        maxHeight: null, // set maximum height of editor
        focus: false, // set focus to editable area after initializing summernote
        toolbar: [
        ]
    });
    $(".summernoteview").summernote("disable");
    $("#summernoteview").summernote("fullscreen.toggle");
});

function fillCRFData() {

    var CRFID = $("#ddlCrf").val();
    $("#checkfile").hide();
    $("#remar").show();
    $("#buttongro").show();
    CRFSearch(CRFID);
    $("#snote").show();
    if (CRFID == -1) {
        $("#CrfDetailsID").hide();
    }
    else {
        $("#CrfDetailsID").show();

    }
    $("#textgroup1").show();
    $("#atta").show();
    $("#chngp").show();
    detailsLoad(CRFID);
    GetRequestId(CRFID);
    Tafill(CRFID);
    var crf = $("[id*=hdRqstID]").val();
    $("#txtRemarks").val("");
}

function CRFSearch(CRFID) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "CRF_Priority_Verifctn.aspx/getFillData",
        data: "{pageVal:'DraftApproveDetailTaTargetDate', pageval1 :'" + CRFID + "'}",
        dataType: "json",
        success: function (Result) {

            Result = Result.d;
            $.each(Result, function (key, value) {
                var crfdtl = value.id;

                var cdtl = crfdtl.split('±');

                $('#lblTeam').html(cdtl[0]);
                $('#lblType').html(cdtl[1]);
                $('#lblReqtr').html(cdtl[2]);
                $('#lblRqstDt').html(cdtl[3]);
                $('#lblTarDt').html(cdtl[6]);
                $('#lblUserExpectDate').html(cdtl[4]);
                if (cdtl[7] == 1) {
                    $('#lblErrorImpact').html("Yes");
                    //$('#lblErrorImpact').prop(color, red);
                }
                else {
                    $('#lblErrorImpact').html("No");
                    //$('#lblErrorImpact').prop(color, red);
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

function detailsLoad(noteid) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "DeveloperUpdation.aspx/getRequestNote",
        data: "{pageVal:'GetRequestNotes', pageval1:'" + noteid + "',pageval2:'2'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $('.summernoteview').summernote('code', Result);
        }
    });
}



function Change_priority() {
    
    if ($('#rdn_chngprio').prop('checked')) {

        $("#chose_prio").show();
       
        $("[id*=hdchk]").val(1);
       
        

    }
    else {

        $("#chose_prio").hide();
        $("[id*=hdchk]").val(2);
    }

}
function frmExit() {
    window.open("index.aspx", "_self");
}
function ConfirmQAHead() {
    debugger;
    var usr = $("[id*=hdUserId]").val();
    var noteid = $('#ddlCrf option:selected').text();
    var dtls = noteid.split("~");
    var priority = $('#ddlpriority option:selected').val();
    var remark = $("#txtRemarks").val();
    var status = $("[id*=hdchk]").val();
    if ($("#ddlCrf").val() == -1) {
        alert("Please choose a CRF.!");
        $("#ddlCrf").focus();
        return false;
    }
    
    if (status == "1") {
        status = "1";
        if ($("#ddlpriority").val() == 0) {
            alert("Please choose Priority.!");
            $("#ddlCrf").focus();
            return false;
        }
    }
    else {
        status = "2";
    }
    
    if (priority == "1") {
        priorityv = "Medium";
    }
    else if (priority == "2") {
        priorityv = "Low";
    }
    else {
        priorityv = "High";
    }
    if ($("#txtRemarks").val() == "") {
        alert("Please Enter Remark.!");
        $("#txtRemarks").focus();
        return false;
    }


    
    ddata = status + '^' + priorityv + '^' + usr + '^' + dtls[4] + '^' + dtls[3] + '^' + dtls[0] + '^' + dtls[1];
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "CRF_Priority_Verifctn.aspx/QAHeadConfirm",
        data: "{pageVal:'QAHeadConfirm',pageval1 :'" + ddata + "',p_parval1:'" + remark + "'}",
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

            if (noteid != "") {
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
                        window.open('CRF_Priority_Verifctn.aspx', '_self');
                    }
                }).then((result) => {
                    if (

                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        window.open('CRF_Priority_Verifctn.aspx', '_self');
                    }
                })
            }
            else {
                alert("Something went wrong..! Please contact IT support.!");
            }

        }
    });

}
function Report() {

    window.open('Crf_PriorityVerifyRpt.aspx', '_self');

}