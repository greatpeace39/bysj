# 前端页面结构设计（Vue3）

## 路由建议

| 路由 | 页面 | 功能 |
|---|---|---|
| `/login` | 登录页 | 用户登录 |
| `/register` | 注册页 | 用户注册 |
| `/dashboard` | 仪表盘 | 总览（资产、新闻、收益） |
| `/news` | 新闻列表页 | 金融新闻展示与筛选 |
| `/trade` | 模拟交易页 | 买入/卖出下单 |
| `/portfolio` | 持仓页 | 当前持仓、盈亏 |
| `/stats` | 数据统计页 | 收益曲线、胜率、交易分布 |

## 页面模块拆分

### 1) 登录/注册（`views/auth/`）
- `LoginView.vue`
- `RegisterView.vue`

### 2) 新闻模块（`views/news/`）
- `NewsListView.vue`
- `NewsDetailDrawer.vue`（可作为组件）

### 3) 交易模块（`views/trade/`）
- `TradeView.vue`
- 包含：股票搜索、盘口简表、买卖表单、委托记录

### 4) 持仓模块（`views/portfolio/`）
- `PortfolioView.vue`
- 包含：持仓列表、浮动盈亏、总资产卡片

### 5) 统计模块（`views/stats/`）
- `StatsView.vue`
- 包含：资产折线图、收益柱状图、胜率饼图

## 状态管理建议（Pinia）

- `stores/user.ts`：用户信息、token、登录状态
- `stores/trade.ts`：交易下单状态、持仓缓存
- `stores/news.ts`：新闻列表筛选状态

## API分层建议（`src/api/`）

- `auth.ts`：注册登录
- `news.ts`：新闻列表与详情
- `trade.ts`：下单、撤单、历史订单
- `portfolio.ts`：持仓与资产
- `stats.ts`：统计图表数据
