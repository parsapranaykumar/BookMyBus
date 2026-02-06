<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
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
    width: 100%;
    max-width: 550px;
  }

  .card-title-custom{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    color: white;
    padding: 18px 20px;
    text-align: center;
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

  textarea.form-control{
    min-height: 110px;
    resize: none;
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

    <div class="card card-custom">
      <div class="card-title-custom">
        <h3 class="mb-0 fw-bold">Submit Feedback</h3>
        <small class="opacity-75">Your opinion helps us improve 🚍</small>
      </div>

      <div class="card-body p-4">

        <div class="info-box mb-3">
          <p class="mb-1"><b>Bus:</b> ${reservation.bus.busName}</p>
          <p class="mb-0"><b>Route:</b> ${reservation.source} → ${reservation.destination}</p>
        </div>

        <form action="${pageContext.request.contextPath}/feedback/save" method="post">
          <input type="hidden" name="reservationId" value="${reservation.reservationId}">

          <div class="row">
            <div class="col-md-4 mb-3">
              <label class="form-label fw-semibold">Driver Rating (1-5)</label>
              <input type="number" name="driverRating" min="1" max="5" class="form-control" required>
            </div>

            <div class="col-md-4 mb-3">
              <label class="form-label fw-semibold">Service Rating (1-5)</label>
              <input type="number" name="serviceRating" min="1" max="5" class="form-control" required>
            </div>

            <div class="col-md-4 mb-3">
              <label class="form-label fw-semibold">Overall Rating (1-5)</label>
              <input type="number" name="overallRating" min="1" max="5" class="form-control" required>
            </div>
          </div>

          <div class="mb-4">
            <label class="form-label fw-semibold">Comments</label>
            <textarea name="comments" class="form-control" placeholder="Write your feedback..." required></textarea>
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-success btn-action">Submit Feedback</button>
            <a class="btn btn-outline-dark btn-action"
               href="${pageContext.request.contextPath}/user/reservations">
              Back to My Reservations
            </a>
          </div>
        </form>

      </div>
    </div>

  </div>
</section>
</body>
</html>
