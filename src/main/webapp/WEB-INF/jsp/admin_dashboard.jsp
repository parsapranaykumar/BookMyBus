<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - BookMyBus</title>

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
    padding-bottom: 80px;
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
    transition: all 0.3s ease;
  }

  .navbar-custom .navbar-brand:hover {
    transform: scale(1.05);
  }

  .navbar-custom .nav-link {
    color: rgba(255, 255, 255, 0.9) !important;
    font-weight: 600;
    margin: 0 8px;
    border-radius: 10px;
    padding: 8px 16px;
    transition: all 0.3s ease;
    font-size: 0.95rem;
  }

  .navbar-custom .nav-link:hover,
  .navbar-custom .nav-link.active {
    background: rgba(255, 255, 255, 0.2);
    color: white !important;
  }

  .admin-badge {
    background: rgba(255, 255, 255, 0.2);
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    margin-left: 10px;
  }

  .btn-nav {
    border-radius: 25px;
    font-weight: 700;
    padding: 8px 20px;
    border: 2px solid white;
    transition: all 0.3s ease;
  }

  .btn-nav:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 255, 255, 0.3);
  }

  /* Dashboard Header */
  .dashboard-header {
    background: white;
    border-radius: 20px;
    padding: 40px;
    margin-top: 30px;
    margin-bottom: 30px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    position: relative;
    overflow: hidden;
  }

  .dashboard-header::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    opacity: 0.05;
    border-radius: 50%;
    transform: translate(30%, -30%);
  }

  .dashboard-header h1 {
    font-size: 2.5rem;
    font-weight: 800;
    color: #2c3e50;
    margin-bottom: 10px;
  }

  .dashboard-header p {
    color: #6c757d;
    font-size: 1.1rem;
    margin-bottom: 0;
  }

  .welcome-text {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
  }

  .admin-avatar {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.8rem;
    font-weight: 700;
  }

  /* Statistics Cards */
  .stats-container {
    margin-bottom: 40px;
  }

  .stat-card {
    background: white;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    border: 2px solid transparent;
  }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 150px;
    height: 150px;
    border-radius: 50%;
    opacity: 0.1;
    transform: translate(30%, -30%);
  }

  .stat-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    border-color: var(--card-color);
  }

  .stat-card.blue {
    --card-color: #667eea;
  }

  .stat-card.blue::before {
    background: #667eea;
  }

  .stat-card.green {
    --card-color: #20c997;
  }

  .stat-card.green::before {
    background: #20c997;
  }

  .stat-card.yellow {
    --card-color: #ffc107;
  }

  .stat-card.yellow::before {
    background: #ffc107;
  }

  .stat-card.purple {
    --card-color: #764ba2;
  }

  .stat-card.purple::before {
    background: #764ba2;
  }

  .stat-icon {
    width: 70px;
    height: 70px;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    color: white;
    margin-bottom: 20px;
  }

  .stat-card.blue .stat-icon {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }

  .stat-card.green .stat-icon {
    background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);
  }

  .stat-card.yellow .stat-icon {
    background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);
  }

  .stat-card.purple .stat-icon {
    background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
  }

  .stat-label {
    font-size: 0.95rem;
    color: #6c757d;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 10px;
  }

  .stat-value {
    font-size: 2.5rem;
    font-weight: 800;
    color: #2c3e50;
    margin-bottom: 10px;
  }

  .stat-change {
    font-size: 0.85rem;
    color: #20c997;
    font-weight: 600;
  }

  .stat-change.negative {
    color: #dc3545;
  }

  /* Quick Actions Section */
  .quick-actions {
    background: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    margin-bottom: 40px;
  }

  .section-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 30px;
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .section-title::before {
    content: '';
    width: 5px;
    height: 35px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 10px;
  }

  .action-card {
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%);
    border-radius: 15px;
    padding: 25px;
    text-align: center;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    text-decoration: none;
    display: block;
    height: 100%;
  }

  .action-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
    background: white;
    border-color: var(--action-color);
  }

  .action-card.primary {
    --action-color: #667eea;
  }

  .action-card.success {
    --action-color: #20c997;
  }

  .action-card.warning {
    --action-color: #ffc107;
  }

  .action-card.info {
    --action-color: #17a2b8;
  }

  .action-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.2rem;
    color: white;
  }

  .action-card.primary .action-icon {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }

  .action-card.success .action-icon {
    background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);
  }

  .action-card.warning .action-icon {
    background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);
  }

  .action-card.info .action-icon {
    background: linear-gradient(135deg, #17a2b8 0%, #20c997 100%);
  }

  .action-title {
    font-size: 1.2rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 10px;
  }

  .action-description {
    color: #6c757d;
    font-size: 0.9rem;
    line-height: 1.5;
  }

  /* Recent Activity */
  .recent-activity {
    background: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    margin-bottom: 40px;
  }

  .activity-item {
    display: flex;
    align-items: center;
    gap: 20px;
    padding: 20px;
    border-radius: 12px;
    margin-bottom: 15px;
    transition: all 0.3s ease;
    background: #f8f9fa;
  }

  .activity-item:hover {
    background: #e9ecef;
    transform: translateX(5px);
  }

  .activity-icon {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.3rem;
    color: white;
    flex-shrink: 0;
  }

  .activity-content {
    flex: 1;
  }

  .activity-title {
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 5px;
  }

  .activity-time {
    font-size: 0.85rem;
    color: #6c757d;
  }

  /* Footer */
  .footer {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
    color: white;
    padding: 20px 0;
    text-align: center;
    position: fixed;
    bottom: 0;
    width: 100%;
    box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.15);
  }

  .footer p {
    margin: 0;
    font-weight: 600;
  }

  /* Responsive Design */
  @media (max-width: 768px) {
    .dashboard-header h1 {
      font-size: 2rem;
    }

    .stat-value {
      font-size: 2rem;
    }

    .section-title {
      font-size: 1.5rem;
    }

    .dashboard-header {
      padding: 25px;
    }

    .quick-actions, .recent-activity {
      padding: 25px;
    }
  }

  /* Animation */
  @keyframes fadeInUp {
    from {
      opacity: 0;
      transform: translateY(30px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .stat-card, .action-card {
    animation: fadeInUp 0.6s ease forwards;
  }

  .stat-card:nth-child(1) { animation-delay: 0.1s; }
  .stat-card:nth-child(2) { animation-delay: 0.2s; }
  .stat-card:nth-child(3) { animation-delay: 0.3s; }
  .stat-card:nth-child(4) { animation-delay: 0.4s; }
</style>

</head>
<body>

<!-- Enhanced Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/admin/dashboard">
      <img src="${pageContext.request.contextPath}/resources/images/logo.png"
           alt="logo" width="45" height="45" class="rounded-circle bg-white p-1 me-2">
      <span>BookMyBus</span>
      <span class="admin-badge">
        <i class="fas fa-shield-alt me-1"></i>Admin
      </span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" 
            aria-expanded="false" aria-label="Toggle navigation"
            style="background-color: rgba(255,255,255,0.3);">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto ms-3">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard">
            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/buses">
            <i class="fas fa-bus me-1"></i>Buses
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/routes">
            <i class="fas fa-route me-1"></i>Routes
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/admin/reservations">
            <i class="fas fa-ticket-alt me-1"></i>Reservations
          </a>
        </li>
      </ul>

      <div class="d-flex gap-2">
        <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-warning btn-nav">
          <i class="fas fa-sign-out-alt me-1"></i>Logout
        </a>
      </div>
    </div>
  </div>
</nav>

<!-- Dashboard Content -->
<div class="container">

  <!-- Dashboard Header -->
  <div class="dashboard-header">
    <div class="welcome-text">
      <div class="admin-avatar">
        <i class="fas fa-user-shield"></i>
      </div>
      <div>
        <h1>Admin Dashboard</h1>
        <p>
          <i class="fas fa-calendar-alt me-2"></i>
          Welcome back! Here's what's happening with your bus reservation system today.
        </p>
      </div>
    </div>
  </div>

  <!-- Statistics Cards -->
  <div class="stats-container">
    <div class="row g-4">
      <div class="col-lg-3 col-md-6">
        <div class="stat-card blue">
          <div class="stat-icon">
            <i class="fas fa-bus"></i>
          </div>
          <div class="stat-label">Total Buses</div>
          <div class="stat-value">${busCount}</div>
          <div class="stat-change">
            <i class="fas fa-arrow-up me-1"></i>Active Fleet
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="stat-card green">
          <div class="stat-icon">
            <i class="fas fa-route"></i>
          </div>
          <div class="stat-label">Total Routes</div>
          <div class="stat-value">${routeCount}</div>
          <div class="stat-change">
            <i class="fas fa-arrow-up me-1"></i>Connected Cities
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="stat-card yellow">
          <div class="stat-icon">
            <i class="fas fa-comments"></i>
          </div>
          <div class="stat-label">Feedbacks</div>
          <div class="stat-value">${feedbackCount}</div>
          <div class="stat-change">
            <i class="fas fa-arrow-up me-1"></i>User Reviews
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="stat-card purple">
          <div class="stat-icon">
            <i class="fas fa-ticket-alt"></i>
          </div>
          <div class="stat-label">Reservations</div>
          <div class="stat-value">
            <c:choose>
              <c:when test="${not empty reservationCount}">${reservationCount}</c:when>
              <c:otherwise>0</c:otherwise>
            </c:choose>
          </div>
          <div class="stat-change">
            <i class="fas fa-arrow-up me-1"></i>Total Bookings
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Quick Actions -->
  <div class="quick-actions">
    <h2 class="section-title">
      Quick Actions
    </h2>

    <div class="row g-4">
      <div class="col-lg-3 col-md-6">
        <a href="${pageContext.request.contextPath}/buses" class="action-card primary">
          <div class="action-icon">
            <i class="fas fa-bus-alt"></i>
          </div>
          <h3 class="action-title">Manage Buses</h3>
          <p class="action-description">Add, edit, or remove buses from your fleet</p>
        </a>
      </div>

      <div class="col-lg-3 col-md-6">
        <a href="${pageContext.request.contextPath}/routes" class="action-card success">
          <div class="action-icon">
            <i class="fas fa-map-marked-alt"></i>
          </div>
          <h3 class="action-title">Manage Routes</h3>
          <p class="action-description">Configure routes and schedules</p>
        </a>
      </div>

      <div class="col-lg-3 col-md-6">
        <a href="${pageContext.request.contextPath}/admin/feedback" class="action-card warning">
          <div class="action-icon">
            <i class="fas fa-star"></i>
          </div>
          <h3 class="action-title">View Feedback</h3>
          <p class="action-description">Check customer reviews and ratings</p>
        </a>
      </div>

      <div class="col-lg-3 col-md-6">
        <a href="${pageContext.request.contextPath}/admin/reservations" class="action-card info">
          <div class="action-icon">
            <i class="fas fa-list-alt"></i>
          </div>
          <h3 class="action-title">Reservations</h3>
          <p class="action-description">Monitor and manage bookings</p>
        </a>
      </div>
    </div>
  </div>

  <!-- Recent Activity -->
  <div class="recent-activity">
    <h2 class="section-title">
      System Overview
    </h2>

    <div class="activity-item">
      <div class="activity-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
        <i class="fas fa-check-circle"></i>
      </div>
      <div class="activity-content">
        <div class="activity-title">System Status: Operational</div>
        <div class="activity-time">All systems running smoothly</div>
      </div>
    </div>

    <div class="activity-item">
      <div class="activity-icon" style="background: linear-gradient(135deg, #20c997 0%, #17a2b8 100%);">
        <i class="fas fa-database"></i>
      </div>
      <div class="activity-content">
        <div class="activity-title">Database Connected</div>
        <div class="activity-time">Last backup: Today</div>
      </div>
    </div>

    <div class="activity-item">
      <div class="activity-icon" style="background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);">
        <i class="fas fa-users"></i>
      </div>
      <div class="activity-content">
        <div class="activity-title">Active Users</div>
        <div class="activity-time">Manage user accounts and permissions</div>
      </div>
    </div>
  </div>

</div>

<!-- Footer -->
<div class="footer">
  <div class="container">
    <p>
      <i class="fas fa-copyright me-1"></i>
      2026 BookMyBus - Admin Panel | All Rights Reserved
    </p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Add counter animation
document.addEventListener('DOMContentLoaded', function() {
  const counters = document.querySelectorAll('.stat-value');
  
  counters.forEach(counter => {
    const target = parseInt(counter.innerText);
    const duration = 1500;
    const step = target / (duration / 16);
    let current = 0;
    
    const updateCounter = () => {
      current += step;
      if (current < target) {
        counter.innerText = Math.floor(current);
        requestAnimationFrame(updateCounter);
      } else {
        counter.innerText = target;
      }
    };
    
    updateCounter();
  });
});

// Add scroll animation
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
    }
  });
}, observerOptions);

document.querySelectorAll('.activity-item').forEach(el => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(20px)';
  el.style.transition = 'all 0.6s ease';
  observer.observe(el);
});
</script>

</body>
</html>
