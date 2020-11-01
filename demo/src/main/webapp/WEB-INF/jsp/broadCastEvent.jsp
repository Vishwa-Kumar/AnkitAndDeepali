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
<title>Broadcast Event</title>


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

	<script src="js/jquery.min.js"></script>
	<style>
	.rsvp-section:after {
    content: "";
    background-color: rgb(0 0 0 / 81%);
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
}
	</style>
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
							<h2>Send Event Details</h2>
						</div>
					</div>
				</div>
				<!-- end section-title -->

				<div class="row content">
					<div class="col col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<p>Notify guest about the events</p>
						<form id="event-form" class="form validate-rsvp-form row"
							method="post">
							<div class="col col-sm-6">
								<input type="text" name="eventName" class="form-control"
									placeholder="Event Name*">
							</div>
							<div class="col col-sm-6">
								<input type="date" name=date class="form-control"
									placeholder="date*">
							</div>
							  
									<div class="col col-sm-6">
								<input type="time" name="startTime" class="form-control"
									placeholder="start time*">
							
                            </div> 
                            		<div class="col col-sm-6">
								<input type="time" name="endTime" class="form-control"
									placeholder="end time*">
							
                            </div>
						     
							 <div class="col col-sm-12">
                                <textarea class="form-control" name="message" placeholder="Your Message*"></textarea>
                            </div> 
							<div class="col col-sm-12 submit-btn">
								<button type="submit" class="submit">Send</button>
								<span id="loader"><i
									class="fa fa-refresh fa-spin fa-3x fa-fw"></i></span>
							</div>
							<div class="col col-md-12 success-error-message">
								<div id="success">Thank you, Message sent !!</div>
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


	</div>
	

	<script src="js/bootstrap.min.js"></script>

	<!-- Plugins for this template -->
	<script src="js/jquery-plugin-collection.js"></script>
	<script src="js/spirit.js"></script>

	<!-- Custom script for this template -->
	<script src="js/script.js"></script>
</body>
</html>
