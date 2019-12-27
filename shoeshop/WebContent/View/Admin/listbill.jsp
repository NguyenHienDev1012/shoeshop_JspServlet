<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="cartDaoImpl" class="dao.CartDaoImpl" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--IE Compatibility modes-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách đơn hàng</title>

<meta name="description"
	content="Free Admin Template Based On Twitter Bootstrap 3.x">
<meta name="author" content="">

<meta name="msapplication-TileColor" content="#5bc0de" />
<meta name="msapplication-TileImage"
	content="Template/Admin/assets/img/metis-tile.png" />

<!-- Bootstrap -->
<link rel="stylesheet" href="Template/Admin/assets/lib/bootstrap/css/bootstrap.css">
<!-- Font Awesome -->

<!-- Metis core stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/css/main.css">

<!-- metisMenu stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/lib/metismenu/metisMenu.css">

<!-- onoffcanvas stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/lib/onoffcanvas/onoffcanvas.css">

<!-- animate.css stylesheet -->
<link rel="stylesheet" href="Template/Admin/assets/lib/animate.css/animate.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



<!--For Development Only. Not required -->
<link rel="stylesheet"
	href="Template/Admin/assets/css/style-switcher.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>
	 <script type="text/javascript">
	   		function billdetails(x) {
				var session = '<%=(String)session.getAttribute("sessionAdmin")%>';
		   		  
				}
    </script>

</head>
<body>
	<jsp:include page="adheader.jsp"></jsp:include>


	</div>
	<!-- /#left -->
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
								<h3 style="color: #dc3545; margin-left: 20px">Danh sách đơn
									hàng</h3>
								<c:choose>
									<c:when test="${not empty messageAdminActionBill}">
										<h4 style="color: red; margin-left: 20px">${messageAdminActionBill}</h4>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>

							</header>
							<div id="collapse4" class="body">
								<a class="btn btn-success" href="AdminAddUser"><i
									class="glyphicon glyphicon-plus"></i>&nbsp; Thêm</a> <a
									class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-import"></i>&nbsp; Import </a> <a
									class="btn btn-success" href="#"><i
									class="glyphicon glyphicon-export"></i>&nbsp; Export </a>
								<table style="margin-top: 12px" id="dataTable"
									class="table table-bordered table-condensed table-hover table-striped">
									<thead>
										<tr>
											<th>Mã</th>
											<th>Tên khách hàng</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											<th>Địa chỉ</th>
											<th>Ghi chú</th>
											<th title="Hình thức thanh toán">HTTT</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listBill}" var="bill">
											<tr>
												<td>${bill.iDBill}</td>
												<td>${bill.name}</td>
												<td>${bill.numberPhone}</td>
												<td>${bill.email}</td>
												<td>${bill.address}</td>
												<td>${bill.note}</td>
												<td>${bill.payment}</td>
												
												<td>
													<button class="btn btn-info" type="button"  data-toggle="modal"
									                 	data-target="#myModal${bill.iDBill}"  style="color: white"> <i class="glyphicon glyphicon-info-sign"></i>&nbsp; Chi tiết</button> 
													  
													  <!-- Modal bill details -->
											<div class="modal fade" id="myModal${bill.iDBill}" role="dialog">
										    <div class="modal-dialog"  style="width: 700px;">
										      <!-- Modal content-->
										      <div class="modal-content" style="margin-top: 40px">
										       <div class="modal-header">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										          <h4 class="modal-title">Chi tiết hóa đơn</h4>
										        </div>
										        <div class="modal-body">
												 <table style="margin-top: 5px" id="dataTable"
												class="table table-bordered table-condensed table-hover table-striped">
												<thead>
												<tr>Thông tin đơn hàng:</tr>
													<tr>
														<th title="Mã sản phẩm">Mã SP</th>
														<th>Tên</th>
														<th>Hình ảnh</th>
														<th>Số lượng</th>
														<th>Giá</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${bill.listItemInBill}" var="item"  >
																<tr>
																   <td>${item.product.id}</td>
																	<td>${item.product.name}</td>
																	<td><img src="Image/${item.product.images}" alt="Hình ảnh"
																		style="width: 80px"></td>
																	<td>${item.quantity}</td>	
																	<td><fmt:formatNumber
																			value="${item.product.price*item.quantity}" type="number"
																			minFractionDigits="0" /> Vnđ </td>
																</tr>
														</c:forEach>
														<tr><td>
																<b>Tổng cộng:</b> &nbsp; &nbsp;
																<fmt:formatNumber value="${cartDaoImpl.totalPriceOfCart(bill.listItemInBill)}"
																	type="number" minFractionDigits="0" /> Vnđ</td></tr>
																</tbody>
												
															</table>
															        </div>
															        <div class="modal-footer">
																	 <button  class="btn btn-warning"type="button" class="btn btn-default" data-dismiss="modal" style="color: #fff;"><i class="fa fa-remove"></i>&nbsp;Hoàn tất</button>
															       </div>
															      </div>
															    </div>
															  </div>
															  <!-- End modal bill detail -->
											
													
													<!--  <a class="btn btn-danger" href="AdminRemoveBill?id_bill=${bill.iDBill}"><i
														class="glyphicon glyphicon-remove"></i>&nbsp; Xoá</a> -->
												</td>
											</tr>
									
											
                               </c:forEach>	
                               


									</tbody>
								</table>
							
								<p><b>Lưu ý:</b></p>
							    <p>       1. Thanh toán khi giao hàng (COD) </p>
								<p>       2. Chuyển khoản ngân hàng </p>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				     	
                               
				<!--End Datatables-->
			</div>
			<!-- /.inner -->
		</div>
		<!-- /.outer -->
	</div>
	<!-- /#content -->
	  
	<!-- /#content -->
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