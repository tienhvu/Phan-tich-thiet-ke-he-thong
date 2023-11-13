<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bill list</title>
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

         <h3 style="text-align: center; margin-top: 76px;">Danh sách hóa đơn</h3>
                                 <table class="table table-bordered text-center">
                                        <thead style="background-color: green;color: white; ">
                                              <tr >
                                                  <th scope="col">Mã hóa đơn</th>
                                                  <th scope="col">Ngày tạo hóa đơn</th>
                                                  <th scope="col">Tổng tiền thanh toán</th>
                                                  <th scope="col">Nhân viên xử lý</th>
                                              </tr>
                                          </thead>
                                    <tbody>
                                     <c:forEach var="bill" items="${listBills}">
                                         <tr>
                                             <td>${bill.getId()}</td>
                                             <td>${bill.getRegis_date()}</td>
                                             <td>${bill.getTotal_amount()}</td>
                                             <td>${bill.getProcess_staff()}</td>
                                         </tr>
                                     </c:forEach>
                                     </tbody>
                                 </table>


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
