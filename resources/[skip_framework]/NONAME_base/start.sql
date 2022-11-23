CREATE DATABASE IF NOT EXISTS `NONAME`;

USE `NONAME`;


CREATE TABLE `users`(
    `identifier` varchar(40) NOT NULL,
    PRIMARY KEY (`identifier`)
);


CREATE TABLE `players` (
    `id` int(50) NOT NULL,
    `identifier` varchar(50) DEFAULT NULL,
    `license` varchar(50) DEFAULT NULL,
    `name` varchar(50) DEFAULT NULL,
    `cid` int(11) DEFAULT NULL,
    `cash` int(11) DEFAULT NULL,
    `bank` int(11) DEFAULT NULL,
    `firstname` varchar(50) DEFAULT NULL,
    `lastname` varchar(50) DEFAULT NULL,
    `sex` varchar(50) DEFAULT NULL,
    `dob` varchar(50) DEFAULT NULL,
    `job` varchar(50) DEFAULT 'unemployed',
    `phone` text DEFAULT NULL,
    `citizenid` varchar(200) DEFAULT NULL,
    `new` boolean DEFAULT true
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `players`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `players`
    MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;