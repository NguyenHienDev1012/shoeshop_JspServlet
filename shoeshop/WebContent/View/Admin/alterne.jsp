<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Alterne</title>
    
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">
    
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/bootstrap/css/bootstrap.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/font-awesome/css/font-awesome.css">
    
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/css/main.css">
    
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/metismenu/metisMenu.css">
    
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.css">
    
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/animate.css/animate.css">



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

    <!--For Development Only. Not required -->
    <script>
        less = {
            env: "development",
            relativeUrls: false,
            rootpath: "Template/Admin/assets/"
        };
    </script>
    <link rel="stylesheet" href="Template/Admin/assets/css/style-switcher.css">
    <link rel="stylesheet/less" type="text/css" href="Template/Admin/assets/less/theme.less">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>

  </head>
	<body>
  <jsp:include page="adheader.jsp"></jsp:include>
                                  
                        <!-- /#menu -->
                    </div>
                    <!-- /#left -->
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <div class="text-center">
    <ul class="stats_box">
	<li>
	    <div class="sparkline bar_week"></div>
	    <div class="stat_text">
		<strong>2.345</strong>Weekly Visit
		<span class="percent down"> <i class="fa fa-caret-down"></i> -16%</span>
	    </div>
	</li>
	<li>
	    <div class="sparkline line_day"></div>
	    <div class="stat_text">
		<strong>165</strong>Daily Visit
		<span class="percent up"> <i class="fa fa-caret-up"></i> +23%</span>
	    </div>
	</li>
	<li>
	    <div class="sparkline pie_week"></div>
	    <div class="stat_text">
		<strong>$2 345.00</strong>Weekly Sale
		<span class="percent"> 0%</span>
	    </div>
	</li>
	<li>
	    <div class="sparkline stacked_month"></div>
	    <div class="stat_text">
		<strong>$678.00</strong>Monthly Sale
		<span class="percent down"> <i class="fa fa-caret-down"></i> -10%</span>
	    </div>
	</li>
    </ul>
</div>
<hr>
<div class="text-center">

    <a class="quick-btn" href="#">
	<i class="fa fa-bolt fa-2x"></i>
	<span>default</span>
	<span class="label label-default">2</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-check fa-2x"></i>
	<span>danger</span>
	<span class="label label-danger">2</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-building-o fa-2x"></i>
	<span>No Label</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-envelope fa-2x"></i>
	<span>success</span>
	<span class="label label-success">-456</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-signal fa-2x"></i>
	<span>warning</span>
	<span class="label label-warning">+25</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-external-link fa-2x"></i>
	<span>π</span>
	<span class="label btn-metis-2">3.14159265</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-lemon-o fa-2x"></i>
	<span>é</span>
	<span class="label btn-metis-4">2.71828</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-glass fa-2x"></i>
	<span>φ</span>
	<span class="label btn-metis-3">1.618</span>
    </a>

</div>
<hr>
<div class="row">
    <div class="col-lg-8">
	<div class="box">
	    <header>
		<h5>Line Chart</h5>
	    </header>
	    <div class="body" id="trigo" style="height: 250px;"></div>
	</div>
    </div>
    <div class="col-lg-4">
	<div class="box">
	    <div class="body">
		<table class="table table-condensed table-hovered sortableTable">
		    <thead>
			<tr>
			    <th>Country <i class="fa fa-sort"></i><i class="fa fa-sort-asc"></i><i class="fa fa-sort-desc"></i></th>
			    <th>Visit <i class="fa fa-sort"></i><i class="fa fa-sort-asc"></i><i class="fa fa-sort-desc"></i></th>
			    <th>Time <i class="fa fa-sort"></i><i class="fa fa-sort-asc"></i><i class="fa fa-sort-desc"></i></th>
			</tr>
		    </thead>
		    <tbody>
			<tr class="active">
			    <td>Andorra</td>
			    <td>1126</td>
			    <td>00:00:15</td>
			</tr>
			<tr>
			    <td>Belarus</td>
			    <td>350</td>
			    <td>00:01:20</td>
			</tr>
			<tr class="danger">
			    <td>Paraguay</td>
			    <td>43</td>
			    <td>00:00:30</td>
			</tr>
			<tr class="warning">
			    <td>Malta</td>
			    <td>547</td>
			    <td>00:10:20</td>
			</tr>
			<tr>
			    <td>Australia</td>
			    <td>560</td>
			    <td>00:00:10</td>
			</tr>
			<tr>
			    <td>Kenya</td>
			    <td>97</td>
			    <td>00:20:00</td>
			</tr>
			<tr class="success">
			    <td>Italy</td>
			    <td>2450</td>
			    <td>00:10:00</td>
			</tr>
		    </tbody>
		</table>
	    </div>
	</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-lg-12">
	<div class="box">
	    <header>
		<h5>Calendar</h5>
	    </header>
	    <div id="calendar_content" class="body">
		<div id='calendar'></div>
	    </div>
	</div>
    </div>
</div>

                        </div>
                        <!-- /.inner -->
                    </div>
                    <!-- /.outer -->
                </div>
                <!-- /#content -->

                    <div id="right" class="onoffcanvas is-right is-fixed bg-light" aria-expanded=false>
                        <a class="onoffcanvas-toggler" href="#right" data-toggle=onoffcanvas aria-expanded=false></a>
                        <br>
                        <br>
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Warning!</strong> Best check yo self, you're not looking too good.
                        </div>
                        <!-- .well well-small -->
                        <div class="well well-small dark">
                            <ul class="list-unstyled">
                                <li>Visitor <span class="inlinesparkline pull-right">1,4,4,7,5,9,10</span></li>
                                <li>Online Visitor <span class="dynamicsparkline pull-right">Loading..</span></li>
                                <li>Popularity <span class="dynamicbar pull-right">Loading..</span></li>
                                <li>New Users <span class="inlinebar pull-right">1,3,4,5,3,5</span></li>
                            </ul>
                        </div>
                        <!-- /.well well-small -->
                        <!-- .well well-small -->
                        <div class="well well-small dark">
                            <button class="btn btn-block">Default</button>
                            <button class="btn btn-primary btn-block">Primary</button>
                            <button class="btn btn-info btn-block">Info</button>
                            <button class="btn btn-success btn-block">Success</button>
                            <button class="btn btn-danger btn-block">Danger</button>
                            <button class="btn btn-warning btn-block">Warning</button>
                            <button class="btn btn-inverse btn-block">Inverse</button>
                            <button class="btn btn-metis-1 btn-block">btn-metis-1</button>
                            <button class="btn btn-metis-2 btn-block">btn-metis-2</button>
                            <button class="btn btn-metis-3 btn-block">btn-metis-3</button>
                            <button class="btn btn-metis-4 btn-block">btn-metis-4</button>
                            <button class="btn btn-metis-5 btn-block">btn-metis-5</button>
                            <button class="btn btn-metis-6 btn-block">btn-metis-6</button>
                        </div>
                        <!-- /.well well-small -->
                        <!-- .well well-small -->
                        <div class="well well-small dark">
                            <span>Default</span><span class="pull-right"><small>20%</small></span>
                        
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-info" style="width: 20%"></div>
                            </div>
                            <span>Success</span><span class="pull-right"><small>40%</small></span>
                        
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                            </div>
                            <span>warning</span><span class="pull-right"><small>60%</small></span>
                        
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-warning" style="width: 60%"></div>
                            </div>
                            <span>Danger</span><span class="pull-right"><small>80%</small></span>
                        
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-danger" style="width: 80%"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /#right -->
            </div>
            <!-- /#wrap -->
            <footer class="Footer bg-dark dker">
                <p>2017 &copy; Metis Bootstrap Admin Template v2.4.2</p>
            </footer>
            <!-- /#footer -->
            <!-- #helpModal -->
            <div id="helpModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                                et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                                culpa qui officia deserunt mollit anim id est laborum.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- /#helpModal -->
            <!--jQuery -->
            <script src="Template/Admin/assets/lib/jquery/jquery.js"></script>

                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

            <!--Bootstrap -->
            <script src="Template/Admin/assets/lib/bootstrap/js/bootstrap.js"></script>
            <!-- MetisMenu -->
            <script src="Template/Admin/assets/lib/metismenu/metisMenu.js"></script>
            <!-- onoffcanvas -->
            <script src="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.js"></script>
            <!-- Screenfull -->
            <script src="Template/Admin/assets/lib/screenfull/screenfull.js"></script>

                    <script src="Template/Admin/assets/lib/fullcalendar/fullcalendar.min.js"></script>
                    <script src="Template/Admin/assets/lib/jquery.tablesorter/jquery.tablesorter.min.js"></script>
                    <script src="Template/Admin/assets/lib/jquery.sparkline.min/index.js"></script>
                    <script src="Template/Admin/assets/lib/flot/jquery.flot.js"></script>
                    <script src="Template/Admin/assets/lib/flot/jquery.flot.selection.js"></script>
                    <script src="Template/Admin/assets/lib/flot/jquery.flot.resize.js"></script>

            <!-- Metis core scripts -->
            <script src="Template/Admin/assets/js/core.js"></script>
            <!-- Metis demo scripts -->
            <script src="Template/Admin/assets/js/app.js"></script>


        </body>

</html>