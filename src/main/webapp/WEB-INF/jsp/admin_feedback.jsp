<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Feedback Management</title>
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

  .stat-mini-card {
    background: white;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 2px solid transparent;
  }

  .stat-mini-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
    border-color: var(--stat-color);
  }

  .stat-mini-icon {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    color: white;
    margin-bottom: 12px;
  }

  .stat-mini-value {
    font-size: 1.8rem;
    font-weight: 800;
    color: #2c3e50;
  }

  .stat-mini-label {
    font-size: 0.85rem;
    color: #6c757d;
    font-weight: 600;
  }

  /* Main Card */
  .feedback-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin-bottom: 40px;
  }

  .feedback-card-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 25px 30px;
    color: white;
  }

  .feedback-card-header h3 {
    margin: 0;
    font-weight: 700;
    font-size: 1.4rem;
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .feedback-card-header p {
    margin: 8px 0 0 0;
    opacity: 0.95;
    font-size: 0.95rem;
  }

  .card-tools {
    display: flex;
    gap: 10px;
    align-items: center;
  }

  .search-box {
    position: relative;
    flex: 1;
    max-width: 350px;
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

  /* Table Styles */
  .table-container {
    padding: 0;
  }

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
    transform: scale(1.01);
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

  /* User Info */
  .user-info {
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
  }

  .user-details {
    display: flex;
    flex-direction: column;
  }

  .user-name {
    font-weight: 700;
    color: #2c3e50;
    font-size: 0.9rem;
  }

  .user-role {
    font-size: 0.75rem;
    color: #6c757d;
  }

  /* Rating Stars */
  .rating-display {
    display: flex;
    gap: 3px;
    align-items: center;
  }

  .star {
    color: #ffc107;
    font-size: 1rem;
  }

  .star.empty {
    color: #dee2e6;
  }

  .rating-value {
    font-weight: 700;
    color: #2c3e50;
    margin-left: 5px;
    font-size: 0.9rem;
  }

  /* Rating Badge */
  .rating-badge {
    padding: 6px 12px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.85rem;
    display: inline-flex;
    align-items: center;
    gap: 5px;
  }

  .rating-badge.excellent {
    background: #d4edda;
    color: #155724;
  }

  .rating-badge.good {
    background: #d1ecf1;
    color: #0c5460;
  }

  .rating-badge.average {
    background: #fff3cd;
    color: #856404;
  }

  .rating-badge.poor {
    background: #f8d7da;
    color: #721c24;
  }

  /* Bus Info */
  .bus-tag {
    background: #e3f2fd;
    color: #1976d2;
    padding: 6px 12px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 0.85rem;
    display: inline-flex;
    align-items: center;
    gap: 5px;
  }

  /* Comments */
  .comment-text {
    max-width: 300px;
    color: #495057;
    line-height: 1.5;
    font-size: 0.9rem;
  }

  .comment-icon {
    color: #667eea;
    margin-right: 5px;
  }

  /* Date Display */
  .date-display {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }

  .date-main {
    font-weight: 600;
    color: #2c3e50;
    font-size: 0.85rem;
  }

  .date-time {
    font-size: 0.75rem;
    color: #6c757d;
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

  .btn-delete {
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    color: white;
  }

  .btn-view {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    margin-right: 5px;
  }

  /* Empty State */
  .empty-state {
    text-align: center;
    padding: 60px 20px;
  }

  .empty-icon {
    font-size: 4rem;
    color: #dee2e6;
    margin-bottom: 20px;
  }

  .empty-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #6c757d;
    margin-bottom: 10px;
  }

  .empty-text {
    color: #adb5bd;
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

    .feedback-card-header {
      padding: 20px;
    }

    .stat-mini-card {
      margin-bottom: 15px;
    }

    .table-container {
      overflow-x: auto;
    }

    .user-info {
      flex-direction: column;
      align-items: flex-start;
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

  .feedback-card {
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
        <i class="fas fa-comments"></i>
      </div>
      <span>Feedback Management</span>
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
        <i class="fas fa-star text-warning"></i>
        Customer Feedback
      </h1>
      <p>Monitor and manage customer reviews and ratings</p>
    </div>

    <!-- Mini Statistics -->
    <div class="stats-row">
      <div class="row g-3">
        <div class="col-md-3 col-sm-6">
          <div class="stat-mini-card" style="--stat-color: #667eea;">
            <div class="stat-mini-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
              <i class="fas fa-comments"></i>
            </div>
            <div class="stat-mini-value">${feedbacks.size()}</div>
            <div class="stat-mini-label">Total Feedbacks</div>
          </div>
        </div>

        <div class="col-md-3 col-sm-6">
          <div class="stat-mini-card" style="--stat-color: #20c997;">
            <div class="stat-mini-icon" style="background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);">
              <i class="fas fa-star"></i>
            </div>
            <div class="stat-mini-value">4.5</div>
            <div class="stat-mini-label">Average Rating</div>
          </div>
        </div>

        <div class="col-md-3 col-sm-6">
          <div class="stat-mini-card" style="--stat-color: #ffc107;">
            <div class="stat-mini-icon" style="background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);">
              <i class="fas fa-thumbs-up"></i>
            </div>
            <div class="stat-mini-value">85%</div>
            <div class="stat-mini-label">Positive Reviews</div>
          </div>
        </div>

        <div class="col-md-3 col-sm-6">
          <div class="stat-mini-card" style="--stat-color: #17a2b8;">
            <div class="stat-mini-icon" style="background: linear-gradient(135deg, #17a2b8 0%, #138496 100%);">
              <i class="fas fa-calendar-day"></i>
            </div>
            <div class="stat-mini-value">Today</div>
            <div class="stat-mini-label">Last Updated</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Feedback Card -->
    <div class="feedback-card">
      
      <!-- Card Header with Tools -->
      <div class="feedback-card-header">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
          <div>
            <h3>
              <i class="fas fa-list-alt"></i>
              All Feedback Records
            </h3>
            <p>View and manage customer reviews and ratings</p>
          </div>
          
          <div class="card-tools">
            <div class="search-box">
              <input type="text" 
                     class="form-control" 
                     id="searchInput" 
                     placeholder="Search feedbacks...">
              <i class="fas fa-search"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- Table Container -->
      <div class="table-container">
        <c:choose>
          <c:when test="${not empty feedbacks}">
            <div class="table-responsive">
              <table class="table custom-table mb-0">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Bus</th>
                    <th>Driver Rating</th>
                    <th>Service Rating</th>
                    <th>Overall Rating</th>
                    <th>Comments</th>
                    <th>Submitted Date</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody id="feedbackTableBody">
                  <c:forEach var="f" items="${feedbacks}">
                    <tr>
                      <!-- ID -->
                      <td>
                        <span class="id-badge">#${f.feedbackId}</span>
                      </td>

                      <!-- User Info -->
                      <td>
                        <div class="user-info">
                          <div class="user-avatar">
                            ${f.user.username.substring(0,1).toUpperCase()}
                          </div>
                          <div class="user-details">
                            <span class="user-name">${f.user.username}</span>
                            <span class="user-role">Customer</span>
                          </div>
                        </div>
                      </td>

                      <!-- Bus Name -->
                      <td>
                        <span class="bus-tag">
                          <i class="fas fa-bus"></i>
                          ${f.bus.busName}
                        </span>
                      </td>

                      <!-- Driver Rating -->
                      <td>
                        <div class="rating-display">
                          <c:forEach begin="1" end="5" var="i">
                            <i class="fas fa-star star ${i <= f.driverRating ? '' : 'empty'}"></i>
                          </c:forEach>
                          <span class="rating-value">${f.driverRating}/5</span>
                        </div>
                      </td>

                      <!-- Service Rating -->
                      <td>
                        <div class="rating-display">
                          <c:forEach begin="1" end="5" var="i">
                            <i class="fas fa-star star ${i <= f.serviceRating ? '' : 'empty'}"></i>
                          </c:forEach>
                          <span class="rating-value">${f.serviceRating}/5</span>
                        </div>
                      </td>

                      <!-- Overall Rating -->
                      <td>
                        <c:choose>
                          <c:when test="${f.overallRating >= 4}">
                            <span class="rating-badge excellent">
                              <i class="fas fa-smile"></i>
                              ${f.overallRating}/5
                            </span>
                          </c:when>
                          <c:when test="${f.overallRating >= 3}">
                            <span class="rating-badge good">
                              <i class="fas fa-meh"></i>
                              ${f.overallRating}/5
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="rating-badge poor">
                              <i class="fas fa-frown"></i>
                              ${f.overallRating}/5
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                      <!-- Comments -->
                      <td>
                        <div class="comment-text">
                          <i class="fas fa-quote-left comment-icon"></i>
                          <c:choose>
                            <c:when test="${not empty f.comments}">
                              ${f.comments}
                            </c:when>
                            <c:otherwise>
                              <em class="text-muted">No comments provided</em>
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </td>

                      <!-- Submitted Date -->
                      <td>
                        <div class="date-display">
                          <span class="date-main">
                            <i class="fas fa-calendar-alt me-1"></i>
                            ${f.submittedAt}
                          </span>
                        </div>
                      </td>

                      <!-- Actions -->
                      <td>
                        <div class="d-flex gap-2">
                          <button class="btn btn-sm btn-action btn-view" 
                                  onclick="viewFeedback(${f.feedbackId})">
                            <i class="fas fa-eye"></i>
                          </button>
                          <a class="btn btn-sm btn-action btn-delete"
                             href="${pageContext.request.contextPath}/admin/feedback/delete/${f.feedbackId}"
                             onclick="return confirmDelete('${f.user.username}');">
                            <i class="fas fa-trash-alt"></i>
                          </a>
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
              <h3 class="empty-title">No Feedback Yet</h3>
              <p class="empty-text">There are no customer feedbacks to display at this time.</p>
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- Pagination (Optional) -->
      <c:if test="${not empty feedbacks}">
        <div class="pagination-wrapper">
          <div class="d-flex justify-content-between align-items-center">
            <div class="text-muted">
              Showing <strong>${feedbacks.size()}</strong> feedback(s)
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
  const tableRows = document.querySelectorAll('#feedbackTableBody tr');
  
  tableRows.forEach(row => {
    const text = row.textContent.toLowerCase();
    row.style.display = text.includes(searchValue) ? '' : 'none';
  });
});

// Confirm delete with user name
function confirmDelete(username) {
  return confirm(`Are you sure you want to delete the feedback from ${username}?`);
}

// View feedback details (placeholder)
function viewFeedback(id) {
  alert(`View detailed feedback #${id}\n\n(This functionality can be implemented with a modal)`);
}

// Add row animation on load
document.addEventListener('DOMContentLoaded', function() {
  const rows = document.querySelectorAll('#feedbackTableBody tr');
  rows.forEach((row, index) => {
    row.style.opacity = '0';
    row.style.transform = 'translateY(20px)';
    setTimeout(() => {
      row.style.transition = 'all 0.4s ease';
      row.style.opacity = '1';
      row.style.transform = 'translateY(0)';
    }, index * 50);
  });
});
</script>

</body>
</html>
