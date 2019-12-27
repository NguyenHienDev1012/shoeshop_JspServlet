<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--IE Compatibility modes-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách thông tin sản phẩm</title>

<meta name="description"
	content="Free Admin Template Based On Twitter Bootstrap 3.x">
<meta name="author" content="">

<meta name="msapplication-TileColor" content="#5bc0de" />
<meta name="msapplication-TileImage"
	content="Template/Admin/assets/img/metis-tile.png" />

<!-- Bootstrap -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/bootstrap/css/bootstrap.css">

<!-- Font Awesome -->

<!-- Metis core stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/css/main.css">

<!-- metisMenu stylesheet -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/metismenu/metisMenu.css">

<!-- onoffcanvas stylesheet -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.css">

<!-- animate.css stylesheet -->
<link rel="stylesheet"
	href="Template/Admin/assets/lib/animate.css/animate.css">


<!--For Development Only. Not required -->
<script>
	less = {
		env : "development",
		relativeUrls : false,
		rootpath : "Template/Admin/assets/"
	};
</script>
<link rel="stylesheet"
	href="Template/Admin/assets/css/style-switcher.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="Template/Front/js/jquery.twbsPagination.js" type="text/javascript"></script>

</head>
<body>
	<jsp:include page="adheader.jsp"></jsp:include>


	</div>
	<!-- /#left -->
	<div id="content">
		<div class="outer">
			<div class="inner bg-light lter">
				<!--Begin Datatables-->
				<div class="row">
					<div class="col-lg-12">
						<div class="box">
							<header>
								<div class="icons">
									<i class="fa fa-table"></i>
								</div>
								<h3 style="color: #dc3545; margin-left: 20px">Danh sách
									thông tin sản phẩm</h3>
						  <c:choose>
 				 			 <c:when test="${not empty messageAdminActionProduct}"><h4 style="color: red; margin-left: 20px">${messageAdminActionProduct}</h4></c:when> 
   							  <c:otherwise></c:otherwise> 
               			   </c:choose>

							</header>
							<div id="collapse4" class="body">
							
								<a class="btn btn-success" href="AdminAddProduct"><i
									class="glyphicon glyphicon-plus"></i>&nbsp; Thêm </a>
								<a class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-import"></i>&nbsp; Import </a>
						        <a class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-export"></i>&nbsp; Export </a>
								<table style="margin-top: 12px" id="dataTable"
									class="table table-bordered table-condensed table-hover table-striped">
									<thead>
										<tr>
											<th>Mã</th>
											<th>Tên</th>
											<th>Hình ảnh</th>
											<th>Giá</th>  
											<th>Giảm giá</th>
											<th>Số lượng</th>
											<th>Mô tả</th>
											<th>Yêu thích</th>
											<th>Mã loại</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listProduct}" var="product">
											<tr class="contentPage">
												<td>${product.id}</td>
												<td>${product.name}</td>
												<td><img alt="Hình ảnh sản phẩm"
													src="Image/${product.images}" width="80px"></td>
										     	<td><fmt:formatNumber value="${product.price}" type = "number" minFractionDigits = "0"/> Vnđ</td>
												<td>${product.sale}</td>
												<td>${product.quantity}</td>
												<td>${product.description}</td>
												<td>${product.tymNumber}</td>
												<td>${product.id_Category}</td>
												<td><a class="btn btn-primary" href="AdminEditInfoProduct?id_product=${product.id}"><i
														class="glyphicon glyphicon-edit"></i>&nbsp; Sửa</a> <br>
												<br> <a class="btn btn-danger"
													href="AdminRemoveProduct?id_product=${product.id}"><i
														class="glyphicon glyphicon-remove"></i>&nbsp;Xoá</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination" id="pagination" style="margin-left: 400px">  </ul>
							</div>
						</div>
					</div>
				</div>
				<!--End Datatables-->
			</div>
			<!-- /.inner -->
		</div>
		<!-- /.outer -->
	</div>
	<!-- /#content -->
	<script type="text/javascript">
            $(function () {
                var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = 30; // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);
				
                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
	</div>
	<!-- /#wrap -->
	<footer class="Footer bg-dark dker">
		<p>2019 &copy; Quản trị viên: Nguyễn Hiền && Trọng Nghĩa</p>
	</footer>
	<!-- /#footer -->

	<!--jQuery -->
	<script src="assets/lib/jquery/jquery.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.6/js/jquery.tablesorter.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

	<!--Bootstrap -->
	<script src="Temlate/Admin/assets/lib/bootstrap/js/bootstrap.js"></script>
	<!-- MetisMenu -->
	<script src="Temlate/Admin/assets/lib/metismenu/metisMenu.js"></script>
	<!-- onoffcanvas -->
	<script src="Temlate/Admin/assets/lib/onoffcanvas/onoffcanvas.js"></script>
	<!-- Screenfull -->
	<script src="Temlate/Admin/assets/lib/screenfull/screenfull.js"></script>


	<!-- Metis core scripts -->
	<script src="Temlate/Admin/assets/js/core.js"></script>
	<!-- Metis demo scripts -->
	<script src="Temlate/Admin/assets/js/app.js"></script>


</body>
</html>