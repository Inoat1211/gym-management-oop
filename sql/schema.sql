CREATE DATABASE IF NOT EXISTS gym_management
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gym_management;

CREATE TABLE tbl_member (
    member_id  VARCHAR(20)  NOT NULL,
    full_name  VARCHAR(100) NOT NULL,
    phone      VARCHAR(15)  NOT NULL,
    dob        DATE         NOT NULL,
    gender     VARCHAR(10)  NOT NULL,
    height     DOUBLE       NOT NULL,
    weight     DOUBLE       NOT NULL,
    email      VARCHAR(100) NULL,
    created_at DATE         NOT NULL,
    PRIMARY KEY (member_id),
    UNIQUE KEY uq_member_phone (phone),
    CONSTRAINT chk_member_height CHECK (height > 0),
    CONSTRAINT chk_member_weight CHECK (weight > 0)
) ENGINE = InnoDB;

CREATE TABLE tbl_membership_card (
    card_id            VARCHAR(20)   NOT NULL,
    member_id          VARCHAR(20)   NOT NULL,
    card_type          VARCHAR(20)   NOT NULL,
    start_date         DATE          NOT NULL,
    end_date           DATE          NOT NULL,
    remaining_sessions INT           NULL,
    frozen_days_used   INT           NOT NULL DEFAULT 0,
    vip_benefit        VARCHAR(255)  NULL,
    price              DECIMAL(12,0) NOT NULL,
    PRIMARY KEY (card_id),
    CONSTRAINT fk_card_member FOREIGN KEY (member_id) REFERENCES tbl_member (member_id),
    CONSTRAINT chk_card_type CHECK (card_type IN ('SESSION', 'MONTHLY', 'YEARLY', 'VIP')),
    CONSTRAINT chk_card_dates CHECK (end_date >= start_date)
) ENGINE = InnoDB;

CREATE TABLE tbl_checkin_log (
    log_id        INT          NOT NULL AUTO_INCREMENT,
    card_id       VARCHAR(20)  NOT NULL,
    checkin_time  DATETIME     NOT NULL,
    checkout_time DATETIME     NULL,
    note          VARCHAR(255) NULL,
    PRIMARY KEY (log_id),
    CONSTRAINT fk_log_card FOREIGN KEY (card_id) REFERENCES tbl_membership_card (card_id),
    CONSTRAINT chk_log_time CHECK (checkout_time IS NULL OR checkout_time >= checkin_time)
) ENGINE = InnoDB;
