

PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS news_article;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS relationship;



CREATE TABLE `users` (
    `userId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `email` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `displayName` TEXT NOT NULL
);

INSERT INTO users
VALUES (null, 'lesley@lesley.com', 'pass', 'lesley');
INSERT INTO users
VALUES (null, 'sallly@sallly.com', 'pass', 'sally');
INSERT INTO users
VALUES (null, 'fred@fred.com', 'pass', 'fred');

CREATE TABLE 'message' (
    'msgId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    'text' TEXT NOT NULL,
    'isEdited' TEXT NOT NULL,
    `userId` INTEGER NOT NULL,
    FOREIGN KEY(`userId`)
    REFERENCES `users`(`userId`)
    ON DELETE cascade
);


INSERT INTO message
SELECT null, "Hi", "True", userId
FROM users u
WHERE u.userId = 3;

CREATE TABLE 'events'(
    'eventsId'INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    'name' TEXT NOT NULL,
    'location' TEXT NOT NULL,
    'date' TEXT NOT NULL,
    `userId` INTEGER NOT NULL,
    FOREIGN KEY(`userId`)
    REFERENCES `users`(`userId`)
    ON DELETE cascade
);

INSERT INTO events
SELECT null, "Software Beginners Meetup", "Asurion","1-23-2019", userId
FROM users u
WHERE u.userId = 1;

CREATE TABLE 'news_article'(
    'news_articleId'INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    'title' TEXT NOT NULL,
    'summary' TEXT NOT NULL,
    'timestamp' TEXT NOT NULL,
    'url' TEXT NOT NULL,
    `userId` INTEGER NOT NULL,
    FOREIGN KEY(`userId`)
    REFERENCES `users`(`userId`)
    ON DELETE cascade
);

INSERT INTO news_article
SELECT null, "Netflix Raises Prices", "All new users and existing users will be charged more monthly.","1-16-2019","www.google.com", userId
FROM users u
WHERE u.userId = 2;

CREATE TABLE 'task' (
    'taskId'INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    'dueBy' TEXT NOT NULL,
    'name' TEXT NOT NULL,
    'status' TEXT NOT NULL,
    `userId` INTEGER NOT NULL,
    FOREIGN KEY(`userId`)
    REFERENCES `users`(`userId`)
    ON DELETE cascade
);

INSERT INTO task
SELECT null, "1-18-2019", "Update Resume","completed", userId
FROM users u
WHERE u.userId = 1;

CREATE TABLE `relationship` (
    `relationshipId`INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `userId`INTEGER NOT NULL,
    `friendId`INTEGER NOT NULL,
    FOREIGN KEY(`friendId`) REFERENCES `user`(`userId`),
    FOREIGN KEY(`userId`) REFERENCES `user`(`userId`)
);
