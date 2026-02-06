<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration - BookMyBus</title>
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
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    padding: 40px 0;
  }

  .registration-container {
    max-width: 900px;
    margin: 0 auto;
  }

  .register-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    overflow: hidden;
  }

  .register-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 40px 30px;
    text-align: center;
  }

  .register-header img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: white;
    padding: 10px;
    margin-bottom: 20px;
  }

  .register-header h2 {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 10px;
  }

  .register-header p {
    font-size: 1rem;
    opacity: 0.95;
    margin-bottom: 0;
  }

  .register-body {
    padding: 40px 50px;
  }

  .section-title {
    font-size: 1.1rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #f0f0f0;
  }

  .form-label {
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 8px;
    font-size: 0.9rem;
  }

  .form-label .required {
    color: #dc3545;
    margin-left: 3px;
  }

  .form-control {
    border-radius: 10px;
    padding: 12px 15px;
    border: 2px solid #e9ecef;
    transition: all 0.3s ease;
    font-size: 0.95rem;
  }

  .form-control:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
  }

  .input-group-text {
    background: white;
    border: 2px solid #e9ecef;
    border-right: none;
    border-radius: 10px 0 0 10px;
    color: #667eea;
  }

  .input-group .form-control {
    border-left: none;
    border-radius: 0 10px 10px 0;
  }

  .input-group:focus-within .input-group-text {
    border-color: #667eea;
  }

  .btn-register {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 12px;
    font-weight: 700;
    padding: 14px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    color: white;
  }

  .btn-register:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
    background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
  }

  .divider {
    display: flex;
    align-items: center;
    text-align: center;
    margin: 25px 0;
  }

  .divider::before,
  .divider::after {
    content: '';
    flex: 1;
    border-bottom: 1px solid #dee2e6;
  }

  .divider span {
    padding: 0 15px;
    color: #6c757d;
    font-size: 0.9rem;
  }

  .footer-links {
    text-align: center;
    padding: 20px 0;
    background: #f8f9fa;
  }

  .footer-links a {
    color: #667eea;
    text-decoration: none;
    font-weight: 600;
    margin: 0 15px;
    transition: all 0.3s ease;
  }

  .footer-links a:hover {
    color: #764ba2;
    text-decoration: underline;
  }

  .info-box {
    background: #f8f9ff;
    border-left: 4px solid #667eea;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 25px;
  }

  .info-box i {
    color: #667eea;
    margin-right: 10px;
  }

  .info-box p {
    margin: 0;
    color: #495057;
    font-size: 0.9rem;
  }

  .password-strength {
    font-size: 0.85rem;
    margin-top: 5px;
  }

  @media (max-width: 768px) {
    .register-body {
      padding: 30px 20px;
    }

    .register-header {
      padding: 30px 20px;
    }

    .register-header h2 {
      font-size: 1.5rem;
    }

    .footer-links a {
      display: block;
      margin: 10px 0;
    }
  }
</style>
</head>

<body>

<div class="container registration-container">
  <div class="register-card">
    
    <!-- Header Section -->
    <div class="register-header">
      <img src="${pageContext.request.contextPath}/resources/images/logo-of-bus-icon.jpg" 
           alt="BookMyBus Logo">
      <h2>User Registration</h2>
      <p>Create your account to start booking bus tickets</p>
    </div>

    <!-- Body Section -->
    <div class="register-body">
      
      <!-- Info Box -->
      <div class="info-box">
        <i class="fas fa-info-circle"></i>
        <strong>Important:</strong>
        <p class="d-inline">Please fill in all required fields marked with <span class="text-danger">*</span> to complete your registration.</p>
      </div>

      <form action="${pageContext.request.contextPath}/user/register" method="post" id="registrationForm">
        
        <!-- Personal Information Section -->
        <div class="section-title">
          <i class="fas fa-user me-2"></i>Personal Information
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">
              First Name <span class="required">*</span>
            </label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
              <input type="text" 
                     name="firstName" 
                     class="form-control" 
                     placeholder="Enter your first name" 
                     required
                     pattern="[A-Za-z\s]+"
                     title="Please enter letters only">
            </div>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label">
              Last Name <span class="required">*</span>
            </label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
              <input type="text" 
                     name="lastName" 
                     class="form-control" 
                     placeholder="Enter your last name" 
                     required
                     pattern="[A-Za-z\s]+"
                     title="Please enter letters only">
            </div>
          </div>
        </div>

        <!-- Account Credentials Section -->
        <div class="section-title mt-4">
          <i class="fas fa-lock me-2"></i>Account Credentials
        </div>

        <div class="mb-3">
          <label class="form-label">
            Username <span class="required">*</span>
          </label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-at"></i></span>
            <input type="text" 
                   name="username" 
                   class="form-control" 
                   placeholder="Choose a unique username" 
                   required
                   minlength="4"
                   pattern="[A-Za-z0-9_]+"
                   title="Username must be at least 4 characters (letters, numbers, underscore only)">
          </div>
          <small class="text-muted">Username must be at least 4 characters long</small>
        </div>

        <div class="mb-3">
          <label class="form-label">
            Password <span class="required">*</span>
          </label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-key"></i></span>
            <input type="password" 
                   name="password" 
                   id="password"
                   class="form-control" 
                   placeholder="Create a strong password" 
                   required
                   minlength="6">
          </div>
          <small class="text-muted">Password must be at least 6 characters long</small>
        </div>

        <!-- Contact Information Section -->
        <div class="section-title mt-4">
          <i class="fas fa-address-book me-2"></i>Contact Information
        </div>

        <div class="mb-3">
          <label class="form-label">
            Contact Number <span class="required">*</span>
          </label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-phone"></i></span>
            <input type="tel" 
                   name="contact" 
                   class="form-control" 
                   placeholder="Enter 10-digit mobile number" 
                   required
                   pattern="[0-9]{10}"
                   title="Please enter a valid 10-digit mobile number">
          </div>
          <small class="text-muted">Enter your 10-digit mobile number</small>
        </div>

        <div class="mb-4">
          <label class="form-label">
            Email Address <span class="required">*</span>
          </label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
            <input type="email" 
                   name="email" 
                   class="form-control" 
                   placeholder="Enter your email address" 
                   required>
          </div>
          <small class="text-muted">We'll send booking confirmations to this email</small>
        </div>

        <!-- Terms and Conditions -->
        <div class="form-check mb-4">
          <input class="form-check-input" 
                 type="checkbox" 
                 id="termsCheck" 
                 required>
          <label class="form-check-label" for="termsCheck">
            I agree to the <a href="#" class="text-decoration-none">Terms and Conditions</a> and 
            <a href="#" class="text-decoration-none">Privacy Policy</a>
          </label>
        </div>

        <!-- Submit Button -->
        <div class="d-grid">
          <button type="submit" class="btn btn-register">
            <i class="fas fa-user-plus me-2"></i>Create Account
          </button>
        </div>

      </form>

      <!-- Divider -->
      <div class="divider">
        <span>Already have an account?</span>
      </div>

      <!-- Login Link -->
      <div class="text-center">
        <a href="${pageContext.request.contextPath}/user/login" 
           class="btn btn-outline-secondary rounded-pill px-4">
          <i class="fas fa-sign-in-alt me-2"></i>Login to Your Account
        </a>
      </div>

    </div>

    <!-- Footer Links -->
    <div class="footer-links">
      <a href="${pageContext.request.contextPath}/">
        <i class="fas fa-home me-1"></i>Back to Home
      </a>
      <a href="#">
        <i class="fas fa-question-circle me-1"></i>Help & Support
      </a>
      <a href="#">
        <i class="fas fa-shield-alt me-1"></i>Privacy Policy
      </a>
    </div>

  </div>

  <!-- Copyright -->
  <div class="text-center mt-4">
    <p class="text-white mb-0">
      <small>&copy; 2026 BookMyBus. All rights reserved.</small>
    </p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Form validation enhancement
document.getElementById('registrationForm').addEventListener('submit', function(e) {
  const password = document.getElementById('password').value;
  
  if (password.length < 6) {
    e.preventDefault();
    alert('Password must be at least 6 characters long');
    return false;
  }
});

// Real-time validation feedback
document.querySelectorAll('.form-control').forEach(input => {
  input.addEventListener('blur', function() {
    if (this.checkValidity()) {
      this.classList.remove('is-invalid');
      this.classList.add('is-valid');
    } else {
      this.classList.remove('is-valid');
      this.classList.add('is-invalid');
    }
  });
});
</script>

</body>
</html>
