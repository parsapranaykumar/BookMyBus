<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Route</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  .page-bg{
    min-height: 100vh;
    background: linear-gradient(135deg, rgba(13,110,253,0.12), rgba(32,201,151,0.12));
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 0;
  }

  .card-custom{
    border: none;
    border-radius: 18px;
    box-shadow: 0px 12px 30px rgba(0,0,0,0.15);
  }

  .card-title-custom{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    color: white;
    border-radius: 18px 18px 0 0;
    padding: 18px 20px;
  }

  .form-control{
    border-radius: 12px;
    padding: 12px 14px;
  }

  .btn-save{
    border-radius: 12px;
    font-weight: 800;
    padding: 12px;
  }
</style>
</head>

<body>
<section class="page-bg">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">

        <div class="card card-custom">
          <div class="card-title-custom text-center">
            <h3 class="mb-0 fw-bold">Update Route</h3>
            <small class="opacity-75">Edit and update route details</small>
          </div>

          <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/routes/${route.routeId}" method="post">

              <div class="mb-3">
                <label class="form-label fw-semibold">From</label>
                <input type="text" name="routeFrom" class="form-control" value="${route.routeFrom}" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-semibold">To</label>
                <input type="text" name="routeTo" class="form-control" value="${route.routeTo}" required>
              </div>

              <div class="mb-4">
                <label class="form-label fw-semibold">Distance (km)</label>
                <input type="number" step="0.1" name="distance" class="form-control" value="${route.distance}" required>
              </div>

              <div class="d-grid gap-2">
                <button class="btn btn-primary btn-save">Update Route</button>
                <a class="btn btn-outline-dark btn-save"
                   href="${pageContext.request.contextPath}/routes">
                  Cancel
                </a>
              </div>

            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
</body>
</html>
