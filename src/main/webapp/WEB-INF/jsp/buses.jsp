<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Buses</title>
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
    letter-spacing: .5px;
  }
  .btn-nav{
    border-radius: 12px;
    font-weight: 700;
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

  .badge-soft{
    background: rgba(32,201,151,0.18);
    color: #128d6d;
    padding: 6px 10px;
    border-radius: 30px;
    font-weight: 700;
  }

  .btn-action{
    border-radius: 10px;
    font-weight: 700;
  }
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-custom shadow">
  <div class="container d-flex justify-content-between align-items-center">
    <span class="navbar-brand">Manage Buses</span>

    <div class="d-flex gap-2">
      <a class="btn btn-light btn-nav" href="${pageContext.request.contextPath}/buses/new">+ Add Bus</a>
      <a class="btn btn-dark btn-nav" href="${pageContext.request.contextPath}/admin/dashboard">← Back</a>
    </div>
  </div>
</nav>

<section class="page-bg">
  <div class="container">

    <div class="card card-custom">
      <div class="card-header card-header-custom d-flex justify-content-between align-items-center">
        <div>
          <h5 class="mb-0 fw-bold text-dark">Bus List</h5>
          <small class="text-muted">Manage buses, edit details and remove buses</small>
        </div>
      </div>

      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover table-bordered align-middle mb-0">
            <thead>
              <tr>
                <th>Bus Name</th>
                <th>Type</th>
                <th>Driver</th>
                <th>Route</th>
                <th>Arrival</th>
                <th>Departure</th>
                <th>Seats</th>
                <th>Available</th>
                <th>Price</th>
                <th>Actions</th>
              </tr>
            </thead>

            <tbody>
              <c:forEach var="b" items="${buses}">
                <tr>
                  <td class="fw-semibold">${b.busName}</td>
                  <td>${b.busType}</td>
                  <td>${b.driverName}</td>
                  <td class="fw-semibold">${b.route.routeFrom} → ${b.route.routeTo}</td>
                  <td>${b.arrivalTime}</td>
                  <td>${b.departureTime}</td>
                  <td>${b.seats}</td>
                  <td><span class="badge bg-success">${b.availableSeats}</span></td>
                  <td class="fw-bold text-primary">₹${b.price}</td>
                  <td class="d-flex gap-2">
                    <a class="btn btn-sm btn-primary btn-action"
                       href="${pageContext.request.contextPath}/buses/edit/${b.busId}">
                      Update
                    </a>

                    <a class="btn btn-sm btn-danger btn-action"
                       href="${pageContext.request.contextPath}/buses/delete/${b.busId}"
                       onclick="return confirm('Delete this bus?');">
                      Delete
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>

          </table>
        </div>
      </div>
    </div>

  </div>
</section>

</body>
</html>
