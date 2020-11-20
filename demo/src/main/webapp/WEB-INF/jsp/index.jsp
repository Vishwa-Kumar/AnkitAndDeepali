<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Page Title -->
<title>Ankit Agarwal & Deepali Das Wedding</title>
<meta name="keywords"
	content="Ankit,Deepali,Madu ki shaadi,madu ki hui deepali">
<meta name="description"
	content="Finally two love birds are getting married">

<!-- Favicon and Touch Icons -->
<link href="images/favicon/favicon.png" rel="shortcut icon"
	type="image/png">
<link href="images/favicon/apple-touch-icon.png" rel="apple-touch-icon">
<link href="images/favicon/apple-touch-icon-72x72.png"
	rel="apple-touch-icon" sizes="72x72">
<link href="images/favicon/apple-touch-icon-114x114.png"
	rel="apple-touch-icon" sizes="114x114">
<link href="images/favicon/apple-touch-icon-144x144.png"
	rel="apple-touch-icon" sizes="144x144">

<!-- Icon fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/flaticon.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Plugins for this template -->
<link href="css/animate.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">
<link href="css/slick.css" rel="stylesheet">
<link href="css/slick-theme.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link href="css/jquery.fancybox.css" rel="stylesheet">
<link href="css/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.hero .wedding-announcement .couple-name-merried-text h2 {
	font-family: "Great Vibes", cursive;
	font-size: 90px;
	font-size: 5rem;
	color: #fff;
	margin: 0 0 0.4em;
	position: relative;
	z-index: 10;
	padding: 0.6em 0.6em 0.8em 0.6em;
	border-radius: 70px;
	background-color: #ea003063;
	display: initial;
}

.hero .wedding-announcement .save-the-date:after {
	background-color: #ea003063;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.getting-there-section !important {
	background-color: #ea003063;
}

.rsvp-section:after {
	content: "";
	background-color: rgb(0 0 0/ 50%);
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
}

.getting-there-section {
	background-color: #800023;
}

.count-down-section #clock {
	color: #c60a72;
	overflow: hidden;
}

.story-section .story-timeline h3 {
	font-size: 22px;
	font-size: 1.22222rem;
	font-weight: 600;
	color: #c60a72;
	margin: 0 0 0.5em;
	text-transform: uppercase;
}

.header-style-1 .couple-logo a, .header-style-2 .couple-logo a {
	color: #c01665;
}

.site-footer h2 {
	font-family: "Great Vibes", cursive;
	font-size: 67px;
	font-size: 2.72222rem;
	color: #fff;
	margin: 0 0 0.3em;
	padding: 0 127px;
	text-transform: capitalize;
	letter-spacing: 5px;
}

.site-footer a {
	color: white;
	text-decoration: bold;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
var ip;
				 $.getJSON("https://api.ipify.org?format=jsonp&callback=?",
						function(data) {
							console.log(JSON.stringify(data, null, 2));
							
							ip = data.ip;
						}); 
						var details={};
						details["ip"]=ip;
						
					//var ip="59.90.52.191";
					    var api_key = "at_vHwaZS5xdzGvDKAk3BkXTwfbJ8vfc";
						$.ajax({
					           url: "https://geo.ipify.org/api/v1",
					           data: {apiKey: api_key, ipAddress: ip},
					           success: function(dataFull) {
					               console.log(JSON.stringify(dataFull, null, 2));
					            
					             details["country"]=dataFull.location.country;
					             details["region"]=dataFull.location.region;
					             details["zip"]=dataFull.location.postalCode;
					             details["city"]=dataFull.location.city;
					             console.log(JSON.stringify(details, null, 2));
					             sendMail(details);
					           },error: function(dataFull) {
					               console.log(JSON.stringify(dataFull, null, 2));
						            
						             details["country"]="NA";
						             details["region"]="NA";
						             details["zip"]="NA";
						             details["city"]="NA";
						             console.log(JSON.stringify(details, null, 2));
						             sendMail(details);
						           }
						});
				console.log("ready!");
				var day = new Date();
				var wish = "Hi";
				var hr = day.getHours();
				if (hr >= 0 && hr < 12) {
					wish = "Good Morning !";
				} else if (hr == 12) {
					wish = "Good Noon!";
				} else if (hr >= 12 && hr <= 17) {
					wish = "Good AferNoon !";
				} else {
					wish = "Good Evening !";
				}
				$('.wish').text(wish + " ");

				function sendMail(input) {

					$.ajax({
						type : "POST",
						url : "https://www.ankitanddeepali.com/sendmail",
						/* 	 url : "http://localhost:8080/sendmail",   */
						contentType : "application/json",
						data : JSON.stringify(input),
						dataType : 'json',
						success : function(data_response) {
							console.log("success data_response");
						},
						error : function(data_response) {
							console.log("error data_response"
									+ JSON.stringify(data_response))
						}
					});
				}

			});
</script>


</head>

<body id="home">

	<!-- start page-wrapper -->
	<div class="page-wrapper">

		<!-- start preloader -->
		<div class="preloader">
			<div class="inner">
				<span class="icon"><i class="fi flaticon-two"></i></span>
			</div>
		</div>
		<!-- end preloader -->


		<!-- strat music-box -->
		<div class="music-box">
			<button class="music-box-toggle-btn">
				<i class="fa fa-music"></i>
			</button>

			<div class="music-holder">
				<iframe src="music/silence.mp3" type="audio/mp3" allow="autoplay"
					id="iaudio" style="display: none"></iframe>
				<audio id="audio" controls loop autoplay>
					<source src="music/Never_Stop_Wedding_Version.mp3"
						type="audio/mpeg">
					Your browser does not support the audio element.
				</audio>
			</div>
		</div>
		<!-- end music box -->


		<!-- start of hero -->
		<section class="hero">
			<div class="static-hero"></div>

			<div id="spirit-header" class="spirit-header">
				<canvas id="spirit-canvas"></canvas>
			</div>

			<div class="wedding-announcement">
				<div class="couple-name-merried-text">
					<h2 class="wow slideInUp" data-wow-duration="1s">Ankit &amp;
						Deepali</h2>
					<div class="married-text wow fadeIn" data-wow-delay="1s">
						<h4 class="">
							<span class=" wow fadeInUp" data-wow-delay="1.05s">W</span> <span
								class=" wow fadeInUp" data-wow-delay="1.10s">e</span> <span
								class=" wow fadeInUp" data-wow-delay="1.15s">'</span> <span
								class=" wow fadeInUp" data-wow-delay="1.20s">r</span> <span
								class=" wow fadeInUp" data-wow-delay="1.25s">e</span> <span>&nbsp;</span>
							<span class=" wow fadeInUp" data-wow-delay="1.30s">g</span> <span
								class=" wow fadeInUp" data-wow-delay="1.35s">e</span> <span
								class=" wow fadeInUp" data-wow-delay="1.40s">t</span> <span
								class=" wow fadeInUp" data-wow-delay="1.45s">t</span> <span
								class=" wow fadeInUp" data-wow-delay="1.50s">i</span> <span
								class=" wow fadeInUp" data-wow-delay="1.55s">n</span> <span
								class=" wow fadeInUp" data-wow-delay="1.60s">g</span> <span>&nbsp;</span>
							<span class=" wow fadeInUp" data-wow-delay="1.65s">m</span> <span
								class=" wow fadeInUp" data-wow-delay="1.70s">a</span> <span
								class=" wow fadeInUp" data-wow-delay="1.75s">r</span> <span
								class=" wow fadeInUp" data-wow-delay="1.80s">r</span> <span
								class=" wow fadeInUp" data-wow-delay="1.85s">i</span> <span
								class=" wow fadeInUp" data-wow-delay="1.90s">e</span> <span
								class=" wow fadeInUp" data-wow-delay="1.95s">d</span>

						</h4>
					</div>
					<!-- <i class="fa fa-heart"></i> -->
				</div>

				<div class="save-the-date">
					<h4>Save the date</h4>
					<span class="date">30 NOV 2020</span>
				</div>
			</div>
		</section>
		<!-- end of hero slider -->


		<!-- Start header -->
		<header id="header" class="site-header header-style-1">
			<nav class="navigation navbar navbar-default">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="open-btn">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div class="couple-logo">
							<h1>
								<a href="#home">A <i class="fi flaticon-shape-1"></i> D
								</a>
							</h1>
						</div>
					</div>
					<div id="navbar"
						class="navbar-collapse collapse navbar-right navigation-holder">
						<button class="close-navbar">
							<i class="fa fa-close"></i>
						</button>
						<ul class="nav navbar-nav">
							<li><a href="#home">Home</a></li>
							<li><a href="#couple">Couple</a></li>
							<li><a href="#story">Story</a></li>
							<li><a href="#events">Events</a></li>
							<li><a href="#rsvp">subscribe</a></li>
							<!--   <li><a href="#people">People</a></li>
                            <li><a href="#gallery">Gallery</a></li>
                           -->
							<!-- <li class="menu-item-has-children">
                                <a href="javascript:void(0);">Blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                    <li class="menu-item-has-children">
                                        <a href="#Level3">Thidr level</a>
                                        <ul class="sub-menu">
                                            <li><a href="#">Level3</a></li>
                                            <li><a href="#">Level3</a></li>
                                            <li><a href="#">Level3</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li> -->
						</ul>
					</div>
					<!-- end of nav-collapse -->
				</div>
				<!-- end of container -->
			</nav>
		</header>
		<!-- end of header -->


		<!-- start wedding-couple-section -->
		<section class="wedding-couple-section section-padding" id="couple">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<div class="gb groom">
							<div class="img-holder wow fadeInLeftSlow">
								<img src="images/couple/img-1.jpg" alt>
							</div>
							<div class="details">
								<div class="details-inner">
									<h3>The groom</h3>
									<p>
										Big Time Mumma's Boy!<br> Drastically pampered family
										person('kid') , who believes in living life in the present and
										to the fullest. Love the people I love, cherish surprising and keeping my dear ones happy ! From enjoying the tiniest of
										opportunities and pleasures to now stepping into this exciting
										phase of my life with my beautiful Soulmate , Life has been
										generous!
									</p>
									<span class="signature">Ankit</span>
									<ul class="social-links">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="gb bride">
							<div class="details">
								<div class="details-inner">
									<h3>The Bride</h3>
									<p>Ek lakdi thi deewani si , SRK pe wo marti thi
										!!(*shameless grins* : D). Couldn't think of better lines for
										self intro :P Anyways people who know me do not need an intro
										, and for the others , Hold On Guyz as I am too buzy gushing
										over the Coming up episodes of life with my handsome co-star!
									</p>
									<span class="signature">Deepali</span>
									<ul class="social-links">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="img-holder wow fadeInRightSlow">
								<img src="images/couple/img-2.jpg" alt>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end wedding-couple-section -->


		<!-- start count-down-section -->
		<section class="count-down-section section-padding parallax"
			data-bg-image="images/countdown-bg.jpg" data-speed="7">
			<div class="container">
				<div class="row">
					<div class="col col-md-4">
						<h2>
							<span>We are waiting for.....</span> The adventure
						</h2>
					</div>
					<div class="col col-md-7 col-md-offset-1">
						<div class="count-down-clock">
							<div id="clock"></div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end count-down-section -->


		<!-- start story-section -->
		<section class="story-section section-padding" id="story">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<div class="section-title">
							<div class="vertical-line">
								<span><i class="fi flaticon-two"></i></span>
							</div>
							<h2>Our love story</h2>
						</div>
					</div>
				</div>
				<!-- end section-title -->

				<div class="row">
					<div class="col col-xs-12">
						<div class="story-timeline">
							<div class="row">
								<div class="col col-md-6">
									<div class="story-text right-align-text">
										<h3>First meet</h3>
										<span class="date">March 23 2018</span>
										<p>
											Secunderabad Railway Station.<br> It does happen that a
											train starts its run from the platform and stops minutes
											later (due to any possible reason) , but that day we bet it
											was our destiny that made it happen. Almost missed train to
											Papikonadalu for a trip with our common friends was the first
											time we met. Little did we know that was the beginning of
											'our' journey!
										</p>
									</div>
								</div>
								<div class="col col-md-6">
									<div class="img-holder">
										<img src="images/story/img-1.jpg" alt
											class="img img-responsive">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col col-md-6">
									<div class="img-holder right-align-text story-slider">
										<img src="images/story/img-3.jpg" alt
											class="img img-responsive"> <img
											src="images/story/img-2.jpg" alt class="img img-responsive">
									</div>
								</div>
								<div class="col col-md-6 text-holder">
									<span class="heart"> <i class="fa fa-heart"></i>
									</span>
									<div class="story-text">
										<h3>First date</h3>
										<span class="date">May 25 2018</span>
										<p>
											Fusion 9</br> An unplanned lunch between office hours when it
											happened to be just the two of us going to grab something ,
											others being busy. It was months later when i realized that
											the others were 'planned' to be buzy so that he could take me
											to have long craved mushroom baos. (typical filmy) : P
										</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col col-md-6 text-holder right-heart">
									<span class="heart"> <i class="fa fa-heart"></i>
									</span>
									<div class="story-text right-align-text">
										<h3>Proposal</h3>
										<span class="date">May 25 2020</span>
										<p>
											Malaysian Township <br>Exactly 2 years after the first
											date , I happened to stop by his home to surprise him,
											totally unaware of what was instore until he out of nowhere
											gathers his family and goes on knees! Yes , the answer was
											obvious , but the realization and excitement that the moment
											created was one hell of a dream !
										</p>
									</div>
								</div>
								<div class="col col-md-6">
									<div class="img-holder right-align-text">
										<img src="images/story/img-5.jpg" alt
											class="img img-responsive">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col col-md-6">
									<div class="img-holder">
										<img src="images/story/img-8.jpg" alt
											class="img img-responsive">
									</div>
								</div>
								<div class="col col-md-6 text-holder">
									<span class="heart"> <i class="fa fa-heart"></i>
									</span>
									<div class="story-text">
										<h3>Roka</h3>
										<span class="date">Jul 23 2020</span>
										<p>
											Corona is a bitch , but we got hitched!<br> That is how
											unstoppable we were that even the pandemic and lockdown
											couldn't hinder us from having a close ceremony with our
											beloved family and friends(joining online). Another beautiful
											rainy day added to our notebook!
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end story-section -->


		<!-- start cta -->
		<section class="cta section-padding parallax"
			data-bg-image="images/cta-bg.jpg" data-speed="7">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<h2>
							<span>We are going to...</span> Celebrate Our Love
						</h2>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end cta -->


		<!-- start events-section -->
		<section class="events-section section-padding" id="events">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<div class="section-title">
							<div class="vertical-line">
								<span><i class="fi flaticon-two"></i></span>
							</div>
							<h2>Wedding events</h2>
						</div>
					</div>
				</div>
				<!-- end section-title -->

				<div class="row">
					<div class="col col-lg-10 col-lg-offset-1">
						<div class="event">
							<div class="img-holder">
								<img src="images/events/img-1.jpg" alt
									class="img img-responsive">
							</div>
							<div class="details">
								<h3>Satsang and Haldi</h3>
								<ul>
									<li><i class="fa fa-map-marker"></i> Novotel, Ball Room,
										Hyderabad.</li>
									<li><i class="fa fa-clock-o"></i> Nov 30 2020, 8AM</li>
									<a class="see-location-btn popup-gmaps"
										href="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3805.724417927388!2d78.37160681449711!3d17.472899388027425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb92320a27f5a9%3A0xf7ffe9c0885c159b!2sNovotel%20Hyderabad%20Convention%20Centre!5e0!3m2!1sen!2sin!4v1604563353662!5m2!1sen!2sin">
										See location <i class="fa fa-angle-right"></i>
									</a>
								</ul>
								<p>
									Satsang / satsangam is a word which comes from Sanskrit,
									meaning to associate with true people, or to be in the company
									of true people. It is also related to sitting with a sat guru,
									or in a group meeting seeking that associatio<br> <br>
									The Haldi ceremony is a ritual holy bath also known as pithi
									ceremony, which is one of the pre-wedding ceremonies in India.
									Turmeric (haldi), oil and water are applied to both the bride
									and groom by married women on the morning of the wedding. The
									mixture is believed to bless the couple before the wedding
								</p>

							</div>
						</div>
						<div class="event">
							<div class="img-holder">
								<img src="images/events/img-2.jpg" alt
									class="img img-responsive">
							</div>
							<div class="details">
								<h3>Sangeet and Engagement</h3>
								<ul>
									<li><i class="fa fa-map-marker"></i> Novotel, Lawns,
										Hyderabad.</li>
									<li><i class="fa fa-clock-o"></i> Nov 30 2020, 12:30 PM</li>
									<a class="see-location-btn popup-gmaps"
										href="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3805.724417927388!2d78.37160681449711!3d17.472899388027425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb92320a27f5a9%3A0xf7ffe9c0885c159b!2sNovotel%20Hyderabad%20Convention%20Centre!5e0!3m2!1sen!2sin!4v1604563353662!5m2!1sen!2sin">
										See location <i class="fa fa-angle-right"></i>
									</a>
								</ul>
								<p>
									Lets sing & dance together to cheer the love and the union
									between the two families.<br> <br> The word "Sangeet"
									means music, but when it is used as a term to describe a
									celebratory event during an Indian wedding it translates to
									Music Night or Musical party. This musical night is a
									celebration of the union of not only the couple but the bonding
									of both families.
								</p>

							</div>
						</div>
						<div class="event">
							<div class="img-holder">
								<img src="images/events/img-3.jpg" alt
									class="img img-responsive">
							</div>
							<div class="details">
								<h3>Reception and Dinner</h3>
								<ul>
									<li><i class="fa fa-map-marker"></i> Novotel, Lawns,
										Hyderabad.</li>
									<li><i class="fa fa-clock-o"></i> Nov 30 2020, 7:00 PM</li>
									<a class="see-location-btn popup-gmaps"
										href="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3805.724417927388!2d78.37160681449711!3d17.472899388027425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb92320a27f5a9%3A0xf7ffe9c0885c159b!2sNovotel%20Hyderabad%20Convention%20Centre!5e0!3m2!1sen!2sin!4v1604563353662!5m2!1sen!2sin">
										See location <i class="fa fa-angle-right"></i>
									</a>
								</ul>
								<p>Join us as we celebrate the joyous marriage of Ankit and
									Deepali</p>

							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end events-section -->


		<!-- start inportant-people-section -->
		<!--  <section class="inportant-people-section section-padding" id="people">
            <div class="container">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="section-title">
                            <div class="vertical-line"><span><i class="fi flaticon-two"></i></span></div>
                            <h2>Groomsmen &amp; Bridesmaid</h2>
                        </div>
                    </div>
                </div> end section-title

                <div class="row">
                    <div class="col col-xs-12">
                        <div class="inportant-people-content">
                            <div class="tablist">
                                <ul class="nav">
                                    <li class="active">
                                        <a href="#groomsmen" data-toggle="tab">Groomsmen</a>
                                    </li>
                                    <li>
                                        <a href="#bridesmaid" data-toggle="tab">Bridesmaid</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane fade in active grid-wrapper" id="groomsmen">
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-1.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-1.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Jhon Michel</h3>
                                            <span>Best man</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-2.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-2.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Chasmoos jhon</h3>
                                            <span>Best friden</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-3.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-3.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Kaiste pate</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-4.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-4.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Hatu Michel</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-5.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-5.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Michel doin</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/groomsmen/img-6.jpg" class="popup-image">
                                                <img src="images/groomsmen/img-6.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Topper jone</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade grid-wrapper" id="bridesmaid">
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-1.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-1.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Rachel Li</h3>
                                            <span>Made of honor</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-2.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-2.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Male Vign</h3>
                                            <span>Best friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-3.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-3.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Jonny Mich</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-4.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-4.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Brodd Wid</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-5.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-5.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Nokshal bedi</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="img-holder">
                                            <a href="images/bridesmaid/img-6.jpg" class="popup-image">
                                                <img src="images/bridesmaid/img-6.jpg" alt class="img img-responsive">
                                            </a>
                                        </div>
                                        <div class="details">
                                            <h3>Holly Fie</h3>
                                            <span>Friend</span>
                                            <ul class="social-links">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> end row
            </div> end container
        </section> -->
		<!-- end inportant-people-section -->


		<!-- start gallery-section -->
		<!--  <section class="gallery-section section-padding" id="gallery">
            <div class="container">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="section-title">
                            <div class="vertical-line"><span><i class="fi flaticon-two"></i></span></div>
                            <h2>Our gallery</h2>
                        </div>
                    </div>
                </div> end section-title

                <div class="row">
                    <div class="col col-xs-12 sortable-gallery">
                        <div class="gallery-filters">
                            <ul>
                                <li><a data-filter="*" href="#" class="current">All</a></li>
                                <li><a data-filter=".wedding" href="#">Wedding</a></li>
                                <li><a data-filter=".ceremony" href="#">Ceremony</a></li>
                                <li><a data-filter=".party" href="#">Party</a></li>
                            </ul>
                        </div>

                        <div class="gallery-container gallery-fancybox masonry-gallery">
                            <div class="grid wedding">
                                <a href="images/gallery/img-1.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-1.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid wedding ceremony">
                                <a href="images/gallery/img-2.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-2.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid ceremony eudcation">
                                <a href="images/gallery/img-3.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-3.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid wedding party">
                                <a href="images/gallery/img-4.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-4.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid ceremony">
                                <a href="images/gallery/img-5.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-5.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid party">
                                <a href="images/gallery/img-6.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-6.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid wedding">
                                <a href="images/gallery/img-7.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-7.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                            <div class="grid ceremony">
                                <a href="images/gallery/img-8.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-8.jpg" alt class="img img-responsive">
                                </a>
                                <a href="https://www.youtube.com/embed/XSGBVzeBUbk?autoplay=1" data-type="iframe" class="video-play-btn">
                                    <img src="images/gallery/img-8.jpg" alt class="img img-responsive">
                                    <i class="fa fa-play"></i>
                                </a>

                            </div>
                            <div class="grid ceremony">
                                <a href="images/gallery/img-9.jpg" class="fancybox" data-fancybox-group="gall-1">
                                    <img src="images/gallery/img-9.jpg" alt class="img img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                </div> end row
            </div> end container
        </section> -->
		<!-- end gallery-section -->


		<!-- start rsvp-section -->
		<section class="rsvp-section section-padding parallax"
			data-bg-image="images/rsvp-bg.jpg" data-speed="7" id="rsvp">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<div class="section-title-white">
							<div class="vertical-line">
								<span><i class="fi flaticon-two"></i></span>
							</div>
							<h2>Join our party</h2>
						</div>
					</div>
				</div>
				<!-- end section-title -->

				<div class="row content">
					<div class="col col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<p>Subscribe to the wedding events so that you dont miss it
							and get the live notification directly in your inbox</p>
						<form id="rsvp-form" class="form validate-rsvp-form row"
							method="post">
							<div class="col col-sm-6">
								<input type="text" name="name" class="form-control"
									placeholder="Your Name*">
							</div>
							<div class="col col-sm-6">
								<input type="email" name="email" class="form-control"
									placeholder="Your Email*">
							</div>
							<!--   <div class="col col-sm-6">
                                <select class="form-control" name="guest" >
                                    <option disabled selected>Number Of Guest*</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </div> -->
							<!--     <div class="col col-sm-6">
                                <select class="form-control" name="events" >
                                    <option disabled selected>I Am Attending*</option>
                                    <option>Al events</option>
                                    <option>Wedding ceremony</option>
                                    <option>Reception party</option>
                                </select>
                            </div> -->
							<!--  <div class="col col-sm-12">
                                <textarea class="form-control" name="notes" placeholder="Your Message*"></textarea>
                            </div> -->
							<div class="col col-sm-12 submit-btn">
								<button type="submit" class="submit">Subscribe</button>
								<span id="loader"><i
									class="fa fa-refresh fa-spin fa-3x fa-fw"></i></span>
							</div>
							<div class="col col-md-12 success-error-message">
								<div id="success">Thank you, you have subscribed
									successfully !!</div>
								<div id="error">Error occurred while sending email. Please
									try again later.</div>
							</div>
						</form>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end rsvp-section -->


		<!-- start getting-there-section -->
		<section class="getting-there-section section-padding">
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<div class="section-title-white">
							<div class="vertical-line">
								<span><i class="fi flaticon-two"></i></span>
							</div>
							<h2>Getting there</h2>
						</div>
					</div>
				</div>
				<!-- end section-title -->

				<div class="row content">
					<div class="col col-md-6">
						<h3>Transportation</h3>
						<p>Hyderabad is well connected via all means of transport.
							Rajiv Gandhi International Airport is 40 Km away from the city
							and the venue. Secundarabad is the nearest railway station about
							15-20 Km from the venue.</p>
					</div>
					<div class="col col-md-6">
						<h3>Accommodations</h3>
						<p>Novotel Hyderabad</p>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end getting-there-section -->


		<!-- start gift-registration-section -->
		<!-- <section class="gift-registration-section section-padding">
            <div class="container">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="section-title">
                            <div class="vertical-line"><span><i class="fi flaticon-two"></i></span></div>
                            <h2>Gift registration</h2>
                        </div>
                    </div>
                </div> end section-title

                <div class="row content">
                    <div class="col col-lg-10 col-lg-offset-1">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, cupiditate, repudiandae. A ab sit laboriosam quis distinctio dignissimos, nemo cum sed hic, deleniti maiores rem iste labore commodi perferendis cumque.repudiandae. A ab sit laboriosam quis distinctio dignissimos, nemo cum sed hic.</p>

                        <div class="gif-registration-slider">
                            <div class="register">
                                <img src="images/gift/img-1.jpg" alt class="img img-responsive">
                            </div>
                            <div class="register">
                                <img src="images/gift/img-2.jpg" alt class="img img-responsive">
                            </div>
                            <div class="register">
                                <img src="images/gift/img-3.jpg" alt class="img img-responsive">
                            </div>
                            <div class="register">
                                <img src="images/gift/img-1.jpg" alt class="img img-responsive">
                            </div>
                            <div class="register">
                                <img src="images/gift/img-2.jpg" alt class="img img-responsive">
                            </div>
                        </div>
                    </div>
                </div> end row
            </div> end container
        </section> -->
		<!-- end gift-registration-section -->


		<!-- start footer -->
		<footer class="site-footer">
			<div class="back-to-top">
				<a href="#" class="back-to-top-btn"><span><i
						class="fi flaticon-cupid"></i></span></a>
			</div>
			<div class="container">
				<div class="row">
					<div class="col col-xs-12">
						<h2>Forever and Always Our Love</h2>
						<span>- Ankit & Deepali </span>
					</div>
				</div>
				<div class="row">
					<div class="col col-xs-12">
						<br> <span>Developed with love for these love birds <br>-
							<a href="https://www.vishwakumardeepak.com" target="_blank">Vishwa
								Kumar Deepak</a></span>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</footer>
		<!-- end footer -->

	</div>
	<!-- end of page-wrapper -->



	<!-- All JavaScript files
    ================================================== -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugins for this template -->
	<script src="js/jquery-plugin-collection.js"></script>
	<script src="js/spirit.js"></script>

	<!-- Custom script for this template -->
	<script src="js/script.js"></script>
</body>
</html>
