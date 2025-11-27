<?php
// Start the session
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Security improvement: regenerate session ID occasionally
if (!isset($_SESSION['regenerated'])) {
    session_regenerate_id(true);
    $_SESSION['regenerated'] = true;
}

// Optional: Prevent pages from being accessed without login

    if (!isset($_SESSION['userID'])) {
header("Location: login.php?error=not_logged_in");     
exit;
    }


/*Optional: Check admin role
function requireAdmin() {
    if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
        header("Location: log.php");
        exit;
    }
}
?>*/