<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Collaborhack</title>

    <!-- Bootstrap Core CSS -->
    <link href="/css/agency/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/css/agency/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="css/agency/css/agency.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"
            integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY"
            crossorigin="anonymous"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"
            integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo"
            crossorigin="anonymous"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">Collaborhack</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a class="page-scroll" href="#contact">Register</a>
                </li>
                <li>
                    <a class="page-scroll" href="/FindMatch.jsp">Find your Match</a>
                </li>
                <li>
                    <a class="page-scroll" href="/sources.jsp">Sources</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">Collaborhack!</div>
            <div class="intro-heading">Hosted on Azure!</div>
            <a href="#contact" class="page-scroll btn btn-xl">Register</a>
        </div>
    </div>
</header>


<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Add your information!</h2>
                <h3 class="section-subheading text-muted">We need your name and location.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form name="register" id="registerForm" action="posting.jsp" method="POST" novalidate>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your First Name *" name="first_name" id="first_name" required data-validation-required-message="Please enter your first name.">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your Last Name *" name="last_name" id="last_name" required data-validation-required-message="Please enter your last name.">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Your Email *" name="email" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select class="form-control" name="state" id="state" required data-validation-required-message="Please choose your state">
                                    <%
                                        InputStream stateInput = application.getResourceAsStream("/res/states.csv");
                                        try {
                                            if (stateInput == null) {
                                                response.setStatus(response.SC_NOT_FOUND);
                                            } else {
                                                BufferedReader br = new BufferedReader((new InputStreamReader(stateInput)));
                                                String data;
                                                while ((data = br.readLine()) != null) {
                                                    String[] breakup = data.split(",");
                                                    out.println("<option value=\"" + breakup[0] + "\">" + breakup[1] + "</option><br>");
                                                }
                                            }
                                        } catch (IOException e) {
                                            //out.println(e.getMessage());
                                        }

                                    %>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="What are you trying to hack? Enter a comma seperated list *"
                                          name="framework" id="message" required data-validation-required-message="Please provide a description about what you're trying to hack."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-12 text-center">
                            <div id="success"></div>
                            <button type="submit" class="btn btn-xl">Add</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="/css/agency/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/css/agency/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
        integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
        crossorigin="anonymous"></script>

<!-- Contact Form JavaScript -->
<script src="/css/agency/js/jqBootstrapValidation.js"></script>
<script src="/css/agency/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="/css/agency/js/agency.min.js"></script>

</body>
</html>
