<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineGym.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="jquery.slidertron-1.1.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <%-- <div align="right"><asp:LinkButton ID="lbLogin" runat="server" 
        onclick="lbLogin_Click">Login</asp:LinkButton></div>--%>



<div id="banner">
	<div id="slider">
		<div class="viewer">
			<div class="reel">
				<div class="slide">
					<h2>A Better Legal System.</h2>
					<p>You’re not Cured until They’re Insured.</p>
					<img src="images/1.jpg" alt="" /> </div>
				<div class="slide">
					<h2>Lawyers. Just Different.</h2>
					<p>A large firm with a human touch.</p>
					<img src="images/2.jpg" alt="" /> </div>
                <div class="slide">
					<h2>Leaders in their Field.</h2>
					<p>Common Ground. Uncommon Vision.</p>
					<img src="images/3.jpg" alt="" /> </div>
				<div class="slide">
					<h2>Power of Collaboration.</h2>
					<p>Deeper Understanding. Better Solutions.</p>
					<img src="images/4.jpg" alt="" /> </div>
				<div class="slide">
					<h2>Power of Collaboration.</h2>
					<p>Deeper Understanding. Better Solutions.</p>
					<img src="images/5.jpg" alt="" /> </div>
				</div>
		</div>
		
	</div>
	<script type="text/javascript">
	    $('#slider').slidertron({
	        viewerSelector: '.viewer',
	        reelSelector: '.viewer .reel',
	        slidesSelector: '.viewer .reel .slide',
	        advanceDelay: 3000,
	        speed: 'slow',
	        navPreviousSelector: '.previous-button',
	        navNextSelector: '.next-button',
	        indicatorSelector: '.indicator ul li',
	        slideLinkSelector: '.link'
	    });
	</script> 
</div>



<%--<div id="banner">
    <div class="content"><img src="images/img02.jpg" width="1000" height="400" alt="" /></div>
</div>--%>


<div id="featured-content">
		<div id="column1">
			<h2>Gym Floor Cover</h2>
			<p><img src="images/img06.jpg" width="300" height="150" alt="" /></p>
			<p>Gym floor covers can either be a carpet-based protection system or is a large plastic tarp, similar to a painters tarp, usually divided into equal sections 6 to 10 feet (1.8 to 3.0 m) wide each to cover up the entire gym floor. These covers are often used in large venues designed for athletic events when non-athletic events are being held there such as receptions, award ceremonies and graduations.</p>
			<p class="button"><a href="http://en.wikipedia.org/wiki/Gym_floor_cover">Read More</a></p>
		</div>
		<div id="column2">
			<h2>Outdoor GYM</h2>
			<p><img src="images/img07.jpg" width="300" height="150" alt="" /></p>
			<p>The outdoor gym is a gym built outside in a public park, with the all-weather construction of its exercise machines somewhat modeled on playground equipment. <br />It is similar to the 1960s-70s proliferation of fitness trails, which continue to be created particularly in the USA and Europe. In some instances, trails used for fitness are referred to as outdoor gyms.</p>
			<p class="button"><a href="http://en.wikipedia.org/wiki/Outdoor_gym">Read More</a></p>
		</div>
		<div id="column3">
			<h2>Exercise Trends</h2>
			<p><img src="images/img08.jpg" width="300" height="150" alt="" /></p>
			<p>Worldwide there has been a large shift towards less physically demanding work. This has been accompanied by increasing use of mechanized transportation, a greater prevalence of labor saving technology in the home, and less active recreational pursuits. At least 31% of the world's population does not get sufficient exercise. This is true in almost all developed and developing countries, and among children. </p>
			<p class="button"><a href="http://en.wikipedia.org/wiki/Exercise_trends">Read More</a></p>
		</div>
	</div>
	<div id="page">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome to Gym Rock </a></h2>
				<div class="entry">
                    <p>The first <strong>gymnasiums</strong> in history can be dated over 3000 years ago in ancient Persia, they were known as Zurkhaneh, as areas that encouraged physical fitness. Gymnasia (i.e., places for gymnastics) in Germany were an outgrowth of the Turnplatz, an outdoor space for gymnastics, which was promoted by German educator Friedrich Jahn and the Turners, a nineteenth-century political and gymnastic movement. The first indoor gymnasium in Germany was probably the one built in Hesse in 1852 by Adolph Spiess, an enthusiast for boys' and girls' gymnastics in the schools.</p>
                    <p>Gym is slang for gymnasium and gymnastic services such as in schools and colleges and is attributed to compounds such as gym shoes.[1] Gymnasia are open air and covered locations for gymnastics and athletics. Gymnasia apparatus such as bar-bells, parallel bars, jumping board, running path, tennis-balls, cricket field, fencing gallery, and so forth are used for exercise. In safe weather, outdoor locations are the most conductive to health.[2] Gyms were popular in ancient Greece. Their curricula included Gymnastica militraria or self-defense, gymnastica medica, or physical therapy to help the sick and injured, and gymnastica athletica for physical fitness and sports, from boxing to dance. <br /></p>
					<%--<p>This is <strong>Consecutive</strong>, a free, fully standards-compliant CSS template designed by <a href="http://www.freecsstemplates.org">FCT</a>.   The photos in this template are from <a href="http://fotogrph.com/"> Fotogrph</a>. This free template is released under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attributions 3.0</a> license, so you are pretty much free to do whatever you want with it (even use it commercially) provided you keep the links in the footer intact. Aside from that, have fun with it :) </p>
					<p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. Pellentesque adipiscing purus ac magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Consectetuer adipiscing elit. Nam pede erat, porta.<br />
					</p>--%>
					<%--<p class="links"><a href="#" class="more">Read More</a><a href="#" title="b0x" class="comments">Comments</a></p>--%>
				</div>
			</div>
		</div>
		
		<div id="sidebar">
			<ul>
				<li>
					<h2>Check Also This</h2>
					<ul>
						<li><a href="http://en.wikipedia.org/wiki/Physical_education" target="_blank">Physical education</a></li>
						<li><a href="http://en.wikipedia.org/wiki/Exercise_trends" target="_blank">Exercise trends</a></li>
						<li><a href="http://en.wikipedia.org/wiki/Gym_floor_cover" target="_blank">Gym Floor Cover</a></li>
						<li><a href="http://en.wikipedia.org/wiki/Gymkhana" target="_blank">Gymkhana</a></li>
						<li><a href="http://en.wikipedia.org/wiki/Largest_high_school_gyms_in_the_United_States" target="_blank">Largest high school gyms in the USA</a></li>
						<li><a href="http://en.wikipedia.org/wiki/Outdoor_gym" target="_blank">Outdoor gym</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<div style="clear: both;">&nbsp;</div>
	</div>
    <br /><br /><br />
</asp:Content>
