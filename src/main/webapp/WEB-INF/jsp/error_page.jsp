<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error | Bus Reservation System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  
  .navbar-custom{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    padding: 12px 0;
  }

  .navbar-custom .navbar-brand{
    font-weight: 700;
    font-size: 20px;
    color: white !important;
  }

  .navbar-custom .nav-link{
    color: white !important;
    font-weight: 500;
    margin: 0 6px;
    border-radius: 8px;
    padding: 6px 12px;
    transition: 0.3s;
  }

  .navbar-custom .nav-link:hover{
    background: rgba(255,255,255,0.2);
  }

  .btn-nav{
    border-radius: 10px;
    font-weight: 600;
    padding: 6px 14px;
  }

  
  .error-bg{
    min-height: 90vh;
    background: linear-gradient(135deg, rgba(13,110,253,0.15), rgba(32,201,151,0.15));
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 0;
  }

  .error-card{
    max-width: 850px;
    width: 100%;
    border-radius: 18px;
    background: white;
    box-shadow: 0px 15px 35px rgba(0,0,0,0.15);
    overflow: hidden;
  }

  .error-left{
    background: linear-gradient(135deg, #0d6efd, #20c997);
    color: white;
    padding: 40px;
  }

  .error-right{
    padding: 40px;
  }

  .error-code{
    font-size: 80px;
    font-weight: 800;
    line-height: 1;
  }

  .btn-home{
    border-radius: 12px;
    padding: 12px 18px;
    font-weight: 700;
  }

  .btn-home:hover{
    transform: translateY(-2px);
    transition: 0.3s;
  }

</style>

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-custom shadow">
  <div class="container">

    <a class="navbar-brand d-flex align-items-center gap-2" href="#">
      <img src="${pageContext.request.contextPath}/resources/images/logo.png"
           alt="logo" width="40" height="40" class="rounded-circle bg-white p-1">
      Bus Reservation System
    </a>

    <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto ms-3">
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Buses</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Routes</a></li>
      </ul>
    </div>

  </div>
</nav>


<section class="error-bg">
  <div class="container">
    <div class="error-card row g-0">

      
      <div class="col-md-5 error-left d-flex flex-column justify-content-center">
        <div class="error-code">Oops!</div>
        <h3 class="fw-bold mt-2">Something went wrong</h3>
        <p class="mb-0">
          Don’t worry 😄 <br>
          Let’s get you back on track.
        </p>
      </div>

      
      <div class="col-md-7 error-right">
        <h2 class="fw-bold text-dark">Error Page</h2>
        <p class="text-muted fs-5">
          The page you are looking for is not available or an error occurred.
        </p>

        <div class="alert alert-warning mt-3">
          <b>Tip:</b> Check the URL or go back to the homepage.
        </div>

        <div class="d-flex gap-3 mt-4">
          <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-home">
            ⬅ Back to Home
          </a>

          <a href="javascript:history.back()" class="btn btn-outline-success btn-home">
            ↩ Go Back
          </a>
        </div>

        <hr class="mt-4">

        <p class="text-muted mb-0">
          © 2026 Bus Reservation System
        </p>
      </div>

    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
