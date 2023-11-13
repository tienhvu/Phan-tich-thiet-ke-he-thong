<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Print Bill</title>
  <link rel="stylesheet" href="css/admin/search.css" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
             rel="stylesheet"
             integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
             crossorigin="anonymous">


</head>
 <body>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="header nav-item text-center"  style="margin-right:20px;">
                    <a href="admin-home" class="text-decoration-none text-reset">
                         <div class="d-flex align-items-center">
                             <img src="img/home.png" style="margin-right: 5px; transform: translateY(-2px);"> Home
                         </div>
                    </a>
                </li>
              </ul>

              <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link btn btn-light text-center" >
                    <img src="img/user.png">
                    ${sessionScope.username}
                  </a>
                </li>

                <li class="nav-item">
                   <a class="nav-link btn btn-light text-center" href="#" onclick="confirmLogout()">
                     <img src="img/logout.png">
                     Đăng xuất
                   </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>


        <div class="container mt-4">
              <form action="print-bill" method="post" id="returnForm" >
                       <div style="margin-top: 60px; text-align: center">
                       <c:if test="${not empty sessionScope.success}">
                                           <div class="alert alert-success">${sessionScope.success}</div>
                                           <%
                                               session.removeAttribute("success");
                                           %>
                                       </c:if>
                           <h1 style="text-align: center;">Hóa đơn trả tài liệu</h1>
                           <p style="text-align: left;">ID hóa đơn: ${confirmBill599.getId()}</p>
                           <p style="text-align: left;">Tổng tiền thanh toán: ${confirmBill599.getTotal_amount()} đ</p>
                           <p style="text-align: left;">Thời gian tạo hóa đơn: ${confirmBill599.getRegis_date()}</p>
                           <p style="text-align: left;">Nhân viên xử lí: ${admin.getName().toUpperCase()}</p>
                       </div>

                     <div class="d-flex justify-content-center" style="margin-bottom: 50px;">
                             <button type="submit" class="btn btn-success text-white">In phiếu</button>
                     </div>
              </form>

            </div>


    <footer>
        <div class="footer__bottom">
                <p class="footer__text">
                  &copy; 2023 - B20DCCN599
                </p>
              </div>
    </footer>

<script>
    function confirmLogout() {
        var result = confirm("Bạn có chắc chắn muốn đăng xuất?");
        if (result) {

            window.location.href = "logout";
        }
    }


</script>
 </body>
 </html>