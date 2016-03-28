DROP USER 'tbu'@'localhost';

DROP DATABASE IF EXISTS `core-services`;
DROP DATABASE IF EXISTS `group-schedule`;

CREATE DATABASE `core-services` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `group-schedule` CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON `core-services`.* To 'tbu'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `core-services`.* To 'tbu'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON `group-schedule`.* To 'tbu'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `group-schedule`.* To 'tbu'@'%' IDENTIFIED BY 'password';

FLUSH PRIVILEGES;