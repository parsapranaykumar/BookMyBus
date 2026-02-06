<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Reservations Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    min-height: 100vh;
  }

  /* Enhanced Navbar */
  .navbar-custom {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 15px 0;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
  }

  .navbar-custom .navbar-brand {
    font-weight: 800;
    font-size: 1.5rem;
    color: white !important;
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .brand-icon {
    width: 45px;
    height: 45px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.3rem;
  }

  .btn-nav {
    border-radius: 25px;
    font-weight: 700;
    padding: 10px 24px;
    border: 2px solid white;
    color: white;
    transition: all 0.3s ease;
  }

  .btn-nav:hover {
    background: white;
    color: #667eea;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 255, 255, 0.3);
  }

  /* Page Header */
  .page-header {
    background: white;
    padding: 40px;
    border-radius: 20px;
    margin: 30px 0;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
  }

  .page-header h1 {
    font-size: 2.2rem;
    font-weight: 800;
    color: #2c3e50;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .page-header p {
    color: #6c757d;
    font-size: 1.05rem;
    margin-bottom: 0;
  }

  /* Statistics Cards */
  .stats-row {
    margin-bottom: 30px;
  }

  .stat-card {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 2px solid transparent;
    text-align: center;
  }

  .stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
    border-color: var(--stat-color);
  }

  .stat-icon {
    width: 60px;
    height: 60px;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.8rem;
    color: white;
    margin: 0 auto 15px;
  }

  .stat-value {
    font-size: 2rem;
    font-weight: 800;
    color: #2c3e50;
    margin-bottom: 5px;
  }

  .stat-label {
    font-size: 0.85rem;
    color: #6c757d;
    font-weight: 600;
    text-transform: uppercase;
  }

  /* Filter Section */
  .filter-section {
    background: white;
    border-radius: 15px;
    padding: 25px;
    margin-bottom: 30px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
  }

  .filter-title {
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .filter-btn {
    border-radius: 20px;
    padding: 8px 20px;
    font-weight: 600;
    transition: all 0.3s ease;
    border: 2px solid #e9ecef;
    background: white;
    color: #6c757d;
  }

  .filter-btn:hover,
  .filter-btn.active {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-color: transparent;
    transform: translateY(-2px);
  }

  /* Main Card */
  .reservations-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin-bottom: 40px;
  }

  .reservations-card-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 25px 30px;
    color: white;
  }

  .reservations-card-header h3 {
    margin: 0;
    font-weight: 700;
    font-size: 1.4rem;
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .reservations-card-header p {
    margin: 8px 0 0 0;
    opacity: 0.95;
    font-size: 0.95rem;
  }

  .card-tools {
    display: flex;
    gap: 10px;
    align-items: center;
    flex-wrap: wrap;
  }

  .search-box {
    position: relative;
    flex: 1;
    max-width: 350px;
    min-width: 250px;
  }

  .search-box input {
    border-radius: 25px;
    padding: 10px 40px 10px 20px;
    border: 2px solid #e9ecef;
    width: 100%;
    transition: all 0.3s ease;
  }

  .search-box input:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
  }

  .search-box i {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #6c757d;
  }

  .export-btn {
    border-radius: 25px;
    padding: 10px 20px;
    font-weight: 700;
    background: white;
    color: #667eea;
    border: 2px solid white;
    transition: all 0.3s ease;
  }

  .export-btn:hover {
    background: rgba(255, 255, 255, 0.2);
    color: white;
    border-color: white;
  }

  /* Table Styles */
  .custom-table {
    margin: 0;
  }

  .custom-table thead {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }

  .custom-table thead th {
    color: white;
    font-weight: 700;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    padding: 18px 15px;
    border: none;
    white-space: nowrap;
  }

  .custom-table tbody td {
    padding: 18px 15px;
    vertical-align: middle;
    font-size: 0.9rem;
    border-bottom: 1px solid #f0f0f0;
  }

  .custom-table tbody tr {
    transition: all 0.3s ease;
  }

  .custom-table tbody tr:hover {
    background: #f8f9ff;
    transform: scale(1.005);
  }

  /* ID Badge */
  .id-badge {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.85rem;
    display: inline-block;
  }

  /* User Display */
  .user-cell {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .user-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 0.9rem;
    flex-shrink: 0;
  }

  .user-info {
    display: flex;
    flex-direction: column;
  }

  .user-name {
    font-weight: 700;
    color: #2c3e50;
    font-size: 0.9rem;
  }

  .user-email {
    font-size: 0.75rem;
    color: #6c757d;
  }

  /* Bus Tag */
  .bus-tag {
    background: #e3f2fd;
    color: #1976d2;
    padding: 8px 14px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.85rem;
    display: inline-flex;
    align-items: center;
    gap: 8px;
  }

  /* Route Display */
  .route-display {
    display: flex;
    align-items: center;
    gap: 8px;
    font-weight: 600;
    color: #2c3e50;
    font-size: 0.85rem;
  }

  .route-arrow {
    color: #667eea;
    font-size: 1rem;
  }

  .route-city {
    background: #f8f9fa;
    padding: 4px 10px;
    border-radius: 8px;
  }

  /* Seats Badge */
  .seats-badge {
    background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);
    color: white;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.9rem;
    display: inline-flex;
    align-items: center;
    gap: 8px;
  }

  /* Status Badges */
  .status-badge {
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.85rem;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  .status-confirmed {
    background: #d4edda;
    color: #155724;
    border: 2px solid #c3e6cb;
  }

  .status-cancelled {
    background: #f8d7da;
    color: #721c24;
    border: 2px solid #f5c6cb;
  }

  .status-pending {
    background: #fff3cd;
    color: #856404;
    border: 2px solid #ffeaa7;
  }

  .status-completed {
    background: #d1ecf1;
    color: #0c5460;
    border: 2px solid #bee5eb;
  }

  /* Date Display */
  .date-display {
    display: flex;
    flex-direction: column;
    gap: 3px;
  }

  .date-main {
    font-weight: 600;
    color: #2c3e50;
    font-size: 0.85rem;
    display: flex;
    align-items: center;
    gap: 5px;
  }

  .date-time {
    font-size: 0.75rem;
    color: #6c757d;
  }

  /* Journey Status */
  .journey-status {
    font-size: 0.85rem;
    padding: 6px 12px;
    border-radius: 15px;
    font-weight: 600;
  }

  .journey-yes {
    background: #d4edda;
    color: #155724;
  }

  .journey-no {
    background: #f8f9fa;
    color: #6c757d;
  }

  /* Empty State */
  .empty-state {
    text-align: center;
    padding: 80px 20px;
  }

  .empty-icon {
    font-size: 5rem;
    color: #dee2e6;
    margin-bottom: 25px;
  }

  .empty-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #6c757d;
    margin-bottom: 15px;
  }

  .empty-text {
    color: #adb5bd;
    font-size: 1.05rem;
  }

  /* Action Buttons */
  .btn-action {
    border-radius: 10px;
    font-weight: 700;
    padding: 8px 16px;
    font-size: 0.85rem;
    transition: all 0.3s ease;
    border: none;
  }

  .btn-action:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }

  .btn-view {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
  }

  .btn-cancel {
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    color: white;
  }

  /* Pagination */
  .pagination-wrapper {
    padding: 25px 30px;
    background: #f8f9fa;
    border-top: 1px solid #e9ecef;
  }

  /* Responsive */
  @media (max-width: 768px) {
    .page-header h1 {
      font-size: 1.8rem;
    }

    .reservations-card-header {
      padding: 20px;
    }

    .stat-card {
      margin-bottom: 15px;
    }

    .user-cell {
      flex-direction: column;
      align-items: flex-start;
    }

    .card-tools {
      width: 100%;
    }

    .search-box {
      max-width: 100%;
    }
  }

  /* Animation */
  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .reservations-card {
    animation: fadeIn 0.6s ease;
  }
</style>
</head>

<body>

<!-- Enhanced Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container">
    <div class="navbar-brand">
      <div class="brand-icon">
        <i class="fas fa-ticket-alt"></i>
      </div>
      <span>Reservations Management</span>
    </div>

    <a class="btn btn-nav" href="${pageContext.request.contextPath}/admin/dashboard">
      <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
    </a>
  </div>
</nav>

<section class="py-4">
  <div class="container">

    <!-- Page Header -->
    <div class="page-header">
      <h1>
        <i class="fas fa-clipboard-list text-primary"></i>
        All Reservations
      </h1>
      <p>Monitor and manage all bus reservations from customers</p>
    </div>

    <!-- Statistics Cards -->
    <div class="stats-row">
      <div class="row g-3">
        <div class="col-lg-3 col-md-6">
          <div class="stat-card" style="--stat-color: #667eea;">
            <div class="stat-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
              <i class="fas fa-ticket-alt"></i>
            </div>
            <div class="stat-value">${reservations.size()}</div>
            <div class="stat-label">Total Reservations</div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="stat-card" style="--stat-color: #20c997;">
            <div class="stat-icon" style="background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);">
              <i class="fas fa-check-circle"></i>
            </div>
            <div class="stat-value">
              <c:set var="confirmedCount" value="0" />
              <c:forEach var="r" items="${reservations}">
                <c:if test="${r.reservationStatus == 'CONFIRMED'}">
                  <c:set var="confirmedCount" value="${confirmedCount + 1}" />
                </c:if>
              </c:forEach>
              ${confirmedCount}
            </div>
            <div class="stat-label">Confirmed</div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="stat-card" style="--stat-color: #ffc107;">
            <div class="stat-icon" style="background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);">
              <i class="fas fa-clock"></i>
            </div>
            <div class="stat-value">
              <c:set var="pendingCount" value="0" />
              <c:forEach var="r" items="${reservations}">
                <c:if test="${r.reservationStatus == 'PENDING'}">
                  <c:set var="pendingCount" value="${pendingCount + 1}" />
                </c:if>
              </c:forEach>
              ${pendingCount}
            </div>
            <div class="stat-label">Pending</div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="stat-card" style="--stat-color: #dc3545;">
            <div class="stat-icon" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">
              <i class="fas fa-times-circle"></i>
            </div>
            <div class="stat-value">
              <c:set var="cancelledCount" value="0" />
              <c:forEach var="r" items="${reservations}">
                <c:if test="${r.reservationStatus == 'CANCELLED'}">
                  <c:set var="cancelledCount" value="${cancelledCount + 1}" />
                </c:if>
              </c:forEach>
              ${cancelledCount}
            </div>
            <div class="stat-label">Cancelled</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Filter Section -->
    <div class="filter-section">
      <div class="filter-title">
        <i class="fas fa-filter"></i>
        Filter Reservations
      </div>
      <div class="d-flex gap-2 flex-wrap">
        <button class="filter-btn active" onclick="filterTable('all')">
          <i class="fas fa-list me-1"></i>All
        </button>
        <button class="filter-btn" onclick="filterTable('CONFIRMED')">
          <i class="fas fa-check me-1"></i>Confirmed
        </button>
        <button class="filter-btn" onclick="filterTable('PENDING')">
          <i class="fas fa-clock me-1"></i>Pending
        </button>
        <button class="filter-btn" onclick="filterTable('CANCELLED')">
          <i class="fas fa-times me-1"></i>Cancelled
        </button>
      </div>
    </div>

    <!-- Main Reservations Card -->
    <div class="reservations-card">
      
      <!-- Card Header with Tools -->
      <div class="reservations-card-header">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
          <div>
            <h3>
              <i class="fas fa-table"></i>
              Reservation Records
            </h3>
            <p>Complete list of all customer reservations</p>
          </div>
          
          <div class="card-tools">
            <div class="search-box">
              <input type="text" 
                     class="form-control" 
                     id="searchInput" 
                     placeholder="Search reservations...">
              <i class="fas fa-search"></i>
            </div>
            <button class="btn export-btn">
              <i class="fas fa-download me-2"></i>Export
            </button>
          </div>
        </div>
      </div>

      <!-- Table Container -->
      <div class="table-container">
        <c:choose>
          <c:when test="${not empty reservations}">
            <div class="table-responsive">
              <table class="table custom-table mb-0">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Bus</th>
                    <th>Route</th>
                    <th>Seats</th>
                    <th>Status</th>
                    <th>Booking Date</th>
                    <th>Journey Started</th>
                    <th>Journey Ended</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody id="reservationTableBody">
                  <c:forEach var="r" items="${reservations}">
                    <tr data-status="${r.reservationStatus}">
                      <!-- ID -->
                      <td>
                        <span class="id-badge">#${r.reservationId}</span>
                      </td>

                      <!-- User -->
                      <td>
                        <div class="user-cell">
                          <div class="user-avatar">
                            ${r.user.username.substring(0,1).toUpperCase()}
                          </div>
                          <div class="user-info">
                            <span class="user-name">${r.user.username}</span>
                            <span class="user-email">
                              <i class="fas fa-envelope me-1"></i>${r.user.email}
                            </span>
                          </div>
                        </div>
                      </td>

                      <!-- Bus -->
                      <td>
                        <span class="bus-tag">
                          <i class="fas fa-bus"></i>
                          ${r.bus.busName}
                        </span>
                      </td>

                      <!-- Route -->
                      <td>
                        <div class="route-display">
                          <span class="route-city">${r.source}</span>
                          <i class="fas fa-arrow-right route-arrow"></i>
                          <span class="route-city">${r.destination}</span>
                        </div>
                      </td>

                      <!-- Seats -->
                      <td>
                        <span class="seats-badge">
                          <i class="fas fa-chair"></i>
                          ${r.seatsRequested}
                        </span>
                      </td>

                      <!-- Status -->
                      <td>
                        <c:choose>
                          <c:when test="${r.reservationStatus == 'CONFIRMED'}">
                            <span class="status-badge status-confirmed">
                              <i class="fas fa-check-circle"></i>
                              Confirmed
                            </span>
                          </c:when>
                          <c:when test="${r.reservationStatus == 'CANCELLED'}">
                            <span class="status-badge status-cancelled">
                              <i class="fas fa-times-circle"></i>
                              Cancelled
                            </span>
                          </c:when>
                          <c:when test="${r.reservationStatus == 'PENDING'}">
                            <span class="status-badge status-pending">
                              <i class="fas fa-clock"></i>
                              Pending
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge status-completed">
                              <i class="fas fa-flag-checkered"></i>
                              ${r.reservationStatus}
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                      <!-- Booking Date -->
                      <td>
                        <div class="date-display">
                          <span class="date-main">
                            <i class="fas fa-calendar-alt"></i>
                            ${r.reservationDate}
                          </span>
                        </div>
                      </td>

                      <!-- Journey Started -->
                      <td>
                        <c:choose>
                          <c:when test="${r.journeyStarted}">
                            <span class="journey-status journey-yes">
                              <i class="fas fa-check-circle me-1"></i>Yes
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="journey-status journey-no">
                              <i class="fas fa-minus-circle me-1"></i>No
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                      <!-- Journey Ended -->
                      <td>
                        <c:choose>
                          <c:when test="${r.journeyEnded}">
                            <span class="journey-status journey-yes">
                              <i class="fas fa-check-circle me-1"></i>Yes
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="journey-status journey-no">
                              <i class="fas fa-minus-circle me-1"></i>No
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                      <!-- Actions -->
                      <td>
                        <div class="d-flex gap-2">
                          <button class="btn btn-sm btn-action btn-view" 
                                  onclick="viewDetails(${r.reservationId})">
                            <i class="fas fa-eye"></i>
                          </button>
                          <c:if test="${r.reservationStatus == 'CONFIRMED'}">
                            <button class="btn btn-sm btn-action btn-cancel"
                                    onclick="cancelReservation(${r.reservationId}, '${r.user.username}')">
                              <i class="fas fa-ban"></i>
                            </button>
                          </c:if>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </c:when>

          <c:otherwise>
            <div class="empty-state">
              <div class="empty-icon">
                <i class="fas fa-inbox"></i>
              </div>
              <h3 class="empty-title">No Reservations Found</h3>
              <p class="empty-text">There are no reservations to display at this time.</p>
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- Pagination -->
      <c:if test="${not empty reservations}">
        <div class="pagination-wrapper">
          <div class="d-flex justify-content-between align-items-center">
            <div class="text-muted">
              Showing <strong id="visibleCount">${reservations.size()}</strong> of <strong>${reservations.size()}</strong> reservation(s)
            </div>
            <nav>
              <ul class="pagination mb-0">
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </c:if>

    </div>

  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Search functionality
document.getElementById('searchInput').addEventListener('keyup', function() {
  const searchValue = this.value.toLowerCase();
  const tableRows = document.querySelectorAll('#reservationTableBody tr');
  let visibleCount = 0;
  
  tableRows.forEach(row => {
    const text = row.textContent.toLowerCase();
    const isVisible = text.includes(searchValue);
    row.style.display = isVisible ? '' : 'none';
    if (isVisible && row.style.display !== 'none') visibleCount++;
  });
  
  document.getElementById('visibleCount').textContent = visibleCount;
});

// Filter by status
function filterTable(status) {
  const tableRows = document.querySelectorAll('#reservationTableBody tr');
  const filterButtons = document.querySelectorAll('.filter-btn');
  let visibleCount = 0;
  
  // Update active button
  filterButtons.forEach(btn => btn.classList.remove('active'));
  event.target.closest('.filter-btn').classList.add('active');
  
  tableRows.forEach(row => {
    if (status === 'all') {
      row.style.display = '';
      visibleCount++;
    } else {
      const rowStatus = row.getAttribute('data-status');
      const isVisible = rowStatus === status;
      row.style.display = isVisible ? '' : 'none';
      if (isVisible) visibleCount++;
    }
  });
  
  document.getElementById('visibleCount').textContent = visibleCount;
}

// View reservation details
function viewDetails(id) {
  alert(`View detailed information for Reservation #${id}\n\n(This can be implemented with a modal showing full reservation details)`);
}

// Cancel reservation
function cancelReservation(id, username) {
  if (confirm(`Are you sure you want to cancel the reservation for ${username}?\n\nReservation ID: #${id}`)) {
    alert(`Cancellation request sent for Reservation #${id}\n\n(Implement backend cancellation logic here)`);
  }
}

// Add row animation on load
document.addEventListener('DOMContentLoaded', function() {
  const rows = document.querySelectorAll('#reservationTableBody tr');
  rows.forEach((row, index) => {
    row.style.opacity = '0';
    row.style.transform = 'translateY(20px)';
    setTimeout(() => {
      row.style.transition = 'all 0.4s ease';
      row.style.opacity = '1';
      row.style.transform = 'translateY(0)';
    }, index * 30);
  });
});

// Export functionality (placeholder)
document.querySelector('.export-btn').addEventListener('click', function() {
  alert('Export to CSV/Excel\n\n(Implement export functionality here)');
});
</script>

</body>
</html>
