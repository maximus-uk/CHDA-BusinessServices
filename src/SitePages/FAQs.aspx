<%-- **************************************************
     Site   	: Team
     Page   	: FAQs
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
    </style>

</asp:Content>

<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageContent" runat="server"> 
    <div id="siteWelcomeText"></div>

    <!-- ***** FAQs Section ***** -->                  					
	<div class="faqContainer">                    
		<div class="col-3 faqTabs">                     		    
			<ul class="nav nav-pills flex-column" id="tabNames" role="tablist"></ul>
		</div>

		<div class="faqContent">		                
			<div class="tab-content" id="tabData"></div>                             		               
		</div>					
    </div>

</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">
    
	<!-- SCRIPTS -->
    <script type="text/javascript" src="/Style Library/maxuk/js/siteFAQs.js"></script>

    <script type="text/javascript">

        var categories = [];
        var tabNum = [];
					
        $(function () {
            getTabs(siteURL);
            getItems(siteURL);

			$.ajax({
				url: siteURL + "/_api/web/title",
				method: "GET",
				headers: { "Accept": "application/json; odata=verbose" },
				success: function (data) {						
                    var siteTitle = data.d.Title;
            
                    $('#siteWelcomeText').append('<h2>Welcome to the ' + siteTitle + ' FAQs page</h2>');	
				},
				error: function (data) {
					console.log("Error: "+ data);
				}
            });
        });

    </script>
    
</asp:Content>