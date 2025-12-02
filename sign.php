<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up - StoryLense</title>
    <link rel="icon" href="images/logo.png" type="image/png" />
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="sign.css" />
  </head>
  <body>
    <!-- Header -->
    <header>
      <div class="header-content">
        <img src="images/logo.jpg" alt="StoryLense Logo" class="logo" />
      </div>
    </header>

    <!-- Sign Up Section -->
    <main class="signup-main">
      <div class="signup-box">
        <h2>Create an Account</h2>

        <form class="signup-form" action="signup_process.php" method="POST">
          <input
            type="text"
            name="username"
            placeholder="Username"
            required
          />
          <input
            type="email"
            name="email"
            placeholder="Email Address"
            required
          />
          <input
            type="password"
            name="password"
            placeholder="Password"
            required
          />

          <button type="submit">Sign Up</button>

          <?php if (isset($_GET['error']) && $_GET['error'] === 'emailExists'): ?>
              <p class="error-message">This email is already registered.</p>
          <?php elseif (isset($_GET['success'])): ?>
              <p class="success-message">Account created! You can log in now.</p>
          <?php endif; ?>
        </form>


        <div class="login-link">
          Already have an account? <a href="log.php">Login</a>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <footer>
      <div class="footer-content">
        <div class="vision-title">OUR VISION</div>
        <div class="vision-text">
          At StoryLense, we make rating movies simple, engaging, and accessible
          for everyone
        </div>
        <div class="copyright">&copy; StoryLense. All rights reserved.</div>
        <div class="social-icons">
          <img src="images/x-logo.png" alt="X" class="social-icon" />
          <img
            src="images/instagram-logo.png"
            alt="Instagram"
            class="social-icon"
          />
        </div>
      </div>
    </footer>

    <script>
      const options = document.querySelectorAll(".option");

      options.forEach((option) => {
        option.addEventListener("click", () => {
          options.forEach((opt) => opt.classList.remove("selected"));
          option.classList.add("selected");
        });
      });
    </script>
    
  </body>
</html>
