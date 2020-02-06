<%-- **************************************************
     Site       : Team
     Page       : Knowledge
     Author     : Jason Clark
     Date       : March 2017

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
<%@ Register TagPrefix="WpNs0" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="/sites/CHDA/_catalogs/masterpage/chda/chda.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderAdditionalPageHead">

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
        /*.ms-core-listMenu-horizontalBox li.static > .ms-core-listMenu-item{color:white}*/
    </style>

</asp:Content>
   
<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageContent" runat="server"> 
    <div id="siteWelcomeText"></div>
    <p> 
        It is a one-stop-place where you can access all the relevant documentation you'll need to do your job. 		    
    </p>
       
    <!-- ***** Left Container - Navigation Tabs ***** -->
    <div id="knDocs">
        <div class="w-100 p-1">   
            <div class="scroller scroller-left mt-2"><i class="fa fa-chevron-left"></i></div>
            <div class="scroller scroller-right mt-2"><i class="fa fa-chevron-right"></i></div>
            <div class="knowledgeTabContainer"> 
                <!--<div class="row">
                    <div class="col-3 knowledgeMainTabs text-center"><h2 class="text-white">Shared Libraries</h2></div>
                    <div class="col knowledgeCustomTabs text-center"><h2 class="text-white">Custom Libraries</h2></div>
                </div>-->               
                <nav class="nav nav-pills list mt-2" role="tablist" id="knowledgeTabNames">            
                    <a class="nav-item nav-link active" data-toggle="pill" role="pill" href="#knTab1">Policies</a>
                    <a class="nav-item nav-link" data-toggle="pill" role="pill" href="#knTab2">Procedures</a>
                    <a class="nav-item nav-link" data-toggle="pill" role="pill" href="#knTab3">Guides</a>
                    <a class="nav-item nav-link" data-toggle="pill" role="pill" href="#knTab4">Forms</a>
                    <a class="nav-item nav-link" data-toggle="pill" role="pill" href="#knTab5">General</a>
                    <a class='nav-item nav-link' data-toggle='pill' role="pill" href='#knTab6' id='mgmtDocs'>Management</a>            
                </nav>
            </div>
        </div>

        <div class="tab-content documentSection" id="knowledgeTabContent">
            <div id="knTab1" class="tab-pane fade active">																						
                <div id="knLibrary1"></div>													            					            				                                    	
            </div>
                    
            <div id="knTab2" class="tab-pane fade">
                <div id="knLibrary2"></div>													            					            				                                    	
            </div>

            <div id="knTab3" class="tab-pane fade">
                <div id="knLibrary3"></div>													            					            				                                    	
            </div>
                    
            <div id="knTab4" class="tab-pane fade">
                <div id="knLibrary4"></div>													            					            				                                    	
            </div>
                    
            <div id="knTab5" class="tab-pane fade">
                <div id="knLibrary5"></div>													            					            				                                    	
            </div> 

            <div id="knTab6" class="tab-pane fade">
                <div id="knLibrary6"></div>													            					            				                                    	
            </div>             
        </div>  
                
        <div class="documentViewer">
            <iframe id="docViewer" src=""></iframe>
        </div>                            
    </div>
</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">
				
	<!-- SCRIPTS -->
    <script type="text/javascript" src="/Style Library/maxuk/js/siteEmail.js"></script>
	<script type="text/javascript" src="/Style Library/maxuk/js/siteKnowledge.js"></script>

    <script type="text/javascript">

        var siteName;
        var siteTitle;
        var hidWidth;
        var scrollBarWidths = 40;
        var siteEmail;                 
        var reAdjust = function () {
            if (($('.knowledgeTabContainer').outerWidth()) < widthOfList()) {
                $('.scroller-right').show().css('display', 'flex');
            }
            else {
                $('.scroller-right').hide();
            }

            if (getLeftPosi() < 0) {
                $('.scroller-left').show().css('display', 'flex');
            }
            else {
                $('.item').animate({ left: "-=" + getLeftPosi() + "px" }, 'slow');
                $('.scroller-left').hide();
            }
        }

        $(function () {  
            var scriptbase = "https://"+siteURL.split('/')[2]+"/"+siteURL.split('/')[3]+"/"+siteURL.split('/')[4]+"/_layouts/15/";
            var buName = siteURL.split('/')[4]; 

            $.getScript(scriptbase + "SP.js", function(){
                $.getScript(scriptbase + "SP.Taxonomy.js", getDocTabs(buName));
            });

			$.ajax({
				url: siteURL + "/_api/web/title",
				method: "GET",
				headers: { "Accept": "application/json; odata=verbose" },
				success: function (data) {						
                    siteTitle = data.d.Title;
					siteName = siteURL.split('co.uk/teams/')[1];

                    //siteEmail = getSiteEmail();                    
                                                         
					$('#siteWelcomeText').append('<h2>Welcome to the ' + siteTitle + ' Knowledge Library</h2>');	
					//$('#email').append('Please email <a href="mailto:'+ siteEmail +'"><i class="fa fa-envelope"></i> ' + siteTitle +'</a> if you have any queries.');
													
            		getKnowledgeDocs(siteTitle);
				},
				error: function (data) {
					console.log("Error: "+ data);
				}
            });                       
        });
        
        $(window).on("load",function (){        	        	
            reAdjust();        	        	
		});    

        $(window).on('resize', function (e) {
            reAdjust();
        });

    </script>

</asp:Content>