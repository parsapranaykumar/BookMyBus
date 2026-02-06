<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Reservations</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  .navbar-custom{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    padding: 12px 0;
  }
  .navbar-custom .navbar-brand{
    font-weight: 800;
    font-size: 20px;
    color: white !important;
  }
  .btn-nav{
    border-radius: 12px;
    font-weight: 800;
    padding: 8px 14px;
  }

  .page-bg{
    min-height: 100vh;
    background: linear-gradient(135deg, rgba(13,110,253,0.08), rgba(32,201,151,0.08));
    padding: 35px 0;
  }

  .card-custom{
    border: none;
    border-radius: 18px;
    box-shadow: 0px 12px 30px rgba(0,0,0,0.12);
    overflow: hidden;
  }

  .card-header-custom{
    background: linear-gradient(90deg, rgba(13,110,253,0.12), rgba(32,201,151,0.12));
    padding: 18px 20px;
  }

  .mini-title{
    font-weight: 800;
    font-size: 18px;
    color: #111;
  }

  .table thead{
    background: linear-gradient(90deg, #0d6efd, #20c997);
    color: white;
  }
  .table th{
    font-weight: 700;
    font-size: 14px;
    white-space: nowrap;
  }
  .table td{
    font-size: 14px;
    vertical-align: middle;
  }

  .btn-action{
    border-radius: 10px;
    font-weight: 800;
  }

  .badge-status{
    padding: 7px 12px;
    border-radius: 30px;
    font-weight: 800;
    font-size: 12px;
  }
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-custom shadow">
  <div class="container d-flex justify-content-between align-items-center">
    <span class="navbar-brand">My Reservations</span>
    <a href="${pageContext.request.contextPath}/user/home" class="btn btn-light btn-nav">Home</a>
  </div>
</nav>

<section class="page-bg">
  <div class="container">

    <div class="card card-custom">
      <div class="card-header card-header-custom">
        <div class="mini-title">Your Booking History</div>
        <small class="text-muted">Start journey, end journey and give feedback</small>
      </div>

      <div class="card-body">

        <c:if test="${empty reservations}">
          <div class="alert alert-info text-center fw-semibold m-0">
            No reservations yet ✅
          </div>
        </c:if>

        <c:if test="${not empty reservations}">
          <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle mb-0">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Bus</th>
                  <th>Route</th>
                  <th>Seats</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                <c:forEach var="r" items="${reservations}">
                  <tr>
                    <td class="fw-semibold">${r.reservationId}</td>
                    <td class="fw-semibold">${r.bus.busName}</td>
                    <td>${r.source} → ${r.destination}</td>
                    <td><span class="badge bg-primary">${r.seatsRequested}</span></td>

                    <td>
                      <c:choose>
                        <c:when test="${r.reservationStatus == 'CONFIRMED'}">
                          <span class="badge bg-success badge-status">CONFIRMED</span>
                        </c:when>
                        <c:otherwise>
                          <span class="badge bg-danger badge-status">${r.reservationStatus}</span>
                        </c:otherwise>
                      </c:choose>
                    </td>

                    <td class="d-flex gap-2 flex-wrap">
                      <!-- ✅ Start Journey -->
                      <c:if test="${r.reservationStatus == 'CONFIRMED' && !r.journeyStarted}">
                        <a class="btn btn-sm btn-success btn-action"
                           href="${pageContext.request.contextPath}/journey/start/${r.reservationId}">
                          Start Journey
                        </a>
                      </c:if>

                      <!-- ✅ End Journey -->
                      <c:if test="${r.reservationStatus == 'CONFIRMED' && r.journeyStarted && !r.journeyEnded}">
                        <a class="btn btn-sm btn-warning btn-action"
                           href="${pageContext.request.contextPath}/journey/end/${r.reservationId}">
                          End Journey
                        </a>
                      </c:if>

                      <!-- ✅ Feedback -->
                      <c:if test="${r.journeyEnded}">
                        <a class="btn btn-sm btn-primary btn-action"
                           href="${pageContext.request.contextPath}/feedback/${r.reservationId}">
                          Give Feedback
                        </a>
                      </c:if>
                    </td>

                  </tr>
                </c:forEach>
              </tbody>

            </table>
          </div>
        </c:if>

      </div>
    </div>

  </div>
</section>

</body>
</html>
