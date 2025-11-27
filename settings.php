<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>settings</title>
    <link rel="icon" href="images/logo.png" type="image/png" />
    <link rel="stylesheet" href="user_page.css" />
    <link rel="stylesheet" href="main.css" />
  </head>
  <body>
    <div class="fadeInUp-animation">
      <div class="top-header">
        <div class="profile-section">
          <a href="user_page.php"><img src="images/profile.jpg" alt="Profile" /></a>
          <h1>Settings</h1>
        </div>
        <button class="hamburger" id="hamburger">☰</button>
      </div>

      <!-- Same side menu for consistency -->
      <nav class="side-menu" id="sideMenu">
        <ul>
          <li><a href="user_page.php">🏠 My Shelf</a></li>
          <li><a href="index.php">🚪 Logout</a></li>
        </ul>
      </nav>

      <section class="settings-page">
        <h2>Profile</h2>
        <label>Change Profile Picture:</label>
        <div class="pic-options">
            <img src="images/rabbit.jpg" class="option" />
            <img src="images/cat.jpg" class="option" />
            <img src="images/penguin.jpg" class="option" />
            <img src="images/bear.jpg" class="option" />
          </div>
        <label>Username:</label>
        <input class="username" type="text" placeholder="Enter new username"  />
        

        <h2>Account</h2>
        <label>Change Password:</label>
        <input class="password" type="password" placeholder="New password" />

        <button class="save-btn" onclick="savechanges()">Save Changes</button>
      </section>
    </div>
    <script>
      const hamburger = document.getElementById("hamburger");
      const sideMenu = document.getElementById("sideMenu");

      hamburger.addEventListener("click", () => {
        sideMenu.classList.toggle("open");
      });

      window.addEventListener("click", (e) => {
        if (!sideMenu.contains(e.target) && e.target !== hamburger) {
          sideMenu.classList.remove("open");
        }
      });

        function savechanges() {
           let username = document.querySelector(".username").value;
            let password = document.querySelector(".password").value;
            if(username!="" && password!=""){
                alert("Changes saved successfully!");
                window.location.href = "user_page.php";
            }else{
                alert("Please fill in all fields.");
            }
        }
    </script>

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
