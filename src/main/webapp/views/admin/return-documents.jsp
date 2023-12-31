<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Return Documents</title>
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
                <li class="header nav-item text-center">
                    <a  class="text-decoration-none text-reset">
                          <div class="d-flex align-items-center">

                                  <img src="img/payment-method.png" style="width: 21px ; height: 21px; margin-right: 5px; transform: translateY(-2px);" alt="">Trả tài liệu
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

    <div class="search-container">
            <div class="search-box">
                 <form action="return-documents" method="post">
                        <input type="number" name="cardId" value ="${cardId}" class="search-input" required placeholder="Tìm kiếm theo mã thẻ bạn đọc">
                        <button type="submit" class="search-button">Tìm</button>
                    </form>
            </div>
    </div>
    <div class="container mt-4">
        <%-- Kiểm tra xem danh sách có tồn tại hay không --%>
        <c:if test="${not empty lists}">
              <form action="return-document-bills" method="post" id="returnForm" >
                     <table class="table table-bordered text-center">
                                 <thead style="background-color: green;color: white; ">
                                     <h3> Bạn đọc: ${member599.getName().toUpperCase()}</h1>
                                     <tr >
                                         <th scope="col">Chọn</th>
                                         <th scope="col">Mã phiếu mượn trả</th>
                                         <th scope="col">Mã tài liệu</th>
                                         <th scope="col">Tên tài liệu</th>
                                         <th scope="col">Thể loại</th>
                                         <th scope="col">Số lượng</th>
                                         <th scope="col">Ngày mượn</th>
                                         <th scope="col">Ngày hẹn trả</th>
                                         <th scope="col">Ngày trả thực tế</th>
                                         <th scope="col">Tiền phạt</th>
                                         <th scope="col">Lý do phạt</th>
                                         <th scope="col">Trạng thái</th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <c:forEach var="document" items="${sessionScope.lists}">
                                         <tr>
                                             <td>
                                                  <input type="checkbox" name="selected" value="${document.getId()}" onclick="toggleInputFields(this)"
                                                                      ${document.status == 1 ? 'disabled' : ''}>
                                             </td>
                                             <td>${document.getBorrow_return_id()}</td>
                                             <td>${document.getDocument599().getId()}</td>
                                             <td>${document.getDocument599().title}</td>
                                             <td>${document.getDocument599().category}</td>
                                             <td>${document.quantity_borrowed}</td>
                                             <td>${document.borrow_date}</td>
                                             <td>${document.return_date}</td>
                                             <td>
                                                  <input type="date" name="actualReturnDate_${document.getId()}" required value="${document.actual_return_date}" style="width: 80px;" disabled>
                                             </td>
                                             <td>
                                                  <input type="number" name="fineAmount_${document.getId()}" value="${document.fine_amount}" style="width: 80px;" disabled>
                                             </td>
                                             <td>
                                                  <input type="text" name="fineReason_${document.getId()}" value="${document.fine_reason}" style="width: 150px;" disabled>
                                             </td>
                                             <td>
                                                   ${document.status == 1 ? 'Đã trả' : 'Chưa trả'}
                                             </td>
                                         </tr>
                                     </c:forEach>

                                 </tbody>
                     </table>
                     <div class="d-flex justify-content-center" style="margin-bottom: 50px;">
                           <button type="submit" class="btn btn-success text-white" disabled>Xác nhận trả</button>
                     </div>
              </form>
        </c:if>

        <%-- Nếu danh sách rỗng hoặc không tồn tại --%>
        <c:if test="${empty lists}">
            <p class="text-center">Không có tài liệu đang mượn.</p>
        </c:if>
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
    var statusColumnIndex = 11;
    function toggleInputFields(checkbox) {
        var row = checkbox.parentNode.parentNode;
        var statusCell = row.cells[statusColumnIndex];

        if (statusCell.innerHTML.trim() !== 'Đã trả') {
            var inputs = row.getElementsByTagName('input');
            for (var i = 1; i < inputs.length; i++) {
                inputs[i].disabled = !checkbox.checked;
            }
        } else {
            checkbox.checked = false;
        }
        updateSubmitButtonState();
    }

      function updateSubmitButtonState() {
             var checkboxes = document.querySelectorAll('input[name="selected"]:checked');
             var submitButton = document.querySelector('.btn-success');

             if (checkboxes.length > 0) {
                 submitButton.removeAttribute('disabled');
             } else {
                 submitButton.setAttribute('disabled', 'disabled');
             }
         }
</script>
 </body>
 </html>