{************************************
***** User Navigation Template ******
 This template controls the navigation area on user profile pages.
*************************************}
<!-- user_navigation.tpl -->

{***********************************************************************************}
{checkActionsTpl location="tpl_pligg_profile_start"}
<div class="row-fluid" style="margin-bottom:10px;">
	<div class="span9">
		<h1 style="margin-bottom:0px;">
			{if $UseAvatars neq "0" && $pagename == "user_edit"}
				<a href="#profileavatar" data-toggle="modal">
					<div class="thumbnail avatar_thumb">
						{php}
							// Edit Avatar on Page Load using ?avatar=edit at end of URL
							$refer  = $_SERVER["REQUEST_URI"];
							$avatarcheck = strstr($refer, '?');
							if ($avatarcheck == "?avatar=edit"){
								echo "
									<script type='text/javascript'>
										$(window).load(function(){
											$('#profileavatar').modal('show');
										});
									</script>
								";
							}
						{/php}
						<img style="float:left;margin:0 15px 0 0;" src="{$Avatar.large}" style="margin-bottom:4px;" alt="Avatar" />
						<a href="#profileavatar" data-toggle="modal" class="btn btn-small edit-avatar">Edit Avatar</a>
					</div>
				</a>
				{* Avatar upload modal *}
				<div class="modal hide fade" id="profileavatar" style="display: none;">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">&times;</button>
						<h3>Profile Avatar Upload</h3>
					</div>
					<div class="modal-body">
						<form method="POST" enctype="multipart/form-data" name="image_upload_form">
						<script type="text/javascript">
							$('.fileupload').fileupload()
						</script>
	
						<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail">
								<img src="{$Avatar.large}" title="{#PLIGG_Visual_Profile_CurrentAvatar#}" />
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail" style="max-width:{$Avatar_Large}px;max-height:{$Avatar_Large}px;"></div>
							<div>
								<span class="btn btn-file">
									<span class="fileupload-new"><i class="icon icon-picture"></i> Browse</span>
									<span class="fileupload-exists"><i class="icon icon-picture"></i> Browse</span>
									<input type="file" class="fileupload" name="image_file"/>
								</span>
								<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
							</div>
						</div>
						
					</div>
					<div class="modal-footer">
						<input type="hidden" name="avatar" value="uploaded"/>
						{$hidden_token_profile_change}
						<a class="btn" data-dismiss="modal">{#PLIGG_Visual_View_User_Edit_Cancel#}</a>
						<input type="submit" name="action" class="btn btn-primary" value="{#PLIGG_Visual_Profile_AvatarUpload#}"/>
						</form>
					</div>
				</div>
			{elseif $UseAvatars neq "0" && $pagename == "user"}
				{if $user_login eq $user_logged_in || $isadmin}
					<a href="{if $UrlMethod == "2"}{$my_base_url}{$my_pligg_base}/user/{$user_login}/edit/?avatar=edit{else}{$my_base_url}{$my_pligg_base}/profile.php?avatar=edit{/if}">
				{/if}
				<div class="thumbnail avatar_thumb">
					<img style="float:left;margin:0 15px 0 0;" src="{$Avatar.large}" style="margin-bottom:4px;" alt="Avatar" />
					{if $user_login eq $user_logged_in || $isadmin}
						<a class="btn btn-small edit-avatar" href="{if $UrlMethod == "2"}{$my_base_url}{$my_pligg_base}/user/{$user_login}/edit/?avatar=edit{else}{$my_base_url}{$my_pligg_base}/profile.php?avatar=edit{/if}">Edit Avatar</a>
					{/if}
				</div>
				{if $user_login eq $user_logged_in || $isadmin}</a>{/if}
			{/if}
			{$user_username|capitalize}
		</h1>
		<div>
			{checkActionsTpl location="tpl_user_profile_social_start"}
			{if $user_skype}
				<a href="callto://{$user_skype}" title="Skype {$user_username|capitalize}" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/skype_round.png" /></a>
			{/if}
			{if $user_facebook}
				<a href="http://www.facebook.com/{$user_facebook}" title="{$user_username|capitalize} on Facebook" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/facebook_round.png" /></a>
			{/if}
			{if $user_twitter}
				<a href="http://twitter.com/{$user_twitter}" title="{$user_username|capitalize} on Twitter" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/twitter_round.png" /></a>
			{/if}
			{if $user_linkedin}
				<a href="http://www.linkedin.com/in/{$user_linkedin}" title="{$user_username|capitalize} on LinkedIn" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/linkedin_round.png" /></a>
			{/if}
			{if $user_googleplus}
				<a href="https://plus.google.com/{$user_googleplus}" title="{$user_username|capitalize} on Google+" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/google_round.png" /></a>
			{/if}
			{if $user_pinterest}
				<a href="http://pinterest.com/{$user_pinterest}/" title="{$user_username|capitalize} on Pinterest" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/pinterest_round.png" /></a>
			{/if}
			{checkActionsTpl location="tpl_user_profile_social_end"}
		</div>
		{checkActionsTpl location="tpl_show_extra_profile"}
		<div style="font-size:0.85em;line-height:1.3em;margin-top:2px;">		
			{if $user_publicemail ne ""}
				{php}
					// Method to try to trick automated email address collection bots
					global $main_smarty;
					$full_email = $this->_vars['user_publicemail'];
					list($email_start,$_) = explode('@',$full_email); $email_domain = ''.$_;
					$main_smarty->assign('email_start', $email_start);
					$main_smarty->assign('email_domain', $email_domain);
				{/php}
				<script type="text/javascript">
				<!--
					var string1 = "{$email_start}";
					var string2 = "@";
					var string3 = "{$email_domain}";
				//  document.write(string4);
					document.write("<a href=" + "mail" + "to:" + string1 + string2 + string3 + ">Email</a> | ");
				//-->
				</script>
			{/if}
			{if $user_url != "" && $user_karma > "20" || $user_login eq $user_logged_in}
				<a href="{$user_url}" target="_blank" rel="nofollow">{$user_url}</a>
				<br />
			{/if}
			{checkActionsTpl location="tpl_user_profile_details_start"}
			{if $user_names != ""}
				{$user_names}
				{if $user_occupation != "" || $user_location != ""}	is {/if}
			{/if}
			{if $user_occupation != ""}
				{if $user_names != ""} a {/if}
				{$user_occupation}
			{/if}
			{if $user_location != ""}
				{if $user_occupation != "" || $user_names != ""}
					 from 
				{elseif $user_location != ""}
					 From 
				{/if}
				{$user_location}
			{/if}
			{checkActionsTpl location="tpl_user_profile_details_end"}
		</div>
	</div>
	<div id="user_search" class="span3">
		<div style="float:right;text-align:right;">
			<form action="{$my_pligg_base}/user.php" method="get" {php} global $URLMethod, $my_base_url, $my_pligg_base; if ($URLMethod==2) print "onsubmit='document.location.href=\"{$my_base_url}{$my_pligg_base}/user/search/\"+encodeURIComponent(this.keyword.value); return false;'";{/php}>
				<div class="input-append">
					<input type="hidden" name="view" value="search">
					<input type="text" name="keyword" class="input-medium" placeholder="{#PLIGG_Visual_User_Search_Users#}"><button type="submit" class="btn">{#PLIGG_Visual_Search_Go#}</button>
				</div>
			</form>	
			<div class="btn-group">
				<a class="btn btn-small" href="{$user_url_friends}"><i class="icon-user"></i> {$user_following} {#PLIGG_Visual_User_Profile_View_Friends#}</a>
				<a class="btn btn-small" href="{$user_url_friends2}"><i class="icon-user"></i> {$user_followers} {#PLIGG_Visual_User_Profile_Your_Friends#}</a>
                {if check_for_enabled_module('simple_messaging',2.0) && $is_friend}
					<a class="btn btn-small" href="{$my_base_url}{$my_pligg_base}/module.php?module=simple_messaging&view=compose&to={$username}&return={$my_pligg_base}%2Fuser.php%3Flogin%3D{$user_logged_in}%26view%3Dfollowers"><i class="icon-envelope"></i> Send Message</a>
				{/if}
				{if $is_friend gt 0}
					<a href="{$user_url_remove}" class="btn btn-small btn-danger">{#PLIGG_Unfollow#}{* {$user_login|capitalize} *}</a>
					{if $user_authenticated eq true}
						{checkActionsTpl location="tpl_user_center"}
					{/if}
				{elseif $user_login neq $user_logged_in}
					{if $user_authenticated eq true} 
						<a  class="btn btn-small btn-success" href="{$user_url_add}">{#PLIGG_Visual_User_Profile_Add_Friend#}{* {$user_login|capitalize} *}</a>
					{/if}   
				{/if}
			</div>
		</div>
	</div>
	<div style="clear:both;"></div>
</div>
{checkActionsTpl location="tpl_user_center_just_below_header"}
<ul class="nav nav-tabs" id="profiletabs">
	{checkActionsTpl location="tpl_pligg_profile_sort_start"}
	<li {if $user_view eq 'profile' || $user_view eq 'removefriend' || $user_view eq 'addfriend'}class="active"{/if}><a {if $user_view eq 'profile'}data-toggle="tab" href="#personal_info"{else}href="{$user_url_personal_data2}"{/if} class="navbut{$nav_pd}">{#PLIGG_Visual_User_PersonalData#}</a></li>
	{if $user_login eq $user_logged_in || $isadmin}
		<li {if $pagename eq 'user_edit'}class="active"{/if}><a href="{$URL_Profile2}" class="navbut{$nav_set}">{#PLIGG_Visual_User_Setting#}</a></li>
	{/if}
	<li {if $user_view eq 'history'}class="active"{/if}><a href="{$user_url_news_sent2}" class="navbut{$nav_ns}">{#PLIGG_Visual_User_NewsSent#}</a></li>
	<li {if $user_view eq 'published'}class="active"{/if}><a href="{$user_url_news_published2}" class="navbut{$nav_np}">{#PLIGG_Visual_User_NewsPublished#}</a></li>
	<li {if $user_view eq 'new'}class="active"{/if}><a href="{$user_url_news_unpublished2}" class="navbut{$nav_nu}">{#PLIGG_Visual_User_NewsUnPublished#}</a></li>
	<li {if $user_view eq 'commented'}class="active"{/if}><a href="{$user_url_commented2}" class="navbut{$nav_c}">{#PLIGG_Visual_User_NewsCommented#}</a></li>
	<li {if $user_view eq 'upvoted'}class="active"{/if}><a href="{$user_url_news_upvoted2}" class="navbut{$nav_nv}">{#PLIGG_Visual_UpVoted#}</a></li>
	<li {if $user_view eq 'downvoted'}class="active"{/if}><a href="{$user_url_news_downvoted2}" class="navbut{$nav_nv}">{#PLIGG_Visual_DownVoted#}</a></li>
	<li {if $user_view eq 'saved'}class="active"{/if}><a href="{$user_url_saved2}" class="navbut{$nav_s}">{#PLIGG_Visual_User_NewsSaved#}</a></li>
	{checkActionsTpl location="tpl_pligg_profile_sort_end"}
</ul>

<!--/user_navigation.tpl -->