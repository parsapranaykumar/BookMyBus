<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus Results</title>
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
    letter-spacing: .4px;
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

  .badge-soft{
    background: rgba(13,110,253,0.15);
    color: #0d6efd;
    padding: 6px 10px;
    border-radius: 30px;
    font-weight: 800;
  }
</style>
</head>

<body>


<nav class="navbar navbar-expand-lg navbar-custom shadow">
  <div class="container d-flex justify-content-between align-items-center">
    <span class="navbar-brand">Available Buses (${from} → ${to})</span>

    <a href="${pageContext.request.contextPath}/" class="btn btn-light btn-nav">← Back</a>
  </div>
</nav>

<section class="page-bg">
  <div class="container">

    <div class="card card-custom">
      <div class="card-header card-header-custom">
        <div class="mini-title">Bus Search Results</div>
        <small class="text-muted">Choose your bus and book your seat</small>
      </div>

      <div class="card-body">

        <c:if test="${empty buses}">
          <div class="alert alert-danger text-center fw-semibold m-0">
            No buses found ❌
          </div>
        </c:if>

        <c:if test="${not empty buses}">
          <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle mb-0">
              <thead>
                <tr>
                  <th>Bus Name</th>
                  <th>Type</th>
                  <th>Departure</th>
                  <th>Arrival</th>
                  <th>Available</th>
                  <th>Price</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                <c:forEach var="b" items="${buses}">
                  <tr>
                    <td class="fw-semibold">${b.busName}</td>
                    <td><span class="badge-soft">${b.busType}</span></td>
                    <td>${b.departureTime}</td>
                    <td>${b.arrivalTime}</td>
                    <td><span class="badge bg-success">${b.availableSeats}</span></td>
                    <td class="fw-bold text-primary">₹${b.price}</td>
                    <td>
                      <a class="btn btn-sm btn-success btn-action"
                         href="${pageContext.request.contextPath}/book/${b.busId}">
                        Book
                      </a>
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
