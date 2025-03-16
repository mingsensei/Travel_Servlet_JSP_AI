<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng ký</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      background-image: url('https://media.istockphoto.com/id/1357445596/vi/anh/c%E1%BA%A7u-r%E1%BB%93ng-%E1%BB%9F-th%C3%A0nh-ph%E1%BB%91-%C4%91%C3%A0-n%E1%BA%B5ng.jpg?s=612x612&w=0&k=20&c=H_3uhMhNr1kZvg78iOtTROncLKwbsYrffBAEIPpGX2g=');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }
    .register-container {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
<div class="register-container">
  <h3 class="text-center">Đăng ký</h3>

  <%-- Hiển thị thông báo lỗi nếu có --%>
  <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null) { %>
  <div class="alert alert-danger"><%= errorMessage %></div>
  <% } %>

  <form action="<%= request.getContextPath() %>/register" method="POST">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Mật khẩu</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="mb-3">
      <label for="confirm_password" class="form-label">Xác nhận mật khẩu</label>
      <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
  </form>
  <div class="text-center mt-3">
    <a href="<%= request.getContextPath() %>/login">Đã có tài khoản? Đăng nhập</a>
  </div>
</div>
</body>
</html>
