<%-- **************************************************
     Site   	: Team
     Page   	: Admin
     Author 	: Jason Clark
     Date   	: Mar 2017
     Purpose	: page for the HR site owners / powers users backdoor to edit items.

     Modified By: Jason Clark
     Date		: Nov 2017
     Notes		: Added tab navigation for Front Door / Team Only / Forum sections.
                  created the power user forum code, linked to the discussion list in the admin site.
                  Revised the client context code and removed the DOM JS load function.  

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

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server" >

	<!-- STYLES -->
	<style type="text/css">
		/*.ms-cui-tabBody{display:none!important}*/
		.postMastContainer{padding-left:6px!important}		
	</style>

</asp:Content>

<%-- ***** For content to be added to the left container ***** --%>
<asp:Content ID="HTMLContent" runat="server" ContentPlaceHolderID="PlaceHolderPageContent">

	<div id="admin">
		<ul class="nav nav-pills" id="tabs">
			<li class="nav-item"><a class="nav-link active" data-toggle="pill" href="#tab1">Front 
			Door</a></li>
			<li class="nav-item" id="teamOnly"><a class="nav-link" data-toggle="pill" href="#tab2">Team Only</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="pill" href="#tab3">Forum</a></li>
		</ul>
		
		<div class="tab-content">
			<div id="tab1" class="tab-pane fade active">                            
				<div class="col-sm-4 col-md-4 col-lg-4 text-justify adminLists">                  
					<h1><u>Lists</u></h1>
					<h2>Metro Tiles</h2>                   			                
					<p>
					These are the 9 tiles on the Front Door pages. <br/> 
					Tiles 1 to 5 are compulsory, 6 to 9 can be customised.<br/>
					<span id="metroTiles_FD"></span>					 					                          
					</p>
											
					<h2>Useful Links</h2>		            	
					<p>
					<i>Nb: The useful links on the front door pages are 
					controlled by the Communications team.</i><br />
					<span id="usefulLinks"></span>   			                        	
					</p>
					
					<h2>Welcome Text</h2>
					<p>This is the main text on the Team Front Door page</p>
					<span id="welcomeText"></span>
					
					<h2>News</h2>
					<p>Add or Edit the articles displayed in the Team News 
					page.</p>
					<span id="news"></span>
	
					<h2>FAQs</h2>
					<p>This is the list of FAQs displayed on that page.</p>
					<span id="faqs1"></span>
					
					<p>The FAQ list has the following fields;</p>
					<ol>
						<li><span id="faqs2"></span>: used for the tabs at 
						the top of the page.</li>
						<li><b>Question</b>: single line of text</li>
						<li><b>Answer</b>: Rich Text field - can contain 
						images, links, text formatting</li>
					</ol>
					
				</div>
	
				<div class="col-sm-4 col-md-4 col-lg-4 text-justify">
					<h1><u>Knowledge Library</u></h1>			                
					<p>Nb: The documents uploaded to these libraries are for 
					all to see. Do not upload documents which are for team 
					only use here.</p>
					
					<h2>Knowledge Management</h2>
					<p>The team related documents for the Knowledge Document 
					Library, which are for Managers eyes only.</p>
					<span id="knMgmt"></span>

					<h3>Permission</h3>			                
					<p><b>Note</b>: All users requiring Manager access to 
					this document library <u>MUST</u> be added to this 
					group. No user is to be added with direct permissions. 
					This is keep the management of the site permissions 
					clean and easy.
					</p>
					<a id="groupManager" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span>
					Managers</a>
					<br/>
											
					<h2>Knowledge General Documents</h2>
					<p>The team related documents for the Knowledge Document 
					Library, which are all other documents that are not 
					Guides, Policies, Procedures or Forms.</p>
					<span id="knGeneral"></span>
	
					<h2>Knowledge Guides</h2>			                
					<p>The documents used for the Knowledge Procedures 
					Library</p>
					<span id="knGuides"></span>
					
					<h2>Knowledge Policies</h2>			                
					<p>The documents used for the Knowledge Policies Library</p>
					<span id="knPolicy"></span>
	
					<h2>Knowledge Procedures</h2>			                
					<p>The documents used for the Knowledge Procedures 
					Library</p>
					<span id="knProcs"></span>
	
					<h2>Knowledge Forms</h2>			                
					<p>The documents used for the Knowledge Form Library</p>
					<span id="knForms"></span>		                
				</div>
			 
				<div class="col-sm-3 col-md-3 col-lg-3 text-justify">
					<div class="row">
						<h2>Site Contacts</h2>
						<p>To display the Site Owners and Power Users in the 
						accordion menu, shown on the Team Front Door and 
						Team Site home pages</p>
						<span id="contacts"></span>							                           
					</div> 
				</div>
			</div>
			
			<div id="tab2" class="tab-pane fade in">                            
				<div class="col-sm-4 col-md-4 col-lg-4 text-justify">                  
					<h1><u>Lists</u></h1>
					<h2>Metro Tiles</h2>                   			                						
					<p>
					These are the 9 tiles on the Team site (restricted) 
					pages. <br/>
					Tiles 1 to 4 are compulsory, 5 is optional, 6 to 9 can 
					be customised. (starting top left - reading left to 
					right)<br/>    
					<span id="metroTiles"></span> 
					</p>
					
					<h2>Useful Links</h2>		            	
					<p>The links on the Team Site (restricted) pages use 
					this team site useful links list - which are 
					customisable to be specific for this team <br/><br/>						
					   <span id="teamLinks"></span>   			                        	
					   </p>
					   
					   <h2>Discussion List (Forum)</h2>
					   <p>All the posts made in the forum are accessible 
					through this list, where they can be moderated. <br/><br/>
					   <span id="teamForum"></span>
					   </p>
					   <h3>Permission</h3>			                
					<p><b>Note</b>: All users that are to be Moderators of 
					the Forum <u>MUST</u> be added to this group. No user is 
					to be added with direct permissions. This is keep the 
					management of the site permissions clean and easy.
					</p>
					<a id="groupModerator" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span>
					Moderators</a>
					<br/>
				</div>
				
				<div class="col-sm-4 col-md-4 col-lg-4 text-justify">
					<h1><u>Libraries</u></h1>			    
					
					<h2>Documents</h2>
					<p>This holds all documents related specifically to this 
					team and not for general staff usage.<br/><br/>
					<span id="teamDocs"></span>
					</p>
					
					<h2>Forms</h2>
					<p>This holds all forms related specifically to this 
					team and not for general staff usage.<br/><br/>
					<span id="teamForms"></span>
					</p>
					
					<p style="font-weight:bold;color:red">Nb: Please 
					remember you can only have 9 Categories for the above 
					libraries. <br/>
						This is due to the screen size limitation of some 
					older smaller monitors still being used.	
					</p>		                 
				</div>
									
				<div class="col-sm-3 col-md-3 col-lg-3 text-justify">
					<div class="row">
						<h1><u>Permissions</u></h1>			                
						<p>Permission groups used for this team site fall 
						into the following groups;</p>
						<p>The site Owners and Power User groups are controlled by the SharePoint Admins / Intranet Owners</p>
						<p><b>Note</b>: All users added to this site MUST be 
						added to a group. No user is to be added with direct 
						permissions. This is keep the management of the site 
						permissions clean and easy.<br/><br/>
						Nb: Please remember to add both the users Active 
						Directory (AD) and Active Directory Federation 
						Service (ADFS) accounts.<br/>
						AD = Full Name<br/>
						ADFS = firstname.lastname@chda.maxuk.co.uk<br/>
						</p>
						<!--<div id="permissions"></div>-->
						<div class="col-sm-5 col-md-5 col-lg-5">
							<div class="row"><h3>Group Name</h3></div>
							<div class="row"><a id="groupMember" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span> 
								Members</a>
							</div>
							<div class="row"><a id="groupRead" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span> 
								Read</a>
							</div>
							<div class="row"><a id="groupRestricted" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span> 
								Restricted Read</a>
							</div>
							<div class="row"><a id="groupVisitor" href="#" target="_blank"><span class="glyphicon glyphicon-pencil"></span> 
								Visitors</a>
							</div>														
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6">
							<div class="row"><h3>Access Level</h3></div>
							<div class="row">Read / Write</div>
							<div class="row">Read Only</div>
							<div class="row">Restricted</div>
							<div class="row">View Only</div>
						</div>
						<div class="col-md-2"></div> 
					</div>
				</div>
			</div>
			
			<div id="tab3" class="tab-pane fade in">
				<!-- *********************** -->
				<!-- **** Left Section ***** -->
				<!-- *********************** -->
				<div class="col-lg-8 col-md-8 col-sm-8 text-justify">						
					<p>																		  
					This is your Power User Forum, we want to hear from you. 
					Ask a question. Share your thoughts. Get smarter and 
					help others.
					</p>

					<div class="forumButtonContainer">		
						<div id="newPostButton"></div>
						<div id="approvalButton" class="hidden">                    
							<h5>Notifications <span id="notifyIcon" class="glyphicon"></span></h5>
							<label class="switch" onclick="checkToggle()">
								<input id="notifyToggle" type="checkbox"/> 
								<span class="slider round"></span>
							</label>
						</div>           
					</div> 																													          
	
					<!-- ***** Left Container - Navigation Tabs ***** -->
					<div id="postData">
						<div class="postTabContainer">
							<ul id="postTabNames" style="margin:8px 0 0 0!important">
								<li class="active"><a onclick="showRules();makeActive('1');" class="tabButton" data-toggle="pill" href="#fTab1">
								<p>All</p></a></li>
								<li><a onclick="showRules();makeActive('2');" class="tabButton" data-toggle="pill" href="#fTab2">
								<p>Latest</p></a></li>
								<li><a onclick="showRules();makeActive('3');" class="tabButton" data-toggle="pill" href="#fTab3">
								<p>Featured</p></a></li>                                                   	
							</ul>	                	
						</div>                                           
						<div class="tab-content postMastContainer" id="postTabData">
							<div id="fTab1" class="tab-pane fade in dataTab active">																						
								<div class="panel-group" id="All"></div>													            					            				                                    	
							</div>
					
							<div id="fTab2" class="tab-pane fade in dataTab">
								<div class="panel-group" id="New"></div>
							</div>

							<div id="fTab3" class="tab-pane fade in dataTab">
								<div class="panel-group" id="Featured"></div>
							</div>
						</div>
						<div class="postDetailContainer">
							<div id="postDetail"></div>
							<div id="newPostForm">
								<iframe id="newPost" scrolling="no"></iframe>						
							</div>
							<div id="editPostForm">
								<iframe id="editPost" src="" scrolling="no"></iframe>						
							</div>
						</div>                           
					</div>  
				</div> <!-- end left section --> 
			</div>
		</div>
	</div>          
</asp:Content>

<%-- ***** For code to be added at the end of the page body. ***** --%>
<asp:Content ContentPlaceHolderId="PlaceHolderPageCode" runat="server">
				   
    <!-- maxuk/js -->
    <script type="text/javascript" src="/Style Library/maxuk/js/listGUID.js"></script>
    <script type="text/javascript" src="/Style Library/maxuk/js/siteGroupID.js"></script>
	<script type="text/javascript" src="/Style Library/maxuk/js/siteForum.js"></script>
    <script type="text/javascript" src="/Style Library/maxuk/js/adminLinks.js"></script>
	<script type="text/javascript" src="/Style Library/maxuk/js/navTabs.js"></script>

	<script type="text/javascript">

        var forumURL = "https://intranet.chda.maxuk.co.uk/admin/";
        var siteName;
        var siteTitle;
        var list;
        var listID = [];
        var groupCollection;

        $('#newPostForm').addClass('hidden');
        $('#editPostForm').addClass('hidden');
        $('#postDetail').removeClass('hidden');

        if (typeof (MSOLayout_MakeInvisibleIfEmpty) == "function") {
            MSOLayout_MakeInvisibleIfEmpty();
        }

        $(function () {

            $.ajax({
                url: siteURL + "/_api/web/title",
                method: "GET",
                headers: { "Accept": "application/json; odata=verbose" },
                success: function (data) {
                    siteTitle = data.d.Title;
                    siteName = siteURL.split('co.uk/teams/')[1];

                    $().SPServices({
                        operation: "GetGroupCollectionFromUser",
                        userLoginName: $().SPServices.SPGetCurrentUser(),
                        async: false,
                        completefunc: function (xData, Status) {

                            //If the current User does belong to the group "SharePoint Group Name"
                            if ($(xData.responseXML).find("Group[Name='" + siteTitle + " Power Users']").length === 1) {
                                $('#teamOnly').removeClass('hidden');
                            } else {
                                $('#teamOnly').addClass('hidden');
                            }
                        }
                    });

                    listID[1] = GetListGuid('Useful Links');
                    listID[2] = GetListGuid('Documents');
                    listID[3] = GetListGuid('Forms');
                    listID[4] = GetListGuid('FAQs');

                    getLinks(siteURL, siteTitle, siteName, listID[1], listID[2], listID[3], listID[4]);

                    getGroupID(siteURL, siteTitle, siteName, 'Owners', 'groupOwner');
                    getGroupID(siteURL, siteTitle, siteName, 'Members', 'groupMember');
                    getGroupID(siteURL, siteTitle, siteName, 'Visitors', 'groupVisitor');
                    getGroupID(siteURL, siteTitle, siteName, 'Managers', 'groupManager');
                    getGroupID(siteURL, siteTitle, siteName, 'Moderators', 'groupModerator');
                    getGroupID(siteURL, siteTitle, siteName, 'Power Users', 'groupPower');
                    getGroupID(siteURL, siteTitle, siteName, 'Read', 'groupRead');
                    getGroupID(siteURL, siteTitle, siteName, 'Restricted', 'groupRestricted');

                    getPosts(forumURL);
                    showRules();
                    setTabs();
                },
                error: function (data) {
                    console.log("Error: " + data);
                }
            });
        });

        function getGroupID(url, team, site, level, idLink) {

            var groupName = team + " " + level;
            var a = document.getElementById(idLink);
            var groupCollection = context.get_web().get_siteGroups();
            var group = groupCollection.getByName(groupName);

            context.load(group);

            context.executeQueryAsync(
                function () {
                    var membershipGroupId = group.get_id();
                    var groupURL = url + "/_layouts/15/people.aspx?MembershipGroupId=" + membershipGroupId;
                    a.href = groupURL;
                },
                function (sender, args) {
                    console.log('Error\n' + args.get_message());
                }
            );
        };

        /*$(window).on('load', function () {
            $('#loading').addClass('hidden');
            $('#admin').removeClass('hidden');
        });*/
    </script>

</asp:Content>