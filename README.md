# 基于人工智能的科技金融交易与金融新闻分析Web平台

本仓库用于毕业设计项目基础脚手架，技术栈为 **Spring Boot + MySQL + Vue3**。

## 目录结构（完整设计）

```text
bysj/
├── backend/                         # Spring Boot 后端
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   ├── java/com/bysj/fintech/
│       │   │   ├── config/          # 安全、跨域、全局配置
│       │   │   ├── controller/      # 控制器层
│       │   │   ├── dto/             # 请求/响应对象
│       │   │   ├── entity/          # 实体对象
│       │   │   ├── mapper/          # MyBatis Mapper
│       │   │   ├── security/        # JWT过滤器等
│       │   │   ├── service/         # 业务接口
│       │   │   ├── service/impl/    # 业务实现
│       │   │   └── util/            # 工具类
│       │   └── resources/
│       │       └── application.yml
│       └── test/java/com/bysj/fintech/
├── frontend/                        # Vue3 前端（结构设计）
│   └── src/
│       ├── api/                     # 接口请求封装
│       ├── assets/                  # 静态资源
│       ├── components/              # 公共组件
│       ├── router/                  # 路由配置
│       ├── stores/                  # Pinia状态管理
│       ├── utils/                   # 工具函数
│       └── views/
│           ├── auth/                # 登录/注册页面
│           ├── news/                # 新闻模块页面
│           ├── trade/               # 模拟交易页面
│           ├── portfolio/           # 持仓页面
│           └── stats/               # 数据统计页面
├── docs/
│   ├── api.md                       # API接口文档
│   └── frontend-pages.md            # 前端页面结构说明
└── sql/
    └── schema.sql                   # 数据库建表脚本
```

## 快速启动（后端）

1. 执行 `sql/schema.sql` 初始化数据库。
2. 修改 `backend/src/main/resources/application.yml` 中的 MySQL 连接信息。
3. 在 `backend` 目录运行：

```bash
mvn spring-boot:run
```

## 已实现功能

- 用户注册
- 用户登录（JWT令牌）

其余模块（新闻、交易、持仓、统计）可在此架构上继续扩展。
