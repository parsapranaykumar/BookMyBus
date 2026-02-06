<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - BookMyBus</title>

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
    background-color: #f8f9fa;
  }

  /* Enhanced Navbar */
  .navbar-custom {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 15px 0;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
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

  .user-welcome {
    display: flex;
    align-items: center;
    gap: 10px;
    background: rgba(255, 255, 255, 0.15);
    padding: 8px 16px;
    border-radius: 25px;
    color: white;
    font-weight: 600;
  }

  .user-avatar {
    width: 35px;
    height: 35px;
    background: white;
    color: #667eea;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 0.9rem;
  }

  .btn-nav {
    border-radius: 25px;
    font-weight: 600;
    padding: 8px 20px;
    border: 2px solid white;
    transition: all 0.3s ease;
  }

  .btn-nav:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 255, 255, 0.3);
  }

  /* Hero Section with Search */
  .hero-section {
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.95) 0%, rgba(118, 75, 162, 0.95) 100%),
                url("${pageContext.request.contextPath}/resources/images/bus.png");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    padding: 100px 0 120px;
    color: white;
    position: relative;
    overflow: hidden;
  }

  .hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="2" fill="white" opacity="0.1"/></svg>');
    animation: float 20s linear infinite;
  }

  @keyframes float {
    from { transform: translateY(0); }
    to { transform: translateY(-100px); }
  }

  .hero-content {
    position: relative;
    z-index: 2;
  }

  .hero-title {
    font-size: 3.5rem;
    font-weight: 800;
    margin-bottom: 20px;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
    animation: fadeInDown 0.8s ease;
  }

  .hero-subtitle {
    font-size: 1.3rem;
    margin-bottom: 40px;
    opacity: 0.95;
    animation: fadeInUp 0.8s ease;
  }

  @keyframes fadeInDown {
    from {
      opacity: 0;
      transform: translateY(-30px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

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

  /* Search Card */
  .search-card {
    background: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    animation: fadeInUp 1s ease;
    position: relative;
  }

  .search-card::before {
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 20px;
    z-index: -1;
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .search-card:hover::before {
    opacity: 1;
  }

  .search-card h2 {
    color: #2c3e50;
    font-weight: 700;
    margin-bottom: 10px;
  }

  .search-card p {
    color: #6c757d;
    margin-bottom: 30px;
  }

  .form-control-custom {
    border: 2px solid #e9ecef;
    border-radius: 12px;
    padding: 15px 20px;
    font-size: 1rem;
    transition: all 0.3s ease;
  }

  .form-control-custom:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
  }

  .input-icon {
    position: absolute;
    left: 20px;
    top: 50%;
    transform: translateY(-50%);
    color: #667eea;
    font-size: 1.2rem;
  }

  .input-with-icon {
    position: relative;
  }

  .input-with-icon .form-control-custom {
    padding-left: 50px;
  }

  .search-btn {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 12px;
    font-weight: 700;
    padding: 15px 30px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    color: white;
    box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
  }

  .search-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
  }

  /* Features Section */
  .features-section {
    padding: 80px 0;
    background: white;
  }

  .section-title {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 20px;
  }

  .section-subtitle {
    text-align: center;
    color: #6c757d;
    font-size: 1.1rem;
    margin-bottom: 60px;
  }

  .feature-box {
    text-align: center;
    padding: 30px;
    border-radius: 15px;
    background: #f8f9fa;
    transition: all 0.3s ease;
    height: 100%;
    border: 2px solid transparent;
  }

  .feature-box:hover {
    transform: translateY(-10px);
    background: white;
    border-color: #667eea;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  }

  .feature-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    font-size: 2rem;
  }

  .feature-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 15px;
  }

  .feature-text {
    color: #6c757d;
    font-size: 0.95rem;
    line-height: 1.6;
  }

  /* Stats Section */
  .stats-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 60px 0;
    color: white;
  }

  .stat-box {
    text-align: center;
    padding: 20px;
  }

  .stat-number {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 10px;
  }

  .stat-label {
    font-size: 1.1rem;
    opacity: 0.95;
  }

  /* Quick Links */
  .quick-links {
    background: #f8f9fa;
    padding: 60px 0;
  }

  .link-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    text-align: center;
    transition: all 0.3s ease;
    border: 2px solid transparent;
    text-decoration: none;
    display: block;
    height: 100%;
  }

  .link-card:hover {
    transform: translateY(-5px);
    border-color: #667eea;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  }

  .link-icon {
    font-size: 3rem;
    color: #667eea;
    margin-bottom: 20px;
  }

  .link-title {
    font-size: 1.2rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 10px;
  }

  .link-description {
    color: #6c757d;
    font-size: 0.9rem;
  }

  /* Responsive Design */
  @media (max-width: 768px) {
    .hero-title {
      font-size: 2.2rem;
    }

    .hero-subtitle {
      font-size: 1.1rem;
    }

    .search-card {
      padding: 25px;
    }

    .section-title {
      font-size: 2rem;
    }

    .stat-number {
      font-size: 2.5rem;
    }

    .user-welcome {
      font-size: 0.85rem;
      padding: 6px 12px;
    }
  }
</style>

</head>
<body>

<!-- Enhanced Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center gap-2"
       href="${pageContext.request.contextPath}/user/home">
      <img src="${pageContext.request.contextPath}/resources/images/logo.png"
           alt="logo" width="45" height="45" class="rounded-circle bg-white p-1">
      <span>BookMyBus</span>
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
          <a class="nav-link active" href="${pageContext.request.contextPath}/user/home">
            <i class="fas fa-home me-1"></i>Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/search">
            <i class="fas fa-bus me-1"></i>Buses
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/myreservations">
            <i class="fas fa-ticket-alt me-1"></i>My Bookings
          </a>
        </li>
      </ul>

      <div class="d-flex align-items-center gap-3 flex-wrap">
        <div class="user-welcome">
          <div class="user-avatar">
            ${sessionScope.username.substring(0,1).toUpperCase()}
          </div>
          <span class="d-none d-md-inline">Welcome, ${sessionScope.username}</span>
        </div>
        <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-warning btn-nav">
          <i class="fas fa-sign-out-alt me-1"></i>Logout
        </a>
      </div>
    </div>
  </div>
</nav>

<!-- Hero Section with Search -->
<section class="hero-section">
  <div class="container">
    <div class="hero-content">
      <div class="text-center mb-5">
        <h1 class="hero-title">Find Your Perfect Journey</h1>
        <p class="hero-subtitle">
          <i class="fas fa-route me-2"></i>
          Book bus tickets across India with ease and comfort
        </p>
      </div>

      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="search-card">
            <h2 class="text-center">
              <i class="fas fa-search me-2"></i>Search Buses
            </h2>
            <p class="text-center">Enter your journey details to find available buses</p>

            <form action="${pageContext.request.contextPath}/search" method="post">
              <div class="row g-3">
                <div class="col-md-5">
                  <label class="form-label fw-semibold text-muted mb-2">
                    <i class="fas fa-map-marker-alt me-1"></i>From
                  </label>
                  <div class="input-with-icon">
                    <i class="fas fa-location-arrow input-icon"></i>
                    <input type="text" 
                           name="from" 
                           class="form-control form-control-custom"
                           placeholder="Enter departure city" 
                           required>
                  </div>
                </div>

                <div class="col-md-5">
                  <label class="form-label fw-semibold text-muted mb-2">
                    <i class="fas fa-map-marker-alt me-1"></i>To
                  </label>
                  <div class="input-with-icon">
                    <i class="fas fa-map-pin input-icon"></i>
                    <input type="text" 
                           name="to" 
                           class="form-control form-control-custom"
                           placeholder="Enter destination city" 
                           required>
                  </div>
                </div>

                <div class="col-md-2 d-flex align-items-end">
                  <button class="btn search-btn w-100" type="submit">
                    <i class="fas fa-search me-2"></i>Search
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section class="features-section">
  <div class="container">
    <h2 class="section-title">Why Choose Us?</h2>
    <p class="section-subtitle">Experience hassle-free bus booking with amazing benefits</p>

    <div class="row g-4">
      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-bolt"></i>
          </div>
          <h3 class="feature-title">Instant Booking</h3>
          <p class="feature-text">
            Book your bus tickets in seconds with our lightning-fast booking system
          </p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-shield-alt"></i>
          </div>
          <h3 class="feature-title">Secure Payment</h3>
          <p class="feature-text">
            Your transactions are protected with bank-grade security protocols
          </p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-headset"></i>
          </div>
          <h3 class="feature-title">24/7 Support</h3>
          <p class="feature-text">
            Our customer support team is always ready to assist you anytime
          </p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-route"></i>
          </div>
          <h3 class="feature-title">Wide Network</h3>
          <p class="feature-text">
            Access thousands of buses across major cities and routes in India
          </p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-tags"></i>
          </div>
          <h3 class="feature-title">Best Prices</h3>
          <p class="feature-text">
            Get competitive fares and exclusive discounts on your bookings
          </p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="feature-box">
          <div class="feature-icon">
            <i class="fas fa-mobile-alt"></i>
          </div>
          <h3 class="feature-title">Easy Cancellation</h3>
          <p class="feature-text">
            Cancel or modify your bookings easily with our flexible policies
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-6">
        <div class="stat-box">
          <div class="stat-number">1000+</div>
          <div class="stat-label">Buses Available</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-box">
          <div class="stat-number">500+</div>
          <div class="stat-label">Routes Covered</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-box">
          <div class="stat-number">50K+</div>
          <div class="stat-label">Happy Customers</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-box">
          <div class="stat-number">24/7</div>
          <div class="stat-label">Customer Support</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Quick Links Section -->
<section class="quick-links">
  <div class="container">
    <h2 class="section-title">Quick Actions</h2>
    <p class="section-subtitle">Access your account features quickly</p>

    <div class="row g-4">
      <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/search" class="link-card">
          <div class="link-icon">
            <i class="fas fa-search"></i>
          </div>
          <h3 class="link-title">Search Buses</h3>
          <p class="link-description">Find and book buses for your next journey</p>
        </a>
      </div>

      <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/myreservations" class="link-card">
          <div class="link-icon">
            <i class="fas fa-list-alt"></i>
          </div>
          <h3 class="link-title">My Bookings</h3>
          <p class="link-description">View and manage all your bus reservations</p>
        </a>
      </div>

      <div class="col-md-4">
        <a href="#" class="link-card">
          <div class="link-icon">
            <i class="fas fa-user-circle"></i>
          </div>
          <h3 class="link-title">My Profile</h3>
          <p class="link-description">Update your account details and preferences</p>
        </a>
      </div>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Add animation on scroll
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
    }
  });
}, observerOptions);

document.querySelectorAll('.feature-box, .link-card').forEach(el => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(30px)';
  el.style.transition = 'all 0.6s ease';
  observer.observe(el);
});

// Form validation enhancement
document.querySelector('form').addEventListener('submit', function(e) {
  const from = this.querySelector('[name="from"]').value.trim();
  const to = this.querySelector('[name="to"]').value.trim();
  
  if (from.toLowerCase() === to.toLowerCase()) {
    e.preventDefault();
    alert('Departure and destination cities cannot be the same!');
    return false;
  }
});
</script>

</body>
</html>
