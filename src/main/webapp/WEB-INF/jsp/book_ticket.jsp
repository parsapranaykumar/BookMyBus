<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Ticket</title>
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
    overflow: hidden;
  }

  .card-title-custom{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    color: white;
    padding: 18px 20px;
  }

  .info-box{
    background: rgba(13,110,253,0.08);
    border: 1px solid rgba(13,110,253,0.15);
    border-radius: 14px;
    padding: 14px;
  }

  .form-control{
    border-radius: 12px;
    padding: 12px 14px;
  }

  .btn-action{
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
            <h3 class="mb-0 fw-bold">Book Ticket</h3>
            <small class="opacity-75">Confirm details and continue</small>
          </div>

          <div class="card-body p-4">

            <div class="info-box mb-3">
              <p class="mb-1"><b>Bus:</b> ${bus.busName}</p>
              <p class="mb-1"><b>Route:</b> ${bus.route.routeFrom} → ${bus.route.routeTo}</p>
              <p class="mb-1"><b>Available Seats:</b> <span class="badge bg-success">${bus.availableSeats}</span></p>
              <p class="mb-0"><b>Price:</b> <span class="fw-bold text-primary">₹${bus.price}</span></p>
            </div>

            <c:if test="${not empty error}">
              <div class="alert alert-danger fw-semibold">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/book" method="post">
              <input type="hidden" name="busId" value="${bus.busId}">

              <div class="mb-3">
                <label class="form-label fw-semibold">Seats Required</label>
                <input type="number" name="seatsRequested" min="1" class="form-control" required>
              </div>

              <div class="d-grid gap-2">
                <button class="btn btn-success btn-action">Proceed to Payment</button>
                <a class="btn btn-outline-dark btn-action"
                   href="${pageContext.request.contextPath}/search?from=${bus.route.routeFrom}&to=${bus.route.routeTo}">
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
