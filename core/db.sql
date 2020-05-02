CREATE TABLE `bookmarks` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `uid` tinyint(4) DEFAULT NULL,
    `name` tinytext,
    `createTime` tinytext,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bookmarks_mapping` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `bookmarkId` tinyint(4) DEFAULT NULL,
    `metadataId` int(11) DEFAULT NULL,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `drivers` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` tinytext NOT NULL,
    `driverType` tinytext NOT NULL,
    `driverData` longtext NOT NULL,
    `isEnable` tinyint(4) DEFAULT '0',
    `createTime` tinytext NOT NULL,
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `files` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `driverId` tinyint(4) NOT NULL,
    `storageData` tinytext NOT NULL,
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ignore` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `data` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `metadatas` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `title` text NOT NULL,
    `companyName` tinytext NOT NULL,
    `companyId` tinytext NOT NULL,
    `posterFileURL` text,
    `releaseDate` tinytext NOT NULL,
    `screenshotFilesURL` text,
    `version` tinyint(4) DEFAULT '1',
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `series` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` text NOT NULL,
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `series_mapping` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `metadataId` int(11) DEFAULT NULL,
    `seriesId` int(11) DEFAULT NULL,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `stars` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` tinytext NOT NULL,
    `photoURL` text,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `stars_mapping` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `metadataId` int(11) DEFAULT NULL,
    `starId` int(11) DEFAULT NULL,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tags` (
    `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
    `name` tinytext,
    `updateTime` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tags_mapping` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `metadataId` int(11) NOT NULL,
    `tagId` smallint(6) NOT NULL,
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `username` tinytext,
    `password` tinytext,
    `token` tinytext,
    `updateTime` tinytext,
    `lastSeen` tinytext,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `videos` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `metadataId` int(11) NOT NULL,
    `videoFileId` int(11) DEFAULT NULL,
    `isHiden` char(1) DEFAULT '0',
    `infoFileId` int(11) NOT NULL,
    `videoMetadata` json NOT NULL,
    `version` tinyint(4) DEFAULT '1',
    `storyboardFileIdSet` json NOT NULL,
    `updateTime` tinytext NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `username`, `password`, `token`, `updateTime`, `lastSeen`) VALUES
(1, 'admin', '$2b$10$pOavdaA2Pb4HXTCqecCbA.wepz0ArXjrNAn35mSwB55K43HVSdGbi', 'defaultToken', '1584191526287', '1584191526287');