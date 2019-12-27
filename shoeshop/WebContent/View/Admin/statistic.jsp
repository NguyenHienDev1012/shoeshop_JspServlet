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
    <title>Thống kê</title>
    
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">
    
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="Template/Admin/assets/img/metis-tile.png" />
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/bootstrap/css/bootstrap.css">
    

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/css/main.css">
    
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/metismenu/metisMenu.css">
    
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.css">
    
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="Template/Admin/assets/lib/animate.css/animate.css">

    <!--For Development Only. Not required -->
    <script>
        less = {
            env: "development",
            relativeUrls: false,
            rootpath: "Template/Admin/assets/"
        };
    </script>
    <link rel="stylesheet" href="Template/Admin/assets/css/style-switcher.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>

  </head>
<body>
    <jsp:include page="adheader.jsp"></jsp:include>
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
		<strong style="color: red">10</strong>Truy cập hôm nay
		<span class="percent down"></span>
	    </div>
	</li>
	<li>
	    <div class="sparkline bar_week"></div>
	    <div class="stat_text">
		<strong style="color: orange">40</strong>Truy cập tuần này
		<span class="percent down"></span>
	    </div>
	</li>
	<li>
	    <div class="sparkline bar_week"></div>
	    <div class="stat_text">
		<strong style="color: pink">50</strong>Tổng truy cập
		<span class="percent down"> </span>
	    </div>
	</li>
	<li>
	    <div class="sparkline line_day"></div>
	    <div class="stat_text">
		<strong style="color: green">12</strong>Tổng khách hàng
		<span class="percent up"></span>
	    </div>
	</li>
	<li>
	    <div class="sparkline pie_week"></div>
	    <div class="stat_text">
		<strong style="color: blue">200</strong>Tổng sản phẩm
		<span class="percent"> </span>
	    </div>
	</li>
	<li>
	    <div class="sparkline stacked_month"></div>
	    <div class="stat_text">
		<strong style="color: purple">2</strong>Số lượng quản trị viên
		<span class="percent down"></span>
	    </div>
	</li>
    </ul>
</div>

<div class="row">
     <div class="col-lg-5">
     <div class="box" style="text-align: center;">
	    <header>
        <h5 style="margin-left: 5px"><b>Tổng quan đơn hàng</b></h5>
	    </header>
	     <p  style="margin-top: 50px;text-align: center;"> Tổng số đơn hàng tháng 9/2019</p>
	     <h1 style="margin-top: 20px;text-align: center;">50</h1>
	     <p style="margin-top: 90px;text-align: center; color: white; " >50</p>
     </div>
     </div>
    <div class="col-lg-7">
	<div class="box">
	    <header>
		<h5>Biểu đồ</h5>
	    </header>
	    <div class="body" id="trigo" style="height: 250px;">
	     <p><b>Đã giao:&nbsp;20</b></p>
	      <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
    </div>
  </div>
  <p><b>Đang giao:&nbsp;10</b></p>
  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
    </div>
  </div>
  <p><b>Chưa giao:&nbsp;25</b></p>
  <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
    </div>
  </div>
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
            </div>
            <!-- /#wrap -->
            <footer class="Footer bg-dark dker">
              <p>2019 &copy; Quản trị viên: Nguyễn Hiền && Trọng Nghĩa </p>	</footer>

            <!-- /#footer -->
  
            
            <!--jQuery -->
            <script src="Template/Admin/assets/lib/jquery/jquery.js"></script>

                    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.5/fullcalendar.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.18.4/js/jquery.tablesorter.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-sparklines/2.1.2/jquery.sparkline.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.selection.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.resize.min.js"></script>

            <!--Bootstrap -->
            <script src="Template/Admin/assets/lib/bootstrap/js/bootstrap.js"></script>
            <!-- MetisMenu -->
            <script src="Template/Admin/assets/lib/metismenu/metisMenu.js"></script>
            <!-- onoffcanvas -->
            <script src="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.js"></script>
            <!-- Screenfull -->
            <script src="Template/Admin/assets/lib/screenfull/screenfull.js"></script>


            <!-- Metis core scripts -->
            <script src="Template/Admin/assets/js/core.js"></script>
            <!-- Metis demo scripts -->
            <script src="Template/Admin/assets/js/app.js"></script>

             

        </body>

</html>