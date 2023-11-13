<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirm Bill</title>
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
              <form action="confirm-bill" method="post" id="returnForm" >
                       <div style="margin-top: 60px; text-align: center">
                           <h1 style="text-align: center;">Hóa đơn trả tài liệu</h1>
                           <p style="text-align: left;">Bạn đọc: ${member599.getName().toUpperCase()}</p>
                           <p style="text-align: left;">Nhân viên xử lí: ${admin.getName().toUpperCase()}</p>
                           <p style="text-align: left;">Tổng số tiền thanh toán: ${totalAmount} đ</p>
                           <p style="text-align: left;">Thời gian tạo hóa đơn: ${regis_date}</p>
                       </div>

                     <h3>Các chi tiết trả sách</h3>
                         <table class="table table-bordered text-center">
                                <thead style="background-color: green;color: white; ">
                                      <tr >
                                          <th scope="col">Mã chi tiết trả</th>
                                          <th scope="col">Mã phiếu mượn trả</th>
                                          <th scope="col">Mã tài liệu</th>
                                          <th scope="col">Ngày mượn</th>
                                          <th scope="col">Ngày trả thực tế</th>
                                          <th scope="col">Tiền phạt</th>
                                          <th scope="col">Lý do phạt</th>
                                      </tr>
                                  </thead>
                            <tbody>
                             <c:forEach var="returnDetail" items="${returnDetailsList}">
                                 <tr>
                                     <td>${returnDetail.getId()}</td>
                                     <td>${returnDetail.getBorrow_return_id()}</td>
                                     <td>${returnDetail.document599.id}</td>
                                     <td>${returnDetail.getBorrow_date()}</td>
                                     <td>${returnDetail.getActual_return_date()}</td>
                                     <td>${returnDetail.getFine_amount()}</td>
                                     <td>${returnDetail.getFine_reason()}</td>

                                 </tr>
                             </c:forEach>
                             </tbody>
                         </table>
                     <div class="d-flex justify-content-center" style="margin-bottom: 50px;">
                             <button type="submit" class="btn btn-success text-white">Xác nhận trả</button>
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