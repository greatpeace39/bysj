CREATE DATABASE IF NOT EXISTS fintech_platform DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE fintech_platform;

-- 1. 用户表
CREATE TABLE IF NOT EXISTS sys_user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '登录用户名',
    password VARCHAR(100) NOT NULL COMMENT 'BCrypt加密密码',
    nickname VARCHAR(50) NOT NULL COMMENT '用户昵称',
    email VARCHAR(100) NULL COMMENT '邮箱',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态:1正常,0禁用',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT='系统用户表';

-- 2. 金融新闻表
CREATE TABLE IF NOT EXISTS news_article (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    summary VARCHAR(1000) NULL,
    source VARCHAR(100) NULL,
    publish_time DATETIME NOT NULL,
    sentiment_score DECIMAL(5,2) NULL COMMENT '情感分数(-1~1可映射为百分)',
    url VARCHAR(500) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) COMMENT='金融新闻表';

-- 3. 股票基础信息表
CREATE TABLE IF NOT EXISTS stock_info (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    stock_code VARCHAR(20) NOT NULL UNIQUE,
    stock_name VARCHAR(100) NOT NULL,
    market VARCHAR(20) NOT NULL COMMENT 'SH/SZ/US',
    latest_price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT='股票信息表';

-- 4. 模拟资金账户表
CREATE TABLE IF NOT EXISTS account_balance (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    total_asset DECIMAL(14,2) NOT NULL DEFAULT 100000.00,
    available_cash DECIMAL(14,2) NOT NULL DEFAULT 100000.00,
    frozen_cash DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_account_user (user_id),
    CONSTRAINT fk_account_user FOREIGN KEY (user_id) REFERENCES sys_user(id)
) COMMENT='模拟账户资金表';

-- 5. 持仓表
CREATE TABLE IF NOT EXISTS user_position (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    stock_code VARCHAR(20) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    avg_cost DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    market_value DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    floating_profit DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_stock (user_id, stock_code),
    CONSTRAINT fk_position_user FOREIGN KEY (user_id) REFERENCES sys_user(id)
) COMMENT='用户持仓表';

-- 6. 模拟交易订单表
CREATE TABLE IF NOT EXISTS trade_order (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_no VARCHAR(64) NOT NULL UNIQUE,
    user_id BIGINT NOT NULL,
    stock_code VARCHAR(20) NOT NULL,
    trade_type TINYINT NOT NULL COMMENT '1买入,2卖出',
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(14,2) NOT NULL,
    status TINYINT NOT NULL DEFAULT 2 COMMENT '1待成交,2已成交,3已撤单',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES sys_user(id)
) COMMENT='模拟交易订单表';

-- 7. 数据统计快照表（可选，便于展示趋势图）
CREATE TABLE IF NOT EXISTS stats_snapshot (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    stat_date DATE NOT NULL,
    total_asset DECIMAL(14,2) NOT NULL,
    total_profit DECIMAL(14,2) NOT NULL,
    win_rate DECIMAL(5,2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_date (user_id, stat_date),
    CONSTRAINT fk_stats_user FOREIGN KEY (user_id) REFERENCES sys_user(id)
) COMMENT='用户统计快照表';
