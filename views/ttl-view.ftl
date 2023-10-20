<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Publisher</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Base imports -->
    <link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/favicons/helio-favicon-32x32.png" rel="shortcut icon" type="image/png">
    
    <!-- Boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!-- Font -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Leckerli+One" />
    <style>
		  html, body {
		  	height: 100%;
			}
    </style>
  </head>

<body class="d-flex flex-column h-100">
    <!-- Page Header -->
    <header class="navbar navbar-dark sticky-top flex-md-nowrap p-0 shadow" style="background-color: #e3f2fd;">
	  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">
	    <img src="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/img/favicon_io/favicon-32x32.png" alt="Helio logo" style="margin-top:5px;"/>
	  </a>
	  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="navbar-nav">
	    <div class="nav-item text-nowrap">
	      
	    </div>
	  </div>
	</header>

    <!-- Page Content -->
      	<main class="flex-shrink-0">
	      	<div class="container" style="margin-top:30px"> 
	      		<div class="row" style="margin-bottom:30px">
	   				
	      		<div class="col-10">
		   				<div class="btn-group" role="group">
							  <button id="numDP" disabled type="button" class="btn" style="border-color: #2e6da4">Values</button>
							  <button id="numDPT" disabled type="button" class="btn" style="border-color: #2e6da4">Typed values</button>
							  <button id="numDPL" disabled type="button" class="btn" style="border-color: #2e6da4">Lang values</button>
							  <button id="numOP" disabled type="button" class="btn" style="border-color: #2e6da4">Relationships</button>
							</div>
						</div>
						<div class="col-2">
						<div class="btn-group" role="group">
						  <button type="button" style="background-color: #337ab7; border-color: #2e6da4; color:white" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						    Download
						  </button>
						  <ul class="dropdown-menu">						   
		                  <li><a href="#" class="dropdown-item" onclick="downloadResource(window.location.pathname, 'text/turtle', 'data.ttl', 1)">TURTLE</a></li>
		                  <li><a href="#" class="dropdown-item" onclick="downloadResource(window.location.pathname, 'text/ntriples', 'data.nt', 1)">N-TRIPLES</a></li>
		                  <li><a href="#" class="dropdown-item" onclick="downloadResource(window.location.pathname,'application/rdf+xml', 'data.xml',2)" type="">RDF/XML</a></li>
		                  <li><a href="#" class="dropdown-item" onclick="downloadResource(window.location.pathname, 'application/json', 'data.json', 3)" type="">JSON-LD</a></li>
		     
						  </ul>
						</div>
						</div>
	 					</div>
	 					<div class="row" style="margin-bottom:30px">
	      		<div class="table-responsive" style="margin-top:30px">
	            <table id="dtBasicExample" class="table table-striped align-middle" id="dtBasicExample">
	              <thead>
	                <tr>
	                  <th class="th-sm">Subject</th>
	                  <th class="th-sm">Predicate</th>
	                  <th class="th-sm">Object</th>
	                </tr>
	              </thead>
		              <tbody>
		                
		                
		              </tbody>
	            	</table>
	          </div>
	      		</div>
	      	</div>
      	</main>

    <!-- Footer section -->
    <footer class="footer mt-auto py-3 bg-light" style="position: inherit-absolute;  bottom: 0; width:100%; margin-top:100%;">
	  <div class="container" style="text-align: center">
	    <span class="text-muted">The Publisher is part of the <a href="https://helio-ecosystem.github.io/helio-ecosystem/" style='font-family: "Leckerli One"'>Helio Ecosystem</a>.</span>
	  </div>
	</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- Tables-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.12.1/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.12.1/datatables.min.js"></script>
<!-- Select with search -->
<link rel="stylesheet" href="https://unpkg.com/@jarstone/dselect/dist/css/dselect.css">
<script src="https://unpkg.com/@jarstone/dselect/dist/js/dselect.js"></script>
<!-- Charts -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- RDF handling -->
<script src="https://unpkg.com/n3/browser/n3.min.js"></script>
<script>
	// smart table init
	$(document).ready(function () {
      $('#dtBasicExample').DataTable({
          "order": [[0, 'desc']],
          "pagingType": "simple",
          "searching": true
      });
      $('.dataTables_length').addClass('bs-select');
  });
	// RDF parsing and injection
	const parser = new N3.Parser({ format: 'turtle' });
	parser.parse(`${data?j_string}`, (error, quad, prefixes) => {
    try {
    console.log(quad);
    if (quad){
      console.log(quad);
      var subjectV = "<a href=\""+quad.subject.value.trim()+"\" >"+quad.subject.value.trim()+"</a>";
      var predicateV = "<a href=\""+quad.predicate.value.trim()+"\" >"+quad.predicate.value.trim()+"</a>";
      var objectV = "";
      var isLiteral  = quad.object.termType == "Literal";
      var isLangLiteral = isLiteral && quad.object.language;
      var isTypedLiteral = isLiteral && !isLangLiteral && quad.object.datatypeString;
      var isOp = !isLiteral;
      if(isLiteral){
        objectV = "\""+quad.object.value.trim()+"\"";
        if(isLangLiteral){
      		objectV += "&nbsp;<span class=\"badge bg-warning text-dark\">@"+quad.object.language+"</span>";
        }else if(quad.object.datatypeString)
      		objectV += "&nbsp;<span class=\"badge bg-danger text-dark\">"+quad.object.datatypeString.replace('http://www.w3.org/2001/XMLSchema#','xsd:')+"</span>";
      }else{
       	objectV = "<a href=\""+quad.object.value.trim()+"\" >"+quad.object.value.trim()+" </a>";
      }
      var name = "op";
      if(isLangLiteral){
      	name = "dpl";
      }else if(isTypedLiteral){
      	name = "dpt";
      }else if(isLiteral){
      	name = "dp";
      }
      var newRow = "<tr name=\""+name+"\"><td>"+subjectV+"</td><td>"+predicateV+"</td><td>"+objectV+"</td></tr>";
	  	$("#dtBasicExample tbody").append(newRow); 
    } else{
      console.log("Error with triple: "+error);
      var numDPL = document.getElementsByName('dpl').length;
      var numDPT = document.getElementsByName('dpt').length;
      var numDP = document.getElementsByName('dp').length + numDPT + numDPL;
      var numOP = document.getElementsByName('op').length;

      $("#numDP").html('Values ('+numDP+')');
      $("#numDPT").html('Typed values ('+numDPT+')');
      $("#numDPL").html('Lang values ('+numDPL+')');
      $("#numOP").html('Relations ('+numOP+')');
    }
    
    } catch (error) {
  		console.error("Exception ocurred: " +error);
    }
  });

  // Download script
  function downloadResource(inputUrl, format, fileName, parsingType) {
            $.ajax({
                url: inputUrl,
                type: "GET",
                headers: {
                    "Accept": format
                },
                success: function (data) {
       
                    var parsedData;
                    if(parsingType == 1)
                      parsedData = data;
                    if(parsingType == 2)
                      parsedData = xmlToString(data);
                    if(parsingType == 3)
                      parsedData= JSON.stringify(data);

                    var element = document.createElement('a');
                    element.setAttribute('href', 'data:'+format+',' + encodeURIComponent(parsedData));
                    element.setAttribute('download', fileName);

                    element.style.display = 'none';
                    document.body.appendChild(element);

                    element.click();

                    document.body.removeChild(element);
                },
                error: function (jqxhr, textStatus, errorThrown) {
                  console.log(textStatus, errorThrown)
                }
            });
        }
        
        function xmlToString(xmlData) { 

          var xmlString;
          //IE
          if (window.ActiveXObject){
              xmlString = xmlData.xml;
          }
          // code for Mozilla, Firefox, Opera, etc.
          else{
              xmlString = (new XMLSerializer()).serializeToString(xmlData);
          }
          return xmlString;
      }  
   

</script>
</html>