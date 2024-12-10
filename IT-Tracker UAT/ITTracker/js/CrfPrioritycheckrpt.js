$(window).on('load', function () {

   
   

    $("#txt_TASrtDate").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        stepMonths: true,
        todayHighlight: true,
        onSelect: function (dateText, inst) {
        }

    });
    $("#txt_TarDate").datepicker({
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

function viewReport() {

    debugger;

    var txt_TASrtDate = $('#txt_TASrtDate').val();
    var txt_TarDate = $('#txt_TarDate').val();


    if (txt_TASrtDate == "" || txt_TarDate == "") {

        alert("Please Select Date");
        return false;
    }
    if (txt_TASrtDate != "" && txt_TarDate != "") {


        var TASDateCom = $("#txt_TASrtDate").val();
        var TAEDateCom = $("#txt_TarDate").val();
        var newFrmDate = Date.parse(TASDateCom);
        var NewToDate = Date.parse(TAEDateCom);
        var dateDifference = NewToDate - newFrmDate;
        if (dateDifference < 0) {
            alert("Choose To Date greater than From Date");
            $("#txt_TASrtDate").val("");
            $("#txt_TarDate").focus();
            return false;
        }
    }

    var data = txt_TASrtDate + 'æ' + txt_TarDate;
    //alert(wh);
    encryptUrl(data);

}
function encryptUrl(dtdata) {

    debugger;
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "Crf_PriorityVerifyRpt.aspx/Encrypt",
        data: "{clearText:'" + dtdata + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            
            window.open("crfprioritychangerptdtl.aspx?mnuId=" + Result);

        }
    });
    

}