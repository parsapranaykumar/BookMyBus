<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
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

  .amount-box{
    background: rgba(32,201,151,0.1);
    border: 1px solid rgba(32,201,151,0.18);
    border-radius: 14px;
    padding: 14px;
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
            <h3 class="mb-0 fw-bold">Payment</h3>
            <small class="opacity-75">Simulation (Demo only)</small>
          </div>

          <div class="card-body p-4">

            <div class="amount-box mb-3">
              <p class="mb-1"><b>Reservation ID:</b> ${reservation.reservationId}</p>
              <p class="mb-1"><b>Bus:</b> ${reservation.bus.busName}</p>
              <p class="mb-1"><b>Seats:</b> <span class="badge bg-primary">${reservation.seatsRequested}</span></p>
              <p class="mb-0"><b>Total Amount:</b>
                <span class="fw-bold text-success">
                  ₹${reservation.seatsRequested * reservation.bus.price}
                </span>
              </p>
            </div>

            <form action="${pageContext.request.contextPath}/payment/confirm" method="post">
              <input type="hidden" name="reservationId" value="${reservation.reservationId}">

              <div class="d-grid">
                <button class="btn btn-success btn-lg btn-action">Pay Now ✅</button>
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
