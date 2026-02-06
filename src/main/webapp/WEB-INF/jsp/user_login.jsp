<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body{
    min-height: 100vh;
    background: linear-gradient(135deg, rgba(13,110,253,0.15), rgba(32,201,151,0.15));
  }
  .login-card{
    border: none;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0px 15px 35px rgba(0,0,0,0.15);
  }
  .left-panel{
    background: linear-gradient(135deg, #0d6efd, #20c997);
    color: white;
    padding: 35px;
  }
  .right-panel{
    padding: 35px;
    background: rgba(255,255,255,0.96);
  }
  .form-control{
    border-radius: 12px;
    padding: 12px;
  }
  .btn-login{
    border-radius: 12px;
    font-weight: 700;
    padding: 12px;
    transition: 0.3s;
  }
  .btn-login:hover{
    transform: translateY(-2px);
    box-shadow: 0px 10px 20px rgba(13,110,253,0.35);
  }
</style>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
  <div class="row w-100 justify-content-center">
    <div class="col-lg-8 col-md-10">

      <div class="card login-card">
        <div class="row g-0">

          <div class="col-md-5 left-panel d-flex flex-column justify-content-center">
            <h2 class="fw-bold mb-2">Welcome Back!</h2>
            <p class="mb-0">
              Login to book your tickets<br>
              and manage reservations easily.
            </p>
          </div>

          <div class="col-md-7 right-panel">
            <h3 class="fw-bold text-dark mb-3">User Login</h3>

            <c:if test="${not empty success}">
              <div class="alert alert-success">${success}</div>
            </c:if>

            <c:if test="${not empty error}">
              <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/user/login" method="post">
              <div class="mb-3">
                <label class="form-label fw-semibold">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-semibold">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
              </div>

              <div class="d-grid mt-3">
                <button class="btn btn-primary btn-login">Login</button>
              </div>
            </form>

            <div class="text-center mt-3">
              <span class="text-muted">New user?</span>
              <a href="${pageContext.request.contextPath}/user/register" class="fw-semibold text-decoration-none">
                Register
              </a>
            </div>

            <div class="text-center mt-2">
              <a href="${pageContext.request.contextPath}/" class="text-decoration-none fw-semibold">
                ⬅ Back to Home
              </a>
            </div>

          </div>

        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>
