<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Publisher</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Base imports -->
		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/favicons/helio-favicon-32x32.png" rel="shortcut icon" type="image/png">
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/jquery/jquery-3.4.0.min.js"></script>
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/bootstrap/bootstrap.min.js"></script>
		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/helio.css" rel="stylesheet">



		<!-- Template imports -->
		
		
		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/yasr/codeMirror/codemirror.css" rel="stylesheet">
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasr/codeMirror/codemirror.js"></script>

		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/yasr/pivot/pivot.css">
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasr/pivot/pivot.min.js"></script>

		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/yasr/yasr.min.css" rel="stylesheet">
		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/yasqe/yasqe.min.css" rel="stylesheet">
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasr/yasr.min.js"></script>
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasr/yasr.bundled.min.js"></script>
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasqe/yasqe.bundled.min.js"></script>
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasqe/yasqe.min.js"></script>

		<link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/yasr/dataTables/jquery.dataTables.min.css" rel="stylesheet">
		<script src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/js/yasr/dataTables/jquery.dataTables.min.js"></script>
		
	</head>
	<body>
		<!-- Page Header -->
        <nav class="navbar navbar-light nav-color" >
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <!-- <a class="navbar-brand" href="#">Helio</a>-->
		      <a class="navbar-brand" href="#">
			    <img src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/img/favicon_io/favicon-32x32.png" width="30" height="30" alt="" style="margin-top: -5px">
			  </a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-right">
		        <!--<li><a href="/resources">Resources</a></li>-->
		        <li><a href="/sparql" class="active nav-active" >SPARQL</a></li>
		        <li><a href="/resources">Dump</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>

		<!-- Page Content -->
		<main role="main">
			<div class="container">	

				<div class="row">
           			<div class="col-md-12">
						<div id="yasqe-div"></div>
						<div id="yasr-div"></div>
						<script type="text/javascript">
						var pathname = window.location.pathname;
						console.log(pathname);
						var pathname = "/api/sparql";
						var yasqe = YASQE(document.getElementById("yasqe-div"), {
							sparql: {
								showQueryButton: true,
								endpoint: pathname,
								requestMethod: "GET"
							}
						});
						var yasr = YASR(document.getElementById("yasr-div"), {
							// This prettifies the URLs in the response
							getUsedPrefixes: yasqe.getPrefixesFromQuery
						});
						// Link yasqe and wasr
						yasqe.options.sparql.callbacks.complete = yasr.setResponse;
					</script>
					</div>
				</div>
			</div>	
		</main>
		
	</body>
</html>