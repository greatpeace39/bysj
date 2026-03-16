# API 接口文档

Base URL: `http://localhost:8080`

统一返回结构：

```json
{
  "code": 200,
  "message": "success",
  "data": {}
}
```

## 1. 用户注册

- **URL**: `/api/auth/register`
- **Method**: `POST`
- **Content-Type**: `application/json`

### 请求参数

| 字段 | 类型 | 必填 | 说明 |
|---|---|---|---|
| username | string | 是 | 用户名（4-20，字母数字下划线） |
| password | string | 是 | 密码（6-32） |
| nickname | string | 是 | 昵称 |
| email | string | 否 | 邮箱 |

### 请求示例

```json
{
  "username": "student01",
  "password": "123456",
  "nickname": "张三",
  "email": "student01@example.com"
}
```

### 响应示例

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "userId": 1,
    "username": "student01",
    "nickname": "张三",
    "token": "eyJhbGciOiJIUzI1NiJ9..."
  }
}
```

## 2. 用户登录

- **URL**: `/api/auth/login`
- **Method**: `POST`
- **Content-Type**: `application/json`

### 请求参数

| 字段 | 类型 | 必填 | 说明 |
|---|---|---|---|
| username | string | 是 | 用户名 |
| password | string | 是 | 密码 |

### 请求示例

```json
{
  "username": "student01",
  "password": "123456"
}
```

### 响应示例

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "userId": 1,
    "username": "student01",
    "nickname": "张三",
    "token": "eyJhbGciOiJIUzI1NiJ9..."
  }
}
```

## 3. 鉴权说明

除 `/api/auth/**` 外，其它接口默认需携带 Token：

```http
Authorization: Bearer <token>
```

## 4. 常见错误码

| code | 含义 |
|---|---|
| 200 | 成功 |
| 400 | 参数错误 / 业务错误 |
| 500 | 服务端异常 |
