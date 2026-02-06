<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMyBus - Bus Reservation System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

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

  /* Navbar Styles */
  .navbar-custom {
    background: linear-gradient(90deg, #ffd700, #ffed4e);
    padding: 12px 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }

  .navbar-custom .navbar-brand {
    font-weight: 700;
    font-size: 24px;
    color: #2c3e50 !important;
  }

  .navbar-custom .nav-link {
    color: #2c3e50 !important;
    font-weight: 500;
    margin: 0 6px;
    border-radius: 8px;
    padding: 6px 12px;
    transition: all 0.3s ease;
  }

  .navbar-custom .nav-link:hover {
    background: rgba(255,255,255,0.3);
  }

  .btn-nav {
    border-radius: 10px;
    font-weight: 600;
    padding: 8px 16px;
    border: none;
    transition: all 0.3s ease;
  }

  .btn-nav:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  }

  /* Hero Section */
  .hero-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 80px 0;
    color: white;
  }

  .hero-content {
    text-align: center;
  }

  .hero-content h1 {
    font-size: 3.5rem;
    font-weight: 800;
    margin-bottom: 20px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
  }

  .hero-content p {
    font-size: 1.3rem;
    margin-bottom: 30px;
    opacity: 0.95;
  }

  /* Routes Section */
  .routes-section {
    padding: 80px 0;
    background-color: #ffffff;
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
    margin-bottom: 50px;
  }

  .routes-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
  }

  .routes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 24px;
  }

  .route-card {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 20px;
    background: white;
    border: 1px solid #e9ecef;
    border-radius: 12px;
    transition: all 0.3s ease;
    cursor: pointer;
  }

  .route-card:hover {
    background-color: #f8f9fa;
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
    border-color: #667eea;
  }

  .route-image {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    object-fit: cover;
    flex-shrink: 0;
    border: 3px solid #f0f0f0;
  }

  .route-info {
    flex: 1;
  }

  .route-title {
    font-size: 18px;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 8px;
  }

  .route-destinations {
    font-size: 14px;
    color: #6c757d;
    line-height: 1.5;
  }

  /* Features Section */
  .features-section {
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    padding: 80px 0;
  }

  .feature-card {
    text-align: center;
    padding: 40px 20px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    height: 100%;
  }

  .feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
  }

  .feature-icon {
    font-size: 3rem;
    margin-bottom: 20px;
    color: #667eea;
  }

  .feature-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 10px;
  }

  .feature-text {
    color: #6c757d;
    font-size: 0.95rem;
  }

  /* Footer */
  .footer {
    background-color: #2c3e50;
    color: white;
    padding: 40px 0 20px;
    text-align: center;
  }

  .footer p {
    margin: 10px 0;
    opacity: 0.9;
  }

  /* Responsive Design */
  @media (max-width: 768px) {
    .hero-content h1 {
      font-size: 2.5rem;
    }

    .hero-content p {
      font-size: 1.1rem;
    }

    .section-title {
      font-size: 2rem;
    }

    .routes-grid {
      grid-template-columns: 1fr;
    }

    .route-card {
      padding: 16px;
    }

    .route-title {
      font-size: 16px;
    }

    .route-destinations {
      font-size: 13px;
    }
  }
</style>

</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-custom shadow-sm">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/resources/images/logo-of-bus-icon.jpg"
           alt="logo" width="45" height="45" class="rounded-circle bg-white p-1">
      <span>BookMyBus</span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" 
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto ms-3"></ul>
      
      <div class="d-flex gap-2 flex-wrap">
        <a href="${pageContext.request.contextPath}/admin/login" 
           class="btn btn-light btn-nav">
          Admin Login
        </a>
        <a href="${pageContext.request.contextPath}/user/login" 
           class="btn btn-warning btn-nav">
          User Login
        </a>
        <a href="${pageContext.request.contextPath}/user/register" 
           class="btn btn-dark btn-nav">
          Register
        </a>
      </div>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
  <div class="container">
    <div class="hero-content">
      <h1>Welcome to BookMyBus</h1>
      <p>Your Journey Starts Here - Book Bus Tickets Online</p>
      <a href="${pageContext.request.contextPath}/user/register" 
         class="btn btn-light btn-lg px-5 py-3 rounded-pill">
        Get Started
      </a>
    </div>
  </div>
</section>

<!-- Popular Routes Section -->
<section class="routes-section">
  <div class="container">
    <h2 class="section-title">Popular Bus Routes</h2>
    <p class="section-subtitle">Explore top destinations across India</p>
    
    <div class="routes-container">
      <div class="routes-grid">
        
        <!-- Bangalore Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/bangalore.jpg" 
               alt="Bangalore" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Bangalore To</div>
            <div class="route-destinations">Chennai, Hyderabad, Coimbatore, Mumbai, Goa</div>
          </div>
        </div>

        <!-- Chennai Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/chennai.jpg" 
               alt="Chennai" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Chennai To</div>
            <div class="route-destinations">Bangalore, Coimbatore, Madurai, Hyderabad, Trichy</div>
          </div>
        </div>

        <!-- Hyderabad Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/hyderabad.jpg" 
               alt="Hyderabad" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Hyderabad To</div>
            <div class="route-destinations">Bangalore, Chennai, Mumbai, Pune, Vijayawada</div>
          </div>
        </div>

        <!-- Pune Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/pune.jpg" 
               alt="Pune" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Pune To</div>
            <div class="route-destinations">Goa, Bangalore, Nagpur, Hyderabad, Mumbai</div>
          </div>
        </div>

        <!-- Delhi Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/delhi.jpg" 
               alt="Delhi" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Delhi To</div>
            <div class="route-destinations">Lucknow, Dehradun, Manali, Kanpur, Jaipur</div>
          </div>
        </div>

        <!-- Mumbai Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/mumbai.jpg" 
               alt="Mumbai" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Mumbai To</div>
            <div class="route-destinations">Bangalore, Goa, Pune, Indore, Ahmedabad</div>
          </div>
        </div>

        <!-- Ahmedabad Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/ahmedabad.jpg" 
               alt="Ahmedabad" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Ahmedabad To</div>
            <div class="route-destinations">Mumbai, Rajkot, Surat, Pune, Indore</div>
          </div>
        </div>

        <!-- Coimbatore Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/coimbatore.jpg" 
               alt="Coimbatore" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Coimbatore To</div>
            <div class="route-destinations">Chennai, Bangalore, Madurai, Pondicherry, Nagercoil</div>
          </div>
        </div>

        <!-- Kolkata Routes -->
        <div class="route-card">
          <img src="${pageContext.request.contextPath}/resources/images/kolkata.jpg" 
               alt="Kolkata" class="route-image">
          <div class="route-info">
            <div class="route-title">Buses From Kolkata To</div>
            <div class="route-destinations">Durgapur, Asansol, Siliguri, Bhubaneshwar, Bardhaman</div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section class="features-section">
  <div class="container">
    <h2 class="section-title">Why Choose BookMyBus?</h2>
    <p class="section-subtitle">Experience hassle-free bus booking with amazing benefits</p>
    
    <div class="row g-4 mt-4">
      <div class="col-md-4">
        <div class="feature-card">
          <div class="feature-icon">🚌</div>
          <h3 class="feature-title">Wide Network</h3>
          <p class="feature-text">Access to thousands of buses across major cities in India</p>
        </div>
      </div>
      
      <div class="col-md-4">
        <div class="feature-card">
          <div class="feature-icon">💳</div>
          <h3 class="feature-title">Secure Payment</h3>
          <p class="feature-text">Safe and secure payment options for your convenience</p>
        </div>
      </div>
      
      <div class="col-md-4">
        <div class="feature-card">
          <div class="feature-icon">⚡</div>
          <h3 class="feature-title">Instant Booking</h3>
          <p class="feature-text">Quick and easy booking process with instant confirmation</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <p class="mb-2">&copy; 2026 BookMyBus. All Rights Reserved.</p>
    <p>Your trusted partner for bus travel across India</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

