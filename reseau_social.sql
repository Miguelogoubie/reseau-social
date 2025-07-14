CREATE DATABASE IF NOT EXISTS reseau_social CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE reseau_social;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prenom VARCHAR(50),
  nom VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(255),
  avatar VARCHAR(255) DEFAULT 'assets/images/default-avatar.png',
  role ENUM('user','moderator','admin') DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  contenu TEXT,
  image VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE likes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT,
  user_id INT,
  liked TINYINT(1) DEFAULT 1,
  UNIQUE KEY unique_like(post_id,user_id),
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT,
  user_id INT,
  commentaire TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);