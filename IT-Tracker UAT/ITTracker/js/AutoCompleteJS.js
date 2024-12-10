﻿function autocomplete(inp, arr, hiddenVariable, ShowValVariable) {

    //$("[id*=work_id]").val("");
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    //inp.addEventListener("input", function (e)
    if (arr.length > 0) {
        var a, b, i, val;
        val = document.getElementById('' + inp + '').value
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) { return false; }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", inp + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        /*append the DIV element as a child of the autocomplete container:*/
        document.getElementById('' + inp + '').parentNode.appendChild(a);
        /*for each item in the array...*/

        for (i = 0; i < arr.length; i++) {
            /*check if the item starts with the same letters as the text field value:*/
            //if (arr[i].split("ʒ")[1].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
            /*create a DIV element for each matching element:*/
            b = document.createElement("DIV");
            b.setAttribute("class", "task-style");
            /*make the matching letters bold:*/
            //b.innerHTML = "<strong>" + arr[i].split("ʒ")[1].substr(0, val.length) + "</strong>";
            //b.innerHTML += arr[i].split("ʒ")[1].substr(val.length);
            b.innerHTML = arr[i].split("ʒ")[0];
            /*insert a input field that will hold the current array item's value:*/
            b.innerHTML += "<input type='hidden' value='" + arr[i].split("ʒ")[1] + "'>";
            //b.innerHTML += "<input type='hidden' value='" + arr[i].split("ʒ")[1] + "'>";

            // alert(arr[i].split("ʒ")[0]);
            // alert(arr[i].split("ʒ")[1]);
            /*execute a function when someone clicks on the item value (DIV element):*/
            b.addEventListener("click", function (e) {
                /*insert the value for the autocomplete text field:*/



                document.getElementById('' + inp + '').value = this.getElementsByTagName("input")[0].value;
                //alert(this.getElementsByTagName("input")[0].value);
                //$("[id*=work_id]").val((this.getElementsByTagName("input")[1].value + '~' + this.getElementsByTagName("input")[0].value));
                //document.getElementById('' + hiddenVariable + '').value = this.getElementsByTagName("input")[1].value;
                $("[id*=" + hiddenVariable + "]").val(this.getElementsByTagName("input")[0].value);
                document.getElementById('' + ShowValVariable + '').innerHTML = this.getElementsByTagName("input")[1].value;
                //$("[id*=work_id]").val(this.getElementsByTagName("input")[1].value);
                /*close the list of autocompleted values,
                (or any other open lists of autocompleted values:*/
                closeAllLists();
            });
            a.appendChild(b);
            //}
        }
    } else {
        closeAllLists();
        $("[id*=" + hiddenVariable + "]").val("");
        $("[id*=work_id]").val("");
    }
    /*execute a function presses a key on the keyboard:*/
    document.getElementById('' + inp + '').addEventListener("keydown", function (e) {

        var x = document.getElementById(inp + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //upautocomplete-items
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        } else if (e.keyCode == 8 || e.keyCode == 46) {
            document.getElementById('' + hiddenVariable + '').value = "";
        }
    });
    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {

        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
    $("[id*=" + hiddenVariable + "]").val("");
}

//var countries = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua &amp; Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia &amp; Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central Arfrican Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica", "Cote D Ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauro", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre &amp; Miquelon", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "St Kitts &amp; Nevis", "St Lucia", "St Vincent", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad &amp; Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks &amp; Caicos", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"];    
function LoadDataAutoComplete(ControlID, SearchKey, SrchStringLen, hiddenVariable, QueryFlag, QueryID, ShowValue) {
    var ArrayList = [];
    if (SearchKey.length >= SrchStringLen) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "autoServiceForEmp.asmx/GetSearchingData",
            data: "{SearchKey:'" + SearchKey + "',QueryFlag:'" + QueryFlag + "',QueryID:'" + QueryID + "'}",
            dataType: "json",
            success: function (Result) {
                ArrayList = Result.d;
                autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
            },
            error: function (Result) {
                alert(Result.d);
            }
        });
    } else if (SearchKey.length == 0) {
        ArrayList = [];
        autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
    }

}

function LoadingDataAutoComplete(ControlID, SearchKey, SrchStringLen, hiddenVariable, QueryFlag, QueryID, ShowValue) {
    var ArrayList = [];
    ShowValue = $("[id*=Hddepart]").val();

    if (SearchKey.length >= SrchStringLen) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "autoServiceForEmp.asmx/GetSearchingData",
            data: "{SearchKey:'" + SearchKey + "',QueryFlag:'" + QueryFlag + "',QueryID:'" + QueryID + "'}",
            dataType: "json",
            async:false,
            success: function (Result) {
                
                ArrayList = Result.d;
                autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
            },
            error: function (Result) {
                alert(Result.d);
            }
        });
    } else if (SearchKey.length == 0) {
        ArrayList = [];
        autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
    }

}

function LoadDataAutoCompleteFill2(ControlID, SearchKey, SrchStringLen, hiddenVariable, QueryFlag, QueryID, ShowValue) {

    var ArrayList = [];
    if (SearchKey.length >= SrchStringLen) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "autoServiceForEmp.asmx/GetSearchingData",
            data: "{SearchKey:'" + SearchKey + "',QueryFlag:'" + QueryFlag + "',QueryID:'" + QueryID + "'}",
            dataType: "json",
            success: function (Result) {
                ArrayList = Result.d;
                document.getElementById('' + ControlID + '').value = ArrayList[0].split("ʒ")[0];
                //document.getElementById('' + hiddenVariable + '').value = this.getElementsByTagName("input")[1].value;
                $("[id*=" + hiddenVariable + "]").val(ArrayList[0].split("ʒ")[0]);
                document.getElementById('' + ShowValue + '').innerHTML = ArrayList[0].split("ʒ")[1];

                //autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
            },
            error: function (Result) {
                alert(Result.d);
            }
        });
    } else if (SearchKey.length == 0) {
        ArrayList = [];
        autocomplete(ControlID, ArrayList, hiddenVariable, ShowValue);
    }

}