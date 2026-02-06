<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Bus</title>
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

  .form-control, .form-select{
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
      <div class="col-lg-7">

        <div class="card card-custom">
          <div class="card-title-custom text-center">
            <h3 class="mb-0 fw-bold">Add New Bus</h3>
            <small class="opacity-75">Fill details and save the bus</small>
          </div>

          <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/buses" method="post">

              <div class="mb-3">
                <label class="form-label fw-semibold">Bus Name</label>
                <input type="text" name="busName" class="form-control" placeholder="Eg: KPN Travels" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-semibold">Bus Type</label>
                <input type="text" name="busType" class="form-control" placeholder="Eg: AC Sleeper" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-semibold">Driver Name</label>
                <input type="text" name="driverName" class="form-control" placeholder="Eg: Suresh Kumar" required>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label class="form-label fw-semibold">Arrival Time</label>
                  <input type="text" name="arrivalTime" class="form-control" placeholder="06:00 AM" required>
                </div>

                <div class="col-md-6 mb-3">
                  <label class="form-label fw-semibold">Departure Time</label>
                  <input type="text" name="departureTime" class="form-control" placeholder="10:00 PM" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label class="form-label fw-semibold">Total Seats</label>
                  <input type="number" name="seats" class="form-control" placeholder="Eg: 40" required>
                </div>

                <div class="col-md-6 mb-3">
                  <label class="form-label fw-semibold">Price (₹)</label>
                  <input type="number" step="0.1" name="price" class="form-control" placeholder="Eg: 499" required>
                </div>
              </div>

              <div class="mb-4">
                <label class="form-label fw-semibold">Select Route</label>
                <select name="routeId" class="form-select" required>
                  <option value="">-- Select Route --</option>
                  <c:forEach var="r" items="${routes}">
                    <option value="${r.routeId}">
                      ${r.routeFrom} → ${r.routeTo}
                    </option>
                  </c:forEach>
                </select>
              </div>

              <div class="d-grid gap-2">
                <button class="btn btn-primary btn-save">Save Bus</button>
                <a class="btn btn-outline-dark btn-save"
                   href="${pageContext.request.contextPath}/buses">
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
