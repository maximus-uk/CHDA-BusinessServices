<%-- **************************************************
     Site   	: Team 
     Page   	: News
     Author 	: Jason Clark
     Date   	: March 2017

     Modified By: Jason Clark
     Date		: Sept 2018
     Notes		: Updated to new master page template and CHDA Branding.
    
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
        #custom-bootstrap-menu li:nth-child(3) a {color: #fff;}
        #custom-bootstrap-menu ul ul li:nth-child(3) a {color:#545487!important}
        #custom-bootstrap-menu ul ul li:nth-child(3){
            background-color: transparent!important;
            border-radius:0!important;
        }
    </style>

</asp:Content>

<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageContent" runat="server"> 
           
    <ul class="nav nav-pills newsTabs">
        <li class="active"><a onclick="clearDetails()" data-toggle="pill" href="#tab1">
        Current News</a></li>
        <li><a onclick="clearDetails()" data-toggle="pill" href="#tab2">
        Archive</a></li>
    </ul>

    <div class="tab-content newsMastContainer">
        <div id="tab1" class="tab-pane fade in active">
            <div id="newsMastCurrent"></div>             
        </div>
        <div id="tab2" class="tab-pane fade">
            <div id="newsMastArchive"></div>                                                    	                   
        </div>
    </div>
    <div class="newsDetailContainer">
        <div id="newsDetail"></div> 
    </div>

</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">
    
	<!-- SCRIPTS -->
 	<script type="text/javascript" src="/Style Library/maxuk/js/siteNews.js"></script>
	
    <script type="text/javascript">

        var siteName;
        var siteTitle;   	

        $(function () {

            $.ajax({
                url: siteURL + "/_api/web/title",
                method: "GET",
                headers: { "Accept": "application/json; odata=verbose" },
                success: function (data) {
                    siteTitle = data.d.Title;
                    siteName = siteURL.split('co.uk/teams/')[1];

                    var teamName = siteName.toUpperCase();

                    getNewsItems(teamName);
                },
                error: function (data) {
                    console.log("Error: " + data);
                }
            });
        });

        if (typeof (MSOLayout_MakeInvisibleIfEmpty) == "function") {
            MSOLayout_MakeInvisibleIfEmpty();
        }

    </script>

</asp:Content>