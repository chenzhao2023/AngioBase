CREATE USER 'angiobase_root' IDENTIFIED BY 'web_DB_password_123456';
GRANT ALL PRIVILEGES ON *.* TO 'angiobase_root'@'%';
FLUSH PRIVILEGES;