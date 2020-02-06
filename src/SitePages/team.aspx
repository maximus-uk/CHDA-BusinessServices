<%-- **************************************************
     Site   	: Team
     Page   	: Team
     Author 	: Jason Clark
     Date   	: Mar 2017
     Purpose	: 

     Modified By: Jason Clark
     Date		: Sept 2018
     Notes		: Updated to new master page template and CHDA Branding.

	 Modified By: Jason Clark
     Date		: Mar 2019
	 Notes		: Updated page to work on SPO and Bootstrap 4
	 
     Modified By:
     Date		:
     Notes		:
     ************************************************** --%>

<%-- _lcid="1033" _version="15.0.4420" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="~masterurl/custom.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderAdditionalPageHead">
    	
    <!-- STYLES -->
    <style type="text/css">
        #custom-bootstrap-menu li:nth-child(3){
            background-color: #545487 !important;
            color:white!important;
            border-radius: 10px !important;
        }
        /*#custom-bootstrap-menu li:nth-child(3) .menu-item-text {color:white};*/
        #custom-bootstrap-menu li:nth-child(3) span {color: #fff!important;}
        #custom-bootstrap-menu li:nth-child(3) ul li span {color: var(--PrimaryDark)!important;}
        #custom-bootstrap-menu li:nth-child(3) ul li span:hover, #custom-bootstrap-menu li:nth-child(3) ul li a:hover {color: white!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3) a:hover, #custom-bootstrap-menu ul ul li:nth-child(3) span:hover {color: #fff!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3) span {color: var(--PrimaryDark)!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3){
            background-color: transparent!important;
            border-radius:0!important;
        }
        .pageLeftContainer{overflow-y:hidden}
        
        .card-body{padding:.5rem 0 0 .8rem}
        h5{font-size:1rem}

		.contactContainer {						
			width:100%;
            top: 0;
		}
        .contactCard {
            perspective: 1000px; 
            background-color:white!important;
            width:160px;
        }
        .contactCard div {margin: 0!important}
        .contactCard img{height:auto}
        .contactCard-Inner{
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }
        .contactCard:hover .contactCard-Inner {
            transform: rotateY(180deg);
        }
        .contactCard-Front, .contactCard-Back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
        }
        .contactCard-Front {
            color: black;
        }
        .contactCard-Back {
            background-color: #ddddeb;
            color: white;
            transform: rotateY(180deg);
            word-wrap:break-word;
            white-space:normal;
        }
        .contactCard .userName {font-weight:bolder;font-size:.9em!important;padding:0 5px}			
        .contactCard-Back .jobTitle, .contactCard-Back h4, .contactCard-Back h5, .contactCard-Back .userName, .contactCard-Back .groupName {font-size:.8em; color:#545487!important;margin-bottom:5px;}
        /*.contactCard-Back p {font-size:.8em!important; color:#545487!important}*/

    </style>

</asp:Content>

<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageContent" runat="server"> 
	<h2>Welcome to your team</h2>
    <p>Mouse over the team member name to view more details.</p>
    <div class="row">
        <div class="contactContainer">
            <div class="contactCardRow">
                <div id="ContactCard"></div>
            </div>
        </div>        
    </div>                      
</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">

    <script type="text/javascript">       
    	
        var siteName;
        var siteTitle;                 

        $(function () {  
            getTeam();                       
        });

        function getTeam() {

            var method = "";
            var list = "Contacts";
            var siteRole = [];
            var groupColour = ['#4f7b39', '#c95828', '#205794', '#8a742e', '#5f295f', '#7676b8', '#9cc487', '#f9ad86', '#6e96cf', '#ddcc68', '#cfaccc', '#dbdcf4', '#d9eccd', '#fae8d6', '#e5eaf6', '#f2e5b6', '#f2ddec'];

            method = "GetList";
            var ID = 0;

            $().SPServices({
                async: false,
                operation: method,
                listName: list,
                completefunc: function (xData, Status) {

                    $(xData.responseXML).find("Field[DisplayName='Site Role'] CHOICE").each(function () {
                        console.log($(this).text());
                        siteRole[ID] = $(this).text();
                        ID++;
                    });
                }
            });

            //console.log(siteRole);

            method = "GetListItems";          
            var fields = "<ViewFields>" +
                "<FieldRef Name='SiteRole' />" +
                "<FieldRef Name='Title' />" +
                "<FieldRef Name='Name' />" +
                "<FieldRef Name='SortOrder' />" +
                "<FieldRef Name='Picture' />" +
                "<FieldRef Name='JobTitle' />" +
                "<FieldRef Name='MobilePhone' />" +
                "<FieldRef Name='WorkPhone' />" +
                "<FieldRef Name='WorkEmail' />" +
                "<FieldRef Name='Department' />" +
                "<FieldRef Name='Office' />" +
                "</ViewFields > ";
            var query = "<Query><OrderBy><FieldRef Name='SiteRole' Ascending='True'/><FieldRef Name='SortOrder' Ascending='True'/></OrderBy></Query>";

            //+ "<Where>" + "<Or>" + "<Or>" + "<Eq>" + "<FieldRef Name='Title'/><Value Type='Text'>The America</Value>" + "</Eq>" + "<Eq>" + "<FieldRef Name='Dream_x0020_Destination' /><Value Type='Text'>USA</Value>" + "</Eq>" + "</Or>" + "<IsNotNull>" + "<FieldRef Name='PPP'/>" + "</IsNotNull>" + "</Or>" + "</Where>" + "<OrderBy>" + "<FieldRef Name='PPP' Ascending='False'/>" + "</OrderBy>" + "</Query>";

            //for (var x = 0; x < qualityGroup.length; x++) {
                //$("#ContactCard").append('<div id="group' + x + '" style="background-color:' + qualityColour[x] + ';width:fit-content"></div>');
            //}
            
            $().SPServices({
                operation: method,
                async: false,
                listName: list,
                CAMLViewFields: fields,
                CAMLQuery: query,

                completefunc: function (xData, Status) {
                    $(xData.responseXML).SPFilterNode("z:row").each(function () {
                        var role = $(this).attr("ows_SiteRole");
                        //var firstName = $(this).attr("ows_Title");
                        var username = $(this).attr("ows_Name").split(';#')[1];
                        var jobTitle = $(this).attr("ows_JobTitle").split(";#")[1];
                        
                        var userImage = $(this).attr("ows_Picture");
                        var workphone = $(this).attr("ows_WorkPhone").split(";#")[1];
                        var mobilephone = $(this).attr("ows_MobilePhone");
                        var email = $(this).attr("ows_WorkEmail").split(';#')[1];
                        var office = $(this).attr("ows_Office").split(';#')[1];

                        tenantURL = siteURL.split('/')[2];
                        unitURL = siteURL.split('/'[4]);
                        if(userImage===undefined){userImage=unitURL+"/publishingimages/person-placeholder.png"}
                        if(userImage!==undefined){userImage=userImage.split(',')[0];}
                        console.log(userImage);

                        //var ID = Math.round(($(this).attr("ows_ID"), 0));
                        for (var x = 0; x < siteRole.length; x++) {
                            if (role === siteRole[x]) {
                               /* var contactCardString = '<div class="contactCard card" style="border-top:4px solid ' + groupColour[x] + '">' +
                                        '<img class="card-img-top" alt="User Photo" src="' + userImage + '"/>' +
                                        '<div class="card-body">' +                                    
                                            '<h2 class="card-title">' + username + '</h2>' +
                                            '<h4>' + jobTitle + '</h4>' +
                                            '<h4 class="groupName">' + role + '</h4>' +
                                            '<a href="mailto:' + email + '?subject=Contact from Intranet&body=Hi ' + username + '"><i class="fa fa-envelope"></i></a>' +
                                            '<div class="row">' +
                                                '<div class="col-2"><h5><i class="fa fa-phone"></i></h5></div>' +
                                                '<div class="col-8" style="left:-15px;width:78%"><h5>' + workphone + '</h5></div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>';*/
                                var contactCardString = '<div class="contactCard" style="border-top:4px solid ' + groupColour[x] + '">' +
                                    '<div class="contactCard-Inner">' +
                                    '<div class="contactCard-Front">' +
                                    '<img alt="User Photo" src="' + userImage + '" />' +
                                    '<h3 class="userName">' + username + '</h3>' +
                                    '</div>' +
                                    '<div class="contactCard-Back">' +
                                    '<h3 class="userName"><b>' + username + '</b></h3>' +
                                    '<h4>' + jobTitle + '</h4>' +
                                    '<h5 class="groupName">' + role + '</h5>' +
                                    '<h5>'+office+'</h5>'+
                                    '<a href="mailto:' + email + '?subject=Contact from Intranet&body=Hi ' + username + '"><i class="fa fa-envelope"></i></a>' +
                                    '<div class="row">' +
                                    '<div class="col-2"><h5><i class="fa fa-phone"></i></h5></div>' +
                                    '<div class="col-8" style="position:absolute;left:20px;width:78%"><h5>' + workphone + '</h5></div>' +
                                    '</div>' +
                                    //'<div class="row">' +
                                    //    '<h6>' + Description + '</h6>' +
                                    //'</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>';

                                //$("#group" + x).append(contactCardString);
                                $('#ContactCard').append(contactCardString);
                            }
                        }
                    });
                }
            });
        }

        
	</script>

</asp:Content>
