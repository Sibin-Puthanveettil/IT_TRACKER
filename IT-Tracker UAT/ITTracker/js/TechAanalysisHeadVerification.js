$(window).on('load', function () {
    Accessibility();
    dayschecking();
    $("#frsdiv").hide();
    $("#scnddiv").hide();
    $("#docs").hide();
    $("#developtadetls").hide();
    $("#Testingdetls").hide();
    $("#developdetls").hide();
    $("#wrkflow").hide();
    $("#tbl1").hide();
    $("#cnfrm").hide();
    

    
    
    
    //$("#txt_fromdate").datepicker({
    //    dateFormat: 'dd/MM/yy',
    //    changeMonth: false,  // Disable month selection
    //    changeYear: false,  // Disable year selection
    //    maxDate: new Date(new Date().getFullYear(), new Date().getMonth() - 0, 0),  // Set maxDate to last day of previous month
    //    onSelect: function (dateText, inst) {
    //        // Your existing code to handle date selection (if needed)
    //    }
    //});
   
    //$("#txt_Todate").datepicker({
    //    dateFormat: 'dd/MM/yy',
    //    changeMonth: false,  // Disable month selection
    //    changeYear: false,  // Disable year selection
    //    maxDate: new Date(new Date().getFullYear(), new Date().getMonth() - 0, 0),  // Set maxDate to last day of previous month
    //    onSelect: function (dateText, inst) {
    //        // Your existing code to handle date selection (if needed)
    //    }
    //});

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

function Accessibility() {
    debugger;
    var usr = $("[id*=hdUserId]").val();
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TechAnalysisHeadVerification.aspx/Accessibility",
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
function getDate() {
    
    txt_fromdate = $('#txt_fromdate').val();
    txt_Todate = $('#txt_Todate').val();
    var usr = $("[id*=hdUserId]").val();
    if (txt_fromdate == "" || txt_Todate == "") {
        alert("Please choose date..!");
        $('#txt_fromdate').focus();
        return false;
        

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

    }
    var wh = txt_fromdate + 'æ' + txt_Todate + 'æ' + usr + 'æ';
    
    CRFLoad(wh);
    CRFVerifiedpercentage(wh);
}
function CRFLoad(dtdata) {
    debugger;
    $('#ddlCrf').empty();
   
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TechAnalysisHeadVerification.aspx/getFillData",
        data: "{pageVal:'Getverificationcrflist',pageval1:'" + dtdata + "'}",
        dataType: "json",
        async: false,
        success: function (Result) {
            Result = Result.d;
            $('#ddlCrf').append($("<option selected disabled></option>").val("-1").html("Choose CRF"));
            $.each(Result, function (key, value) {
                $('#ddlCrf').append($("<option></option>").val(value.id).html(value.name));
                
                
                
            });
        }
    });
}


function CRFVerifiedpercentage(dtdata) {
    debugger;
    $("#TNoc1").empty();

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TechAnalysisHeadVerification.aspx/getcrfverificationcnt",
        data: "{pageVal:'getcrfverificationcnt',pageval1:'" + dtdata + "'}",
        dataType: "json",
        async: false,
        success: function (Result) {
            Result = Result.d;
            
            if (Result == "222%") {
                
                alert("No Data Found");
                return false;
            }
            else {
                $("#TNoc1").val(Result);
            }
               
           
        }
    });
}

function dayschecking() {
    debugger;

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TechAnalysisHeadVerification.aspx/getdayscount",
        data: "{pageVal:'getdayscount',pageval1:''}",
        dataType: "json",
        async: false,
        success: function (Result) {
            Result = Result.d;


            if (Result == "111") {

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

function fillCRFData() {
   
    var CRFID = $('#ddlCrf option:selected').val();
    
    ContentFill(CRFID);
    TargetDateAndStatus(CRFID);
    ContentAprroverFill(CRFID);
    GetRequestId(CRFID);
    detailsLoad(CRFID);
    Tafill(CRFID);
    fillTADetails(CRFID);
    fillDveloperwise(CRFID);
    WorkFlowFill(CRFID);
    $("#frsdiv").show();
    $("#scnddiv").show();
    //$("#docs").show();
    $("#developtadetls").show();
    //$("#Testingdetls").show();
    $("#developdetls").show();
    $("#wrkflow").show();
    $("#tbl1").show();
    $("#cnfrm").show();
}
function GetRequestId() {


    var dtl = $('#ddlCrf option:selected').text();
    var ddtl = dtl.split('~');
   
    $("[id*=hdRqstID]").val(ddtl[1]);

}

function ContentFill(noteid) {
    
    $(".loaderColorCont").show();
    

    var Data = '';
    Data = $("[id*=hdBranchId]").val() + 'µ' + $("[id*=hdFirmId]").val() + 'µ' + $("[id*=hdUserId]").val();
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getTableData",
        data: "{pageVal:'GetNoteDetails', pageval1 :'" + noteid + "', pageval2 :'" + Data + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            var contentDtl = Result.split('µ');
            document.getElementById("sNameDiv").innerHTML = "";
            var snDiv = document.createElement("div");
            snDiv.className = "ms-Persona-imageArea";
            snDiv.setAttribute('style', 'float: left;');
            var snItemDiv = document.createElement("div");
            if (contentDtl[15] == 1) { snItemDiv.className = "ms-Persona-initials ms-Persona-initials--red"; }
            else if (contentDtl[15] == 2) { snItemDiv.className = "ms-Persona-initials ms-Persona-initials--orange"; }
            else if (contentDtl[15] == 3) { snItemDiv.className = "ms-Persona-initials ms-Persona-initials--yellow"; }


            snItemDiv.innerHTML = contentDtl[14];
            snDiv.appendChild(snItemDiv);
            document.getElementById("sNameDiv").appendChild(snDiv);

            document.getElementById("lblNoteId").innerHTML = contentDtl[0];
            $("[id*=hdnNoteId]").val(contentDtl[0]);
            document.getElementById("lblSubject").innerHTML = contentDtl[2];

            document.getElementById("lblFirm").innerHTML = contentDtl[1];
            document.getElementById("lblDocType").innerHTML = contentDtl[7];
            document.getElementById("lblCreateBy").innerHTML = contentDtl[4];

            document.getElementById("lblDepartment").innerHTML = contentDtl[12];
            document.getElementById("lblobj").innerHTML = contentDtl[19];
            document.getElementById("lblimpact").innerHTML = contentDtl[20];
            document.getElementById("lblTester").innerHTML = contentDtl[21];
            document.getElementById("lblsuggestion").innerHTML = contentDtl[22];
            document.getElementById("costid").innerHTML = contentDtl[23];
            document.getElementById("USERPHNNUM").innerHTML = contentDtl[24];
            document.getElementById("circularid").innerHTML = contentDtl[25];



            document.getElementById("lblCreateDate").innerHTML = contentDtl[5];
            document.getElementById("lblNature").innerHTML = contentDtl[8];
            document.getElementById("divRemarks").innerHTML = "";

            var remkDiv = document.createElement("div");
            var remkChk = document.createElement("input");
            remkChk.setAttribute('type', 'checkbox');
            remkChk.setAttribute('id', 'post-' + contentDtl[0]);
            remkChk.className = "read-more-state";
            remkDiv.appendChild(remkChk);


            var remkP = document.createElement("p");
            remkP.className = "read-more-wrap text-maroon";
            remkP.setAttribute('style', 'margin-bottom: 0;');
            var x1 = 'Remarks :' + contentDtl[3];
            var c1 = x1.split(' ').length;
            var y1 = x1.split(' ').slice(0, 30).join(' ');
            var z1 = x1.split(' ').slice(30, c1).join(' ');


            remkP.innerHTML = y1;
            if (c1 > 30) {
                var remkSpanP = document.createElement("span");
                remkSpanP.className = "read-more-target";
                remkSpanP.innerHTML = z1;
                remkP.appendChild(remkSpanP);

            }
            remkDiv.appendChild(remkP);
            if (c1 > 30) {

                var remkLbl = document.createElement("label");
                remkLbl.setAttribute('for', 'post-' + contentDtl[0]);
                remkLbl.className = "read-more-trigger bnt-more";
                remkDiv.appendChild(remkLbl);
            }


            document.getElementById("divRemarks").appendChild(remkDiv);


            priority = document.getElementById("lblPriority");
            if (contentDtl[9] == 1) {
                document.getElementById("lblPriority").innerHTML = "High";
                priority.classList.remove('label-medium');
                priority.classList.remove('label-low');
                priority.classList.add('label-high');
            }
            else if (contentDtl[9] == 2) {
                document.getElementById("lblPriority").innerHTML = "Medium";
                priority.classList.remove('label-high');
                priority.classList.remove('label-low');
                priority.classList.add('label-medium');
            }
            else if (contentDtl[9] == 3) {
                document.getElementById("lblPriority").innerHTML = "Low";
                priority.classList.remove('label-high');
                priority.classList.remove('label-medium');
                priority.classList.add('label-low');
            }
            nature = document.getElementById("lblNature");
            if (contentDtl[17] == "Y") {
                nature.classList.remove('label-primary');
                nature.classList.add('label-high');
            }
            else {
                nature.classList.remove('label-high');
                nature.classList.add('label-primary');
            }


            $("[id*=hdnNoteOrderId]").val(contentDtl[11]);

           


            $(".loaderColorCont").fadeOut();
   },
       error: function (Result) {
        }
    });
}
function TargetDateAndStatus(noteid) {
    $("#tblTarStatus").empty();
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getTableData",
        data: "{pageVal:'TargetDateAndStatus', pageval1 :'" + noteid + "', pageval2:''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var valData, valData1, tarDate = "", Status = "";
            Result = Result + '¶';
            valData = Result.split('¶');
            if ($("#tblTarStatus tr").length == 0) {
                $("#tblTarStatus").empty();
                $('#tblTarStatus').append('<tr style="background-color:#197969;color:white"><th class="text-center">RequestId</th><th class="text-center">TechLead</th><th class="text-center">Status</th><th class="text-center">Target Date</th></tr>');
            }
            for (i = 0; i < valData.length - 1; i++) {
                valData1 = valData[i].split('µ');

                $('#tblTarStatus').append('<tbody><tr class="text-center" style="background-color:#fff;color:#7460ee; font-weight:bold;" >' +
                    '<td>' + valData1[0] + '</td>' +
                    '<td>' + valData1[2] + '</td>' +
                    '<td>' + valData1[3] + '</td>' +
                    '<td>' + valData1[1] + '</td></tr > </tbody > ');
            }

        }
    });
}

function ContentAprroverFill(noteid) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getListPending",
        data: "{pageVal:'GetApproversList', pageval1 :'" + noteid + "', pageval2 :''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            document.getElementById("lstApprovers").innerHTML = "";
            var parentUl = document.createElement("ul");
            parentUl.className = "multi-steps";

            $.each(Result, function (key, value) {

                var listOfApprove = value.lst;
                var approveList = listOfApprove.split('µ');

                // create list item for every element --a.order_id,a.approver_name,decode(a.status_id,0,'Recommended',1,'Assigned',2,'Not Assigned',3,'Not Assigned',9,'Rejected') status,to_char(a.received_date,'dd-Mon-yyyy hh:mi:ss am') received_date,to_char(a.updated_date,'dd-Mon-yyyy hh:mi:ss am') updated_date
                var listItem = document.createElement("li");
                //debugger;
                //alert(approveList[5]+approveList[6]);
                //alert($("[id*=hdUserId]").val());
                if (approveList[5] == "1" || approveList[5] == "5") {
                    //alert(approveList[6]);
                    listItem.className = "li-bar recommend is-active";
                }
                else if (approveList[5] == "3") {
                    listItem.className = "li-bar notrecommend";
                }
                else if (approveList[5] == "6") {
                    listItem.className = "li-bar  autoskip";
                }
                else {
                    listItem.className = "li-bar recommend";
                }
                listItem.setAttribute('data-toggle', 'tooltip');
                listItem.setAttribute('title', approveList[2]);
                var lValue = document.createTextNode(approveList[1]);
                listItem.appendChild(lValue);
                parentUl.appendChild(listItem);
            });
            document.getElementById("lstApprovers").appendChild(parentUl);

        },
        error: function (Result) {
        }
    });
}
function detailsLoad(noteid) {

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getRequestNote",
        data: "{pageVal:'GetRequestNotes', pageval1:'" + noteid + "',pageval2:'2'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $('.summernoteview').summernote('code', Result);
        }
    });
}
function fillTATable(data) {
    $("#tabChange").empty();
    var valData, valData1;
    valData = data.split('Θ');

    if ($("#tabChange tr").length == 0) {
        $("#tabChange").empty();
        $('#tabChange').append('<tr style="background-color:#197969;color:white"><th class="text-center">REQUEST ID</th><th class="text-center">TECHLEAD</th><th class="text-center">DEVELOPER</th><th class="text-center">START DATE</th><th class="text-center">END DATE</th><th class="text-center">PHASE</th><th class="text-center">TECHCHANGES</th><th class="text-center">DESCRIPTION</th><th class="text-center">NO OF CHANGES</th><th class="text-center">TOTAL HOURS</th></tr>');
    }
    for (i = 0; i < valData.length - 1; i++) {
        valData1 = valData[i].split('µ');

        $('#tabChange').append('<tbody><tr class="text-center" style="background-color:#fff" >' +


            '<td>' + valData1[0] + '</td>' +
            '<td>' + valData1[1] + '</td>' +
            '<td>' + valData1[2] + '</td>' +
            '<td>' + valData1[3] + '</td>' +
            '<td>' + valData1[4] + '</td>' +
            '<td>' + valData1[5] + '</td>' +
            '<td>' + valData1[6] + '</td>' +
            '<td>' + valData1[7] + '</td>' +
            '<td>' + valData1[8] + '</td>' +
            '<td>' + valData1[9] + '</td></tr > </tbody > ');
    }
    if ($("#tabChange tr").length > 1) {
        $("#taDetails").show();
    }
    else $("#taDetails").hide();
}

function Tafill(noteid) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getTableData",
        data: "{pageVal:'TACompleteData', pageval1 :'" + noteid + "', pageval2:''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            fillTATable(Result);
        }
    });
}
function fillTADetails(req) {
    $("#tblTestingTADtls").empty();
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/TestingTADtls",
        data: "{pageVal:'TestingTADtls1', pageval1 :'" + req + "', pageval2:''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (Result != "" && Result != null) {
                // alert(Result);
                var valData, valData1, valData2;
                valData2 = Result.split('¶');
                $("#test_TA").show();
                $("#tblTestingTADtls").empty();
                if ($("#tblTestingTADtls tr").length == 0) {
                    $('#tblTestingTADtls').append('<tr style="background-color:#197969;color:white"><th class="text-center">REQUEST ID</th><th class="text-center">TEST LEAD</th><th class="text-center">TEST ENGINEER</th><th class="text-center">PROJECT TYPE</th><th class="text-center">PHASE</th><th class="text-center">DESCRIPTION</th><th class="text-center">TEST STARTDATE</th><th class="text-center">TEST ENDDATE</th><th class="text-center">WORK HOURS</th></tr>');
                }
                for (i = 0; i < valData2.length; i++) {
                    valData1 = valData2[i].split('µ');
                    $('#tblTestingTADtls').append('<tbody><tr class="text-center" style="background-color:#fff" >' +
                        '<td>' + valData1[9] + '</td>' +
                        '<td>' + valData1[0] + '</td>' +
                        '<td>' + valData1[1] + '</td>' +
                        '<td>' + valData1[4] + '</td>' +
                        '<td>' + valData1[5] + '</td>' +
                        '<td>' + valData1[6] + '</td>' +
                        '<td>' + valData1[2] + '</td>' +
                        '<td>' + valData1[3] + '</td>' +
                        '<td>' + valData1[8] + '</td></tr > </tbody > ');
                }

            }
            else {
                $("#test_TA").hide();
            }

        }
    });


}
function fillDveloperwise(noteid) {
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/TestingTADtls",
        data: "{pageVal:'Developerdetails', pageval1 :'" + noteid + "', pageval2:''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            // alert("hai");
            // alert(Result);
            if (Result != "" && Result != null) {

                var valData, valData1, valData2;
                valData2 = Result.split('¶');
                $("#Devlp_wise").show();
                $("#tblDeveloperwise").empty();
                // if ($("#tblDeveloperwise").length == 0) {
                $('#tblDeveloperwise').append('<tr style="background-color:#197969;color:white"><th class="text-center">Developer Name </th><th class="text-center">Assigned Days </th><th class="text-center">Manhour</th><th class="text-center">Started Date</th><th class="text-center">End Date </th><th class="text-center">Delay starting Date </th><th class="text-center">Delay completing Date </th></tr>');
                //  }
                for (i = 0; i < valData2.length; i++) {
                    valData1 = valData2[i].split('µ');
                    $('#tblDeveloperwise').append('<tbody><tr class="text-center" style="background-color:#fff" >' +
                        '<td>' + valData1[0] + '</td>' +
                        '<td>' + valData1[1] + '</td>' +
                        '<td>' + valData1[2] + '</td>' +
                        '<td>' + valData1[3] + '</td>' +
                        '<td>' + valData1[4] + '</td>' +
                        '<td>' + valData1[5] + '</td>' +
                        '<td>' + valData1[6] + '</td></tr > </tbody > ');
                }

            }
            else {
                $("#Devlp_wise").hide();
            }

        }
    });


}
function WorkFlowFill(noteid) {
    //a.note_id,e.firm_abbr Firm,a.subject,a.remarks,initcap(d.EMP_NAME) Created_by,to_char(a.created_date, 'dd-Mon-yyyy hh:mi:ss am') createdDate,to_char(b.received_date, 'dd-Mon-yyyy hh:mi:ss am') received_date,c.doc_name,decode(a.nature, 'Y', 'Confidential', 'Non Confidential') nature,a.priority,decode(a.circular, 'Y', 'Yes', 'No') circular
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "ViewerNoteDetails.aspx/getListPending",
        data: "{pageVal:'GetWorkFlowList', pageval1 :'" + noteid + "', pageval2 :''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            document.getElementById("WorkFlowSection").innerHTML = "";
            var parentSec = document.createElement("section");
            parentSec.className = "timeline1";

            var parentDiv = document.createElement("div");
            parentDiv.className = "container";
            var sideNum = 1;
            $.each(Result, function (key, value) {

                var listOfApprove = value.lst;
                var workflowList = listOfApprove.split('µ');

                var tlitemDiv = document.createElement("div");
                tlitemDiv.className = "timeline-item";
                var tlimgDiv = document.createElement("div");
                tlimgDiv.className = "timeline-img";
                tlimgDiv.innerHTML = workflowList[0];
                tlitemDiv.appendChild(tlimgDiv);

                var tlConDiv = document.createElement("div");

                tlConDiv.className = "timeline-content js--fadeInLeft";

                var tlConDateDiv = document.createElement("div");
                tlConDateDiv.className = "wf-date";
                tlConDateDiv.innerHTML = workflowList[1];

                var tlConHead = document.createElement("h6");
                tlConHead.innerHTML = workflowList[2];
                var tlConHead1 = document.createElement("h7");
                tlConHead1.setAttribute('style', 'color:#e32bb5;');
                tlConHead1.innerHTML = workflowList[3];

                tlConDiv.appendChild(tlConDateDiv);
                tlConDiv.appendChild(tlConHead);
                tlConDiv.appendChild(tlConHead1);

                var tlInChk = document.createElement("input");
                tlInChk.setAttribute('type', 'checkbox');
                tlInChk.setAttribute('id', 'post-' + sideNum);
                tlInChk.className = "read-more-state";
                tlConDiv.appendChild(tlInChk);

                var tlConP = document.createElement("p");
                tlConP.className = "read-more-wrap";
                var x = workflowList[4];
                var c = x.split(' ').length;
                var y = x.split(' ').slice(0, 10).join(' ');
                var z = x.split(' ').slice(10, c).join(' ');


                tlConP.innerHTML = y;
                if (c > 10) {
                    var tlConSpanP = document.createElement("span");
                    tlConSpanP.className = "read-more-target";
                    tlConSpanP.innerHTML = z;
                    tlConP.appendChild(tlConSpanP);
                }
                tlConDiv.appendChild(tlConP);
                if (c > 10) {
                    var tlLbl = document.createElement("label");
                    tlLbl.setAttribute('for', 'post-' + sideNum);
                    tlLbl.className = "read-more-trigger bnt-more";
                    tlConDiv.appendChild(tlLbl);
                }


                tlitemDiv.appendChild(tlConDiv);
                parentDiv.appendChild(tlitemDiv);
                sideNum = sideNum + 1;

            });
            parentSec.appendChild(parentDiv);
            document.getElementById("WorkFlowSection").appendChild(parentSec);


        },
        error: function (Result) {
        }
    });
}
function frmExit() {

    window.open("index.aspx", "_self");
}

function ConfirmHeadverification() {

    var CRFID = $('#ddlCrf option:selected').val();
    if ($('#ddlCrf').val() == -1) {
        alert("Please Select a CRF..");
        $("#ddlCrf").focus();
        return false;
    }
    var stats = $('#ddlstatus option:selected').val();
  
    if (stats == "-1") {
        alert("Please Choode Status..");
        $("#ddlstatus").focus();
        return false;
    }
    var req = $("[id*=hdRqstID]").val();
    
    var remark = $('#txtRemarks').val();
    if ($("#txtRemarks").val() == "") {
        alert("Please Enter Remark...!!!");
        $("#txtRemarks").focus();
        return false;
    }
    var usr = $("[id*=hdUserId]").val();
    data = CRFID + 'æ' + req + 'æ' + usr + 'æ' + stats + 'æ' + remark;
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "TechAnalysisHeadVerification.aspx/confirm",
        data: "{pageVal:'TA_headverification', pageval1 :'" + data + "', pageval2:''}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            if (Result == '111') {
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
                        window.open('TechAnalysisHeadVerification.aspx', '_self');
                    }
                }).then((result) => {
                    if (
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        window.open('TechAnalysisHeadVerification.aspx', '_self');
                    }
                })
            }
            else {
                alert("Something went wrong.!Please contact IT Support");
            }
            //fillTATable(Result);
        }
    });

}
