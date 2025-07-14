<?php
$dsn = 'mysql:host=localhost;dbname=reseau_social;charset=utf8mb4';
$user = 'root';
$pass = '';
$options = [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ];
try { $pdo = new PDO($dsn, $user, $pass, $options); }
catch (PDOException $e) { http_response_code(500); echo $e->getMessage(); exit; }
header('Content-Type: application/json; charset=utf-8');
?>