$(window).on('load', function () {
    Accessibility();
    $("#txt_fromdate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        onSelect: function (dateText, inst) {
        }

    });
    $("#txt_Todate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        onSelect: function (dateText, inst) {
        }

    });


});

function Accessibility() {
    debugger;
    var usr = $("[id*=hdUserId]").val();
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TA_HeadVerificationRPT.aspx/Accessibility",
        data: "{pageVal:'amsheadverification', pageval1:'" + usr + "'}",
        dataType: "json",
        success: function (Result) {


            Result = Result.d;


            if (Result == 222) {

                let timerInterval
                Swal.fire({
                    width: 400,
                    type: 'error',
                    title: 'You Are Not Authorized !',
                    html: "To View This Page!! ",
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
                        window.open('index.aspx', '_self');
                    }
                }).then((result) => {
                    if (
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        window.open('index.aspx', '_self');
                    }
                })

            }
        }
    });
}

function ConfirmHeadverificationrpt() {

    var txt_fromdate = "";
    var txt_Todate = "";

    var usr = $("[id*=hdUserId]").val();
    var stats = $('#ddlstatus option:selected').val();
    txt_fromdate = $('#txt_fromdate').val();
    txt_Todate = $('#txt_Todate').val();


    if (stats == -1) {
        alert("Please choose status..!");

        return false;

    }

    if (txt_fromdate == "" || txt_Todate == "") {
        alert("Please choose date..!");

        return false;

    }


    if (txt_fromdate != "" && txt_Todate != "") {


        var TASDateCom = $("#txt_fromdate").val();
        var TATDateCom = $('#txt_Todate').val();
        var newFrmDate = Date.parse(TASDateCom);
        var NewToDate = Date.parse(TATDateCom);
        var dateDifference = NewToDate - newFrmDate;
        if (dateDifference < 0) {
            alert("Choose To Date greater than From Date");
            $("#txt_Todate").focus();
            return;
        }
    }





    var wh = txt_fromdate + 'æ' + txt_Todate + 'æ' + stats + 'æ' + usr + 'æ';
   
    encryptUrl(wh);

}

function encryptUrl(dtdata) {

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TA_HeadVerificationRPT.aspx/Encrypt",
        data: "{clearText:'" + dtdata + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

          
            window.open("TA_HeadVerificationRptdtl.aspx?mnuId=" + Result + "");

        }
    });

}

function frmExit() {

    window.open("index.aspx", "_self");
}