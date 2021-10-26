DROP DATABASE structure;
CREATE DATABASE IF NOT EXISTS structure;
USE structure ;

CREATE TABLE IF NOT EXISTS categories (
  id INT(10) NOT NULL AUTO_INCREMENT,
  category ENUM('tazas', 'termos', 'gorras', 'playeras', 'llaveros', 'rompecabezas', 'especiales') NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB; 

CREATE TABLE IF NOT EXISTS permissions (
  id INT(10) NOT NULL AUTO_INCREMENT,
  rol VARCHAR(30) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS product_images (
   id INT(10) NOT NULL AUTO_INCREMENT,
   url VARCHAR(500) NOT NULL,
   PRIMARY KEY (id))
   ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS products (
  id INT(10) NOT NULL AUTO_INCREMENT,
  category_id INT(10) NOT NULL,
  productName VARCHAR(255) NOT NULL,
  descriptionn TEXT NOT NULL,
  price INT NOT NULL,
  quantity INT(10) NOT NULL,
  product_images_id INT(10) NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (category_id)
    REFERENCES categories(id),
    FOREIGN KEY (product_images_id)
    REFERENCES product_images(id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS user_images (
  id INT(10) AUTO_INCREMENT,
  url VARCHAR(500) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS users(
  id INT(10) NOT NULL AUTO_INCREMENT,
  userName VARCHAR(255) NOT NULL,
  id_rol INT(10) NOT NULL,
  email VARCHAR(255) NOT NULL,
  passwordd VARCHAR(255) NOT NULL,
  user_images_id INT(10),
  PRIMARY KEY (id),
    FOREIGN KEY (id_rol)
    REFERENCES permissions (id),
    FOREIGN KEY (user_images_id)
    REFERENCES user_images(id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS user_carts (
  id INT(10)  NOT NULL,
  user_id INT(10)  NOT NULL,
  product_id INT(10) NOT NULL,
  cart_status VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (user_id)
    REFERENCES users (id),
    FOREIGN KEY (product_id)
    REFERENCES products (id))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

