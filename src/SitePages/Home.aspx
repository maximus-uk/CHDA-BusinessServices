<%-- **************************************************
     Site   	: Team
     Page   	: Front Door
     Author 	: Jason Clark
     Date   	: March 2017

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
<%@ Page language="C#" MasterPageFile="/sites/CHDA/_catalogs/masterpage/chda/chda.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderAdditionalPageHead">

    <!-- STYLES -->
    <style type="text/css">
        ::-webkit-scrollbar-track{background-color:#ddddeb}
        /*.appContentFrame{border:1px solid red; width:100%;height:100%;}*/
        #custom-bootstrap-menu li:nth-child(3){
            background-color: #545487 !important;
            color:white!important;
            border-radius: 10px !important;
        }
        /*#custom-bootstrap-menu li:nth-child(3) .menu-item-text {color:white};*/
        #custom-bootstrap-menu li:nth-child(3) span {color: #fff!important;}
        #custom-bootstrap-menu li:nth-child(3) ul li span {color: var(--PrimaryDark)!important;}
        #custom-bootstrap-menu li:nth-child(3) ul li span:hover, #custom-bootstrap-menu li:nth-child(3) ul li a:hover {color: white!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3) a:hover span {color: white!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3) span:hover span{color: white!important;}
        #custom-bootstrap-menu ul ul li span:hover span{color: white!important;}
        #custom-bootstrap-menu ul ul li a:hover span{color: white!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3) span {color: var(--PrimaryDark)!important;}
        #custom-bootstrap-menu ul ul li:nth-child(3){
            background-color: transparent!important;
            border-radius:0!important;
        }

        .teamHomeLeftColumn{height:80vh}
        .teamHomeRightColumn{position:relative;height:80vh;border-left:1px solid #ddddeb;overflow:hidden}
        .teamHomeTopRow{position:absolute;height:28vh;width:100%;max-width:57vw;flex:0 0 50%;}
        .teamHomeBottomRow{position:relative;top:19vh;max-width:60vw;flex:0 0 50%;height:60vh;margin-top:10px;overflow:hidden} 
        .faqTitle,.contactsTitle{position:absolute;}
        #contactsLink,#faqsLink,#changeLink{height:24px;width:99%;border-bottom:2px solid #ddddeb;}
        .faqTabContainer{position:absolute;top:30px;left:1px;height:47px;overflow-x:auto;overflow-y:hidden;width:99%;}
        .faqTab{width:auto;flex-wrap:nowrap!important}
        .faqContent{top:82px;left:0;width:99%!important;height:93%;overflow-y:scroll;overflow-x:hidden} 
        .faqQuestions{position:absolute;left:10px;flex:0 0 19%;max-width:19%;width:19%;height:85%;overflow-y:scroll;overflow-x:hidden} 
        .faqAnswers{position:absolute;left:20.5%;top:10px;flex:0 0 76%;max-width:76%;overflow-y:scroll;overflow-x:hidden}
        .faqAnswersAccordion {width:98%;}
        .changeTabs{position:relative;top:7px;padding-bottom:10px;overflow-y:hidden;overflow-x:scroll;}
        .changeContent{overflow-y:scroll;overflow-x:hidden;height:91%;margin:13px 2px 0 0;}
        .table-responsive{width: 99% !important;}
        .nav-tabs{border-bottom:none;}
        .faqContent .card, .changeContent .card{height:46px;}

        @media screen and (min-width: 1919px) and (max-width: 1921px) {
            .pageLeftContainer{height:86vh;overflow:hidden}
            .contactContainer{top:4vh!important;}
            .teamHomeBottomRow{top:30vh;height:37vh;flex: 0 0 30%;}
            .faqContent{height:65%;width:98%;}
            .teamHomeRightColumn{height:67vh;}
            .changeContent{height:82%;}
        }

        @media screen and (min-width: 1700px) and (max-width: 1799px) {
            .pageLeftContainer{height:86vh;overflow:hidden}
            .contactContainer{top:4vh!important;}
            .teamHomeBottomRow{top:30vh;height:37vh;flex: 0 0 30%;}
            .faqContent{height:65%;width:98%;}
            .teamHomeRightColumn{height:67vh;}
            .changeContent{height:82%;}
        }

        @media screen and (min-width: 2500px) and (max-width: 2599px) {
            /*.topRow{top:199px;height:28vh;}*/
            .bottomRow{height:52.7vh;} 
            .faqQuestions{flex:0 0 19%;max-width:19%;width:19%;height:85%;} 
            .faqAnswers{top:10px;flex:0 0 75%;max-width:75%;height:85%;}            
        }

		.contactContainer {						
			position:absolute;
            width:100%;
            top: 2vh;
            left:0;
		}
        .contactCardRow{flex-wrap:nowrap;}
        .contactsTitle{margin-bottom:10px;}
        .contactCard {
            perspective: 1000px; 
            background-color:white!important;
            width:160px;
        }
        .contactCard div {margin: 0!important}
        .contactCard img{height:auto; min-height:145px}
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
        .contactCard .userName {font-weight:bolder;font-size:.9em!important;}			
        .contactCard-Back .jobTitle, .contactCard-Back h4, .contactCard-Back h5, .contactCard-Back .userName, .contactCard-Back .groupName {font-size:.8em!important; color:#545487!important;margin:5px;}
        .contactCard-Back .cardIcons {position:absolute;bottom:0;font-size:1.3rem;border-top:1px solid #545487; width:100%}
        /*.contactCard-Back p {font-size:.8em!important; color:#545487!important}*/

    </style> 

</asp:Content>

<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageContent" runat="server"> 
    
    <div class="row">
        <div class="col-5 teamHomeLeftColumn">
            <div class="row teamHomeTopRow">
                <div id="contactsLink"></div>
                <div style="width:100%">
                    <div class="contactContainer">
                        <div class="contactCardRow">
                            <div id="ContactCard"></div>
                        </div>
                    </div>        
                </div>                  
            </div>

            <div class="row teamHomeBottomRow">
                <div id="faqsLink"></div>

                <!-- FAQ Category Tabs -->
                <div class="container-fluid">
                    <nav class="faqTabContainer">
                        <div class="faqTab nav nav-tabs" id="tabNames" role="tabList"></div>
                    </nav>
                </div>

                <!-- FAQ Q&A pane -->
                <div class="tab-content faqContent" id="tabData"></div>  
            </div>
        </div>

        <div class="col teamHomeRightColumn">
            <div id="changeLink"></div>
            <nav>
                <div class="changeTabs nav nav-tabs" id="changeTabs" role="tabList"></div>
            </nav>
            <div class="tab-content changeContent" id="changeContent"></div>     
        </div>
    </div>

</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">

	<!-- SCRIPTS -->
    <!--
    <script type="text/javascript" src="/Style%20Library/maxuk/js/siteTeamLinks.js"></script>
    <script type="text/javascript" src="/Style%20Library/maxuk/js/siteContacts.js"></script>
    <script type="text/javascript" src="/Style Library/MAXUK/JS/siteMessages.js"></script>
    -->
    <script type="text/javascript" src="/Style Library/maxuk/js/siteTeam.js"></script>
    <script type="text/javascript" src="/Style Library/maxuk/js/siteFAQs.js"></script>
    <script type="text/javascript" src="/Style Library/maxuk/js/dpChangeAlerts.js"></script>
    
    <script type="text/javascript">

        var siteTitle;                               

        $(function () {  
            var isAdmin = false;

            //contentCode=$("#thisContent").html();	
            getTeam(siteURL);                       
            getFAQTabs(siteURL);
            getFAQItems(siteURL);
            getChangeTabs(siteURL);
            getChangeAlerts(siteURL);

			$.ajax({
				url: siteURL + "/_api/web/title",
				method: "GET",
				headers: { "Accept": "application/json; odata=verbose" },
				success: function (data) {						
                    siteTitle = data.d.Title;
                    //$('#siteWelcomeText').append('<h2>Welcome to the ' + siteTitle + ' home page</h2>');                    
                    getWelcomeText(siteTitle);
                    //getTeamLinkData(siteURL,siteTitle);

                    isAdmin = checkAdmin(siteTitle);
                    if(isAdmin){
                        $('#contactsLink').append('<h1 class="contactsTitle"><a href="'+siteURL+'/Lists/Contacts/AllItems.aspx"  target="_blank">Team Contacts</a></h1>');
                        $('#changeLink').append('<h1 class="changeTitle"><a href="'+siteURL+'/Lists/Change_Alerts/Current.aspx"  target="_blank">Information</a></h1>');
                        $('#faqsLink').append('<h1 class="faqsTitle"><a href="'+siteURL+'/Lists/FAQs/AllItems.aspx"  target="_blank">FAQs</a></h1>');
                    }else {
                        $('#contactsLink').append('<h1 class="contactsTitle">Team Contacts</h1>');
                        $('#changeLink').append('<h1 class="changeTitle>Information</h1>');
                        $('#faqsLink').append('<h1 class="faqsTitle">FAQs</h1>');
                    }
				},
				error: function (data) {
					console.log("Error: "+ data);
				}
            });  
        });

        function checkAdmin(team){
            var hasEdit=false;

            $().SPServices({
                operation: "GetGroupCollectionFromUser",
                userLoginName: $().SPServices.SPGetCurrentUser(),
                async: false,
                completefunc: function (xData, Status) {
                    console.log(team);
                    //If the current User does belong to the group "SharePoint Group Name"
                    if ($(xData.responseXML).find("Group[Name='" + team + " Power Users']").length === 1) {
                        hasEdit = true;
                    } else {
                        hasEdit = false;
                    }
                }
            });
            return hasEdit;
        }

    </script>
</asp:Content>