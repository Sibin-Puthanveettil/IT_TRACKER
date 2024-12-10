
    $(window).on('load', function () {

            $("#frm_Date").datepicker({
                dateFormat: 'dd/MM/yy',
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                onSelect: function (dateText, inst) {}
            });
            $("#to_Date").datepicker({
                dateFormat: 'dd/MM/yy',
                maxDate:0,
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                onSelect: function (dateText, inst) {}
            });
            
        GetTeamList('#team_Select','IT_TEAM');
        GetTeamList('#delay_Select','Delay_Team_reasons');
    });


    function GetTeamList(id, flag) {
    debugger;
            try {
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                url: "CrfDelayReportMain.aspx/getFillData",
                data: "{pageVal:'" + flag + "', pageval1 :''}",
                dataType: "json",
                success: function (Result) {
                    debugger;
                    Result = Result.d;
                    $(`${id}`).append($("<option selected disabled></option>").val("-1").html("Choose Option.."));
                    $.each(Result, function (key, value) {
                        $(`${id}`).append($("<option></option>").val(value.id).html(value.name));
                    });
                }

            });
            } catch (e) {
                console.log(e);
                console.log('ajax call catch exception js ln/-80');
            }
    };


    function btnViewReport() {
        debugger;
        //let fromDate, toDate, itTeam, delayReason;
        let fromDate = $('#frm_Date').val(), toDate = $('#to_Date').val();
        let itTeam = $("#team_Select").find("option:selected").val(), delayReason = $("#delay_Select").find("option:selected").val();

        if (fromDate.trim() != "" && toDate.trim()!= "") {
            //fromDate = InpDtFrm ;
            //toDate = InpDtTo ;

            let parseFrmDt = Date.parse(fromDate)
            let parseToDt = Date.parse(toDate)

            let dateDiff = parseToDt - parseFrmDt;
            if (dateDiff < 0) {
                alert("reverse Date is not possibile");
                $("#frm_Date").val("");
                $('#to_Date').val("");
                $("#frm_Date").focus();
                return false;
            }
        } else {
            alert('Date fields should be selected');
            $('#frm_Date').focus();
            return false;
        }

        if (itTeam != "-1" && delayReason != "-1") {
            //itTeam = $("#team_Select").find("option:selected").val();
            //delayReason = $("#delay_Select").find("option:selected").val();

        } else {
            alert('make sure you select both options...!');
            return false;
        }


        let params = fromDate + '^' + toDate + '^' + itTeam + '^' + delayReason ;
        encryptUrl(params);
    }

    function encryptUrl(data) {
        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url: "CrfDelayReportMain.aspx/Encrypt",
            data: "{clearText:'" + data + "'}",
            dataType: "json",
            success: function (Result) {
                debugger;
                Result = Result.d;
                //window.open("POFormView.aspx?poid=" + Result);
                // window.open("CrfDelayReport.aspx?mnuId=" + '123' + "");
                window.open("CrfDelayReport.aspx?params=" + Result + "");

            }
        });

    }

    function crfdelayreason() {
            debugger;
    var usr = $("[id*=hdUserId]").val();

            //$.ajax({
        //    type: "post",
        //    contentType: "application/json; charset=utf-8",
        //    url: "CrfDelayReport.aspx/getFillData", 
        //    data: "{pageVal:' ', pageval1 :'" + usr + "'}",
        //    dataType: "json",
        //    async: false,
        //    success: function (Result) {
        //        Result = Result.d;
        //        $('#ddlCrfReq2').append($("<option selected disabled></option>").val("-1").html("Delay Reason.."));
        //        $.each(Result, function (key, value) {
        //            $('#ddlCrfReq2').append($("<option></option>").val(value.id).html(value.name));
        //        });
        //    }
        //});
    }

    function handleSubmit() {
            debugger;

           // let opt1 = $("#ddlCrfReq1").find('option:selected').val();
           // let opt2 = $("#ddlCrfReq2").find('option:selected').val();
           // let dataArg = $("#ddlCrfReq1").find('option:selected').val() + '~' + $("#ddlCrfReq2").find('option:selected').val() ;
           //console.log(opt1,opt2);
           // console.log($('#ddlCrfReq1  option:selected').text());
           // console.log($('#ddlCrfReq2  option:selected').text());
           // if (opt1 && opt2) {
        //     if (opt1 == -1 || opt2 == -1) {
        //         console.log("not valid options");
        //         return;
        //     }
        //     console.log("have both options");
        // } else {
        //     alert('not both options');
        // }
        //$('.summernoteview').summernote('code', Result);

        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url: "CrfDelayReportMain.aspx/GetExcellData",
            data: "{pageVal:'CrfDelayTeamReport', pageval1 :''}",
            dataType: "json",
            success: function (Result) {
                debugger;
                Result = Result.d;
                $.each(Result, function (key, value) {
                    console.log(key, value)  
                    //$('#ddlCrf').append($("<option></option>").val(value.id).html(value.name));
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                debugger;
                console.log('error send ajax call ')
            }
        });
            //} catch (e) {
        //    debugger;
        //    console.log('exception occured js report load ajax')
        //}
    }
