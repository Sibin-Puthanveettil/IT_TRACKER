<%@ Page Title="" Language="C#" MasterPageFile="~/PWA_Master.Master" AutoEventWireup="true" CodeBehind="Crfstsdashboard.aspx.cs" Inherits="ITTracker.Crfstsdashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Crfstsdash.js"></script>
    <style>
/* Style the tab */
.tab1 {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab1 button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  /*cursor: pointer;*/
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab1 button:hover {
  background-color: #ddd;
}

td:hover { 
   background: yellow; 
}
/*td a { 
   display: block; 
   border: 0.2px solid black;
   padding: 5px; 
}*/



/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent1 {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

        .btns:hover{
            color:black !important;
        }

        .hovereffect:hover {
    background: #f4f6f9;
}

        .table-bordered td, .table-bordered th {

    padding: 8px;
}

.over {
    overflow: auto;
 height:auto;
}

        .progress {
    height: .5rem !important;
}

        

        .background-card {
    padding: 18px;
    background: white;
    border-radius: 8px;
    box-shadow:0px 0px 5px #00000030;
    
}
</style>
    <style>
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style>
    <script>
        document.getElementById("London").click();
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent1");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks1");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
        }
    function loadPopup()
    {
          $.ajax({
                type: "GET",
                url: "CreateNote.aspx"
          }).done(function(data) {
                $('body').append($(data).popup());
                $('#popup1').popup('open');
          });
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
   




   <%-- <div id="pro_det" class="col-md-8" style="display: none;">
        <div class="col-md-12">
            <div class="card card-5 animated bounceIn">
                <div class="loaderColor">
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--dot"></div>
                    <div class="loaderColor--text"></div>
                </div>
                <div class="card-header">
                    PROJECT DETAILS
                </div>
                <!--alerts Start-->
                <section class="panel vh-60  scrollable">
                    <div class="panel-body">
                        <div class="row-col-md-12 over">
                            <div class="card-body table-responsive p-0">
                                <div id="loader"></div>
                                <table class="table-bordered align-centre col-md-12" id="tbl_Task_List" onclick="grT()">
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </section>
                <!--alerts end-->
            </div>
        </div>
    </div>--%>
<%--    <div>--%>

    <div class="table-responsive" id="dvData" style="overflow: auto; max-height: 500px; background-color:white;">
        <br />
                                <table class="table table-hover table-bordered " id="tbl_Task_List" onclick="report()" style="text-align: center; position: relative; width:100%">
                                </table>
                            </div>
      <%--  </div>--%>




</div>
  

<div id="theModal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
    <input id="hdUserId" type="hidden" runat="server" />
    <input id="hdBranchId" type="hidden" runat="server"/>
     <input id="hdFirmId" type="hidden" runat="server"/>
      
    <input id="hdnNotifyCount" type="hidden" runat="server"/>
    <input id="hdnAlertCount" type="hidden" runat="server"/>
    <input id="hdteamid" type="hidden" runat="server" />
</asp:Content>
