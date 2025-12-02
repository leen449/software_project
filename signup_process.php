<?php
require 'connection.php';
require 'session.php'; // only for session_start()

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: sign.php");
    exit;
}

$username = trim($_POST['username'] ?? '');
$email    = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($username === '' || $email === '' || $password === '') {
    header("Location: sign.php?error=missing");
    exit;
}

// 1) check if email exists
$stmt = $conn->prepare("SELECT userID FROM user WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$exists = $stmt->get_result()->num_rows > 0;
$stmt->close();

if ($exists) {
    header("Location: sign.php?error=emailExists");
    exit;
}

// 2) hash password
$hashed = password_hash($password, PASSWORD_BCRYPT);

// default profile picture (you already use animal images, choose one)
$defaultPic = 'user.png'; // أو أي صورة افتراضية عندك

// 3) insert user
$stmt = $conn->prepare("
    INSERT INTO user (username, email, password, profilePicture, createdAt)
    VALUES (?, ?, ?, ?, NOW())
");
$stmt->bind_param("ssss", $username, $email, $hashed, $defaultPic);
$stmt->execute();
$newUserId = $stmt->insert_id;
$stmt->close();

// 4) create shelf row for this user
$stmt = $conn->prepare("INSERT INTO shelf (userID) VALUES (?)");
$stmt->bind_param("i", $newUserId);
$stmt->execute();
$stmt->close();

header("Location: home.php");

exit;
