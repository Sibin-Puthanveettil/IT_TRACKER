$(window).on('load', function () {
   // var usr = $("[id*=hdUserId]").val();
   

    $("#txtFromDate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        onSelect: function (dateText, inst) {
        }

    });
    $("#txtToDate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        onSelect: function (dateText, inst) {
        }

    });
   
});
function frmExit() {
    window.open("index.aspx", "_self");
}

function viewMOMReport() {
   
    FromDate = $('#txtFromDate').val();
    ToDate = $('#txtToDate').val();
    var frmDateCom = $("#txtFromDate").val();
    var ToDateCom = $("#txtToDate").val();
    var newFrmDate = Date.parse(frmDateCom);
    var NewToDate = Date.parse(ToDateCom);
    var dateDifference = NewToDate - newFrmDate;
    if (dateDifference < 0) {
        alert("Choose To Date greater than From Date");
        $("#txtFromDate").val("");
        $("#txtToDate").focus();
        return;
    }

    var wh = FromDate + 'æ' + ToDate;
    encryptUrl(wh);
}
function encryptUrl(dtdata) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "BugStatusReport.aspx/Encrypt",
        data: "{clearText:'" + dtdata + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            //window.open("POFormView.aspx?poid=" + Result);
            window.open("MorningMeetingUpdnDtlRpt.aspx?mnuId=" + Result + "");

        }
    });

}