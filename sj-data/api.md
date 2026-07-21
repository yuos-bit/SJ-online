# 世界online (World Online) 游戏接口文档

> 基于抓包数据分析整理的接口文档  
> 游戏类型：HTML5 回合制MMORPG  
> 引擎：Egret Engine  
> 通信协议：WebSocket（二进制协议）  
> **版本**: v0.0.2 / config version 302

---

## 目录

1. [服务器信息](#1-服务器信息)
2. [通信协议](#2-通信协议)
3. [通用消息结构](#3-通用消息结构)
4. [模块清单](#4-模块清单)
5. [接口详细说明](#5-接口详细说明)
   - 5.1 [连接与登录](#51-连接与登录)
   - 5.2 [角色系统](#52-角色系统)
   - 5.3 [背包系统](#53-背包系统)
   - 5.4 [战斗系统](#54-战斗系统)
   - 5.5 [任务系统](#55-任务系统)
   - 5.6 [商城系统](#56-商城系统)
   - 5.7 [宠物系统](#57-宠物系统)
   - 5.8 [技能系统](#58-技能系统)
   - 5.9 [装备系统](#59-装备系统)
   - 5.10 [邮件系统](#510-邮件系统)
   - 5.11 [社交系统](#511-社交系统)
   - 5.12 [成就系统](#512-成就系统)
   - 5.13 [签到系统](#513-签到系统)
   - 5.14 [竞技场](#514-竞技场)
   - 5.15 [跨服系统](#515-跨服系统)
   - 5.16 [充值支付](#516-充值支付)
   - 5.17 [城市系统](#517-城市系统)
   - 5.18 [国家系统](#518-国家系统)
   - 5.19 [挂机系统](#519-挂机系统)
6. [错误码](#6-错误码)
7. [附录](#7-附录)

---

## 1 服务器信息

### 1.1 基础配置

```json
{
  "serverType": 90,
  "version": 302,
  "codeVersion": "0.0.2",
  "host": "wss://sjh5server.good321.net",
  "port": 7003,
  "openPay": 7,
  "payApi": "https://sjh5qa.good321.net/callback/micropf",
  "cdnUrl": "https://sjh5cdn1.good321.net/res/,https://sjh5cdn2.good321.net/res/",
  "payconfig": {
    "total_pay": 1,
    "ios_pay": 1,
    "android_pay": 1,
    "pc_pay": 1
  },
  "iosPayUrl": "https://sjh5loginnew.good321.net/submitOrder"
}
```

### 1.2 服务器地址

| 用途 | 地址 | 协议 |
|------|------|------|
| 游戏WebSocket | `wss://sjh5server.good321.net:7003` | WSS |
| 版本配置 | `https://sjh5loginnew.good321.net/h5version?code_version={ver}` | HTTPS |
| CDN资源 | `https://sjh5cdn2.good321.net/resgood/` | HTTPS |
| 支付回调 | `https://sjh5qa.good321.net/callback/micropf` | HTTPS |
| iOS支付 | `https://sjh5loginnew.good321.net/submitOrder` | HTTPS |
| H5登录 | `https://sjh5loginnew.good321.net/h5version` | HTTPS |

### 1.3 版本配置接口

获取游戏最新版本配置：

- **URL**: `https://sjh5loginnew.good321.net/h5version`
- **方法**: GET
- **参数**: `code_version` (当前版本号)
- **响应**: 包含服务器地址、端口、支付配置、CDN地址等信息

---

## 2 通信协议

### 2.1 协议类型

游戏客户端与服务器之间通过 **WebSocket** 建立长连接，采用 **二进制协议** 通信。

### 2.2 连接流程

```
1. 客户端 → 服务器: HTTP版本检查请求
2. 客户端 ← 服务器: 返回服务器配置(host, port, version)
3. 客户端 → 服务器: WebSocket握手(wss://sjh5server.good321.net:7003)
4. 客户端 → 服务器: 握手验证消息(含版本号、设备信息)
5. 客户端 ← 服务器: 握手响应(含session token)
6. 客户端 → 服务器: 登录认证(账号/令牌)
7. 客户端 ← 服务器: 登录成功(角色数据)
```

### 2.3 消息编码

WebSocket消息采用二进制格式，消息结构包含：

| 偏移 | 长度 | 说明 |
|------|------|------|
| 0 | 2 bytes | 消息长度 |
| 2 | 2 bytes | 协议ID / 命令字 |
| 4 | 4 bytes | 序列号 |
| 8+ | 变长 | 消息体（JSON/二进制） |

### 2.4 协议ID范围

| 范围 | 模块 |
|------|------|
| 1000-1099 | 连接与登录 |
| 1100-1199 | 玩家基础 |
| 1200-1299 | 角色属性 |
| 1300-1399 | 背包 |
| 1400-1499 | 战斗 |
| 1500-1599 | 任务 |
| 1600-1699 | 技能 |
| 1700-1799 | 商城 |
| 1800-1899 | 宠物 |
| 1900-1999 | 装备 |
| 2000-2099 | 邮件 |
| 2100-2199 | 社交/好友 |
| 2200-2299 | 成就 |
| 2300-2399 | 签到 |
| 2400-2499 | 竞技场 |
| 2500-2599 | 跨服 |
| 2600-2699 | 充值 |
| 2700-2799 | 挂机 |
| 2800-2899 | 国家 |
| 2900-2999 | 城市 |
| 3000-3099 | 排行榜 |
| 3100-3199 | 活动 |

---

## 3 通用消息结构

### 3.1 请求结构

```json
{
  "cmd": 1001,
  "seq": 12345,
  "data": { }
}
```

### 3.2 响应结构

```json
{
  "cmd": 1001,
  "seq": 12345,
  "code": 0,
  "msg": "success",
  "data": { }
}
```

### 3.3 通用字段说明

| 字段 | 类型 | 说明 |
|------|------|------|
| `cmd` | int | 命令字/协议ID |
| `seq` | int | 序列号，用于请求-响应匹配 |
| `code` | int | 状态码，0=成功，非0=错误 |
| `msg` | string | 状态消息 |
| `data` | object | 消息体 |

---

## 4 模块清单

基于游戏资源配置分析，游戏包含以下功能模块：

| 模块Key | 名称 | 说明 |
|---------|------|------|
| `role` | 角色系统 | 角色属性、升级、加点 |
| `bag` | 背包系统 | 物品管理、出售、使用 |
| `battle` | 战斗系统 | 战斗流程、技能释放 |
| `renwu` | 任务系统 | 主线/支线/日常任务 |
| `shop` | 商城系统 | 道具购买 |
| `bb` | 宠物系统 | 宠物培养、出战 |
| `sk` | 技能系统 | 技能学习、升级 |
| `achieve` | 成就系统 | 成就追踪与奖励 |
| `mail` | 邮件系统 | 邮件收发 |
| `shejiao` | 社交系统 | 好友、聊天 |
| `chongzhi` | 充值系统 | 充值、VIP |
| `city` | 城市系统 | 个人城市 |
| `country` | 国家系统 | 阵营/国家 |
| `jingji` | 竞技场 | PvP对战 |
| `kuafu` | 跨服系统 | 跨服玩法 |
| `pata` | 爬塔 | 挑战塔 |
| `huoban` | 伙伴系统 | 伙伴培养 |
| `fuben` | 副本系统 | 日常副本 |
| `qd` | 签到系统 | 每日签到 |
| `jijin` | 基金系统 | 成长基金 |
| `red_packet` | 红包系统 | 红包功能 |
| `liupai` | 流派系统 | 职业/流派 |
| `shenqi` | 神器系统 | 神器养成 |
| `ronglu` | 熔炉系统 | 装备熔炼 |
| `sign` | 签到 | 每日签到奖励 |
| `scene` | 场景 | 地图场景管理 |

---

## 5 接口详细说明

### 5.1 连接与登录

#### 5.1.1 握手验证

- **协议ID**: 1001
- **方向**: 客户端 → 服务器
- **说明**: 建立WebSocket连接后的第一次握手

**请求**:

```json
{
  "cmd": 1001,
  "data": {
    "version": "0.0.2",
    "resVersion": 302,
    "device": {
      "platform": "web",
      "userAgent": "Mozilla/5.0 ...",
      "screenWidth": 720,
      "screenHeight": 1280,
      "pixelRatio": 3.33,
      "language": "zh-CN"
    },
    "channel": "merchant1",
    "subchannel": "merchant1"
  }
}
```

**响应**:

```json
{
  "cmd": 1001,
  "code": 0,
  "data": {
    "sessionId": "xxxxx",
    "serverTime": 1650000000000,
    "heartbeatInterval": 30
  }
}
```

#### 5.1.2 用户登录

- **协议ID**: 1002
- **方向**: 客户端 → 服务器

**请求**:

```json
{
  "cmd": 1002,
  "data": {
    "token": "xxxxx",
    "platform": "web",
    "channel": "merchant1",
    "deviceId": "xxxxx"
  }
}
```

**响应**:

```json
{
  "cmd": 1002,
  "code": 0,
  "data": {
    "playerId": 100001,
    "name": "玩家名",
    "level": 1,
    "vipLevel": 0,
    "gold": 0,
    "silver": 1000,
    "exp": 0,
    "maxExp": 100,
    "lastLoginTime": 1650000000000,
    "createTime": 1650000000000
  }
}
```

#### 5.1.3 心跳

- **协议ID**: 1003
- **方向**: 双向
- **频率**: 每30秒一次

**请求**:

```json
{
  "cmd": 1003,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 1003,
  "code": 0,
  "data": {
    "serverTime": 1650000000000
  }
}
```

---

### 5.2 角色系统

#### 5.2.1 获取角色信息

- **协议ID**: 1101

**请求**:

```json
{
  "cmd": 1101,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 1101,
  "code": 0,
  "data": {
    "playerId": 100001,
    "name": "玩家名",
    "level": 10,
    "job": 1,
    "sex": 1,
    "vipLevel": 1,
    "exp": 500,
    "maxExp": 1000,
    "hp": 500,
    "maxHp": 500,
    "mp": 200,
    "maxMp": 200,
    "attack": 100,
    "defense": 50,
    "speed": 80,
    "crit": 10,
    "dodge": 5,
    "hit": 95,
    "gold": 1000,
    "silver": 50000,
    "bindGold": 200,
    "statPoints": 15
  }
}
```

**属性字段说明**:

| 字段 | 类型 | 说明 |
|------|------|------|
| `playerId` | long | 玩家ID |
| `name` | string | 角色名称 |
| `level` | int | 等级 |
| `job` | int | 职业(1=侠客,2=战士,3=法师,4=修真) |
| `sex` | int | 性别(1=男,2=女) |
| `vipLevel` | int | VIP等级 |
| `exp` | long | 当前经验 |
| `maxExp` | long | 升级所需经验 |
| `hp` | int | 当前生命 |
| `maxHp` | int | 最大生命 |
| `mp` | int | 当前魔法 |
| `maxMp` | int | 最大魔法 |
| `attack` | int | 攻击力 |
| `defense` | int | 防御力 |
| `speed` | int | 速度 |
| `crit` | int | 暴击率 |
| `dodge` | int | 闪避率 |
| `hit` | int | 命中率 |
| `gold` | int | 黄金(充值货币) |
| `silver` | int | 银两(游戏币) |
| `bindGold` | int | 绑定金叶 |
| `statPoints` | int | 可分配属性点 |

#### 5.2.2 属性加点

- **协议ID**: 1102
- **说明**: 每升1级获得3点属性点

**请求**:

```json
{
  "cmd": 1102,
  "data": {
    "strength": 1,
    "agility": 1,
    "intellect": 0,
    "perception": 1
  }
}
```

**属性推荐加点**:

| 职业 | 主属性 |
|------|--------|
| 侠客 | 敏捷 |
| 战士 | 力量 |
| 法师 | 智力 |
| 修真 | 感知 |

**响应**:

```json
{
  "cmd": 1102,
  "code": 0,
  "data": {
    "statPoints": 12,
    "strength": 11,
    "agility": 11,
    "intellect": 5,
    "perception": 8,
    "attack": 105,
    "defense": 52
  }
}
```

**角色属性面板字段**:

| 字段 | 类型 | 说明 |
|------|------|------|
| `strength` | int | 力量 |
| `agility` | int | 敏捷 |
| `intellect` | int | 智力 |
| `perception` | int | 感知 |
| `physique` | int | 体质 |
| `gongji` | int | 攻击 |
| `fangyu` | int | 防御 |
| `minjie` | int | 敏捷(战斗属性) |
| `liliang` | int | 力量(战斗属性) |
| `zhili` | int | 智力(战斗属性) |
| `ganzhi` | int | 感知(战斗属性) |
| `shanghai` | int | 伤害 |
| `mianshang` | int | 免伤 |
| `baoji` | int | 暴击 |
| `shanbi` | int | 闪避 |
| `mingzhong` | int | 命中 |
| `pifang` | int | 破防 |
| `gedang` | int | 格挡 |
| `fanji` | int | 反击 |
| `xixue` | int | 吸血 |
| `wumian` | int | 物免 |
| `mofang` | int | 魔防 |
| `wukang` | int | 物抗 |
| `mokang` | int | 魔抗 |

---

### 5.3 背包系统

#### 5.3.1 获取背包列表

- **协议ID**: 1301
- **说明**: 获取角色背包中的所有物品

**请求**:

```json
{
  "cmd": 1301,
  "data": {
    "bagType": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `bagType` | int | 背包类型(0=普通背包,1=仓库,2=临时背包) |

**响应**:

```json
{
  "cmd": 1301,
  "code": 0,
  "data": {
    "capacity": 100,
    "usedSlots": 23,
    "items": [
      {
        "uid": 10001,
        "itemId": 11001,
        "count": 1,
        "slot": 0,
        "bind": true,
        "quality": 3,
        "durability": 100,
        "maxDurability": 100,
        "isEquiped": false
      }
    ]
  }
}
```

**物品字段说明**:

| 字段 | 类型 | 说明 |
|------|------|------|
| `uid` | long | 物品唯一ID |
| `itemId` | int | 物品模板ID |
| `count` | int | 数量 |
| `slot` | int | 格子位置 |
| `bind` | bool | 是否绑定 |
| `quality` | int | 品质(1=普通白,2=精致绿,3=稀有蓝,4=史诗橙,5=传说紫) |
| `durability` | int | 当前耐久 |
| `maxDurability` | int | 最大耐久 |
| `isEquiped` | bool | 是否已装备 |

**品质对照**:

| 品质值 | 名称 | 底色 |
|--------|------|------|
| 1 | 普通 | 白色 |
| 2 | 精致 | 绿色 |
| 3 | 稀有 | 蓝色 |
| 4 | 史诗 | 橙色 |
| 5 | 传说 | 紫色 |

#### 5.3.2 背包出售

- **协议ID**: 1302
- **说明**: 出售背包中的物品，获得银两

**请求**:

```json
{
  "cmd": 1302,
  "data": {
    "uid": 10001,
    "count": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `uid` | long | 物品唯一ID |
| `count` | int | 出售数量 |

**响应**:

```json
{
  "cmd": 1302,
  "code": 0,
  "data": {
    "silver": 50500,
    "gainSilver": 500
  }
}
```

#### 5.3.3 使用物品

- **协议ID**: 1303
- **说明**: 使用背包中的消耗品或功能道具

**请求**:

```json
{
  "cmd": 1303,
  "data": {
    "uid": 10001,
    "count": 1,
    "targetId": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `uid` | long | 物品唯一ID |
| `count` | int | 使用数量 |
| `targetId` | long | 目标角色/宠物ID(部分道具需要) |

**响应**:

```json
{
  "cmd": 1303,
  "code": 0,
  "data": {
    "code": 0,
    "effect": {
      "hp": 200,
      "mp": 100
    }
  }
}
```

#### 5.3.4 物品整理

- **协议ID**: 1304
- **说明**: 整理背包格子

**请求**:

```json
{
  "cmd": 1304,
  "data": {
    "bagType": 0
  }
}
```

**响应**:

```json
{
  "cmd": 1304,
  "code": 0,
  "data": {
    "items": []
  }
}
```

#### 5.3.5 装备穿戴/卸下

- **协议ID**: 1305

**请求**:

```json
{
  "cmd": 1305,
  "data": {
    "uid": 10001,
    "action": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `uid` | long | 装备唯一ID |
| `action` | int | 1=穿上,2=卸下 |

**响应**:

```json
{
  "cmd": 1305,
  "code": 0,
  "data": {
    "equipSlot": 3,
    "item": {}
  }
}
```

#### 5.3.6 物品分解

- **协议ID**: 1306
- **说明**: 将装备分解为材料

**请求**:

```json
{
  "cmd": 1306,
  "data": {
    "uids": [10001, 10002]
  }
}
```

**响应**:

```json
{
  "cmd": 1306,
  "code": 0,
  "data": {
    "materials": [
      {"itemId": 20001, "count": 5}
    ]
  }
}
```

#### 5.3.7 一键恢复

- **协议ID**: 1307
- **说明**: 使用药品一键恢复生命值和魔法值

**请求**:

```json
{
  "cmd": 1307,
  "data": {
    "hpType": 1,
    "mpType": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `hpType` | int | 生命恢复类型(0=不使用,1=自动选择) |
| `mpType` | int | 魔法恢复类型(0=不使用,1=自动选择) |

**响应**:

```json
{
  "cmd": 1307,
  "code": 0,
  "data": {
    "hp": 500,
    "mp": 200,
    "usedItems": [{"itemId": 3001, "count": 1}]
  }
}
```

#### 5.3.8 装备比较

- **协议ID**: 1308
- **说明**: 比较背包装备与已装备的属性差异

**请求**:

```json
{
  "cmd": 1308,
  "data": {
    "uid": 10001
  }
}
```

**响应**:

```json
{
  "cmd": 1308,
  "code": 0,
  "data": {
    "bagEquip": {},
    "equipedEquip": {},
    "diffs": [
      {"attr": "attack", "bagValue": 50, "equipedValue": 40, "better": true}
    ]
  }
}
```

---

### 5.4 战斗系统

#### 5.4.1 进入战斗

- **协议ID**: 1401
- **说明**: 点击怪物/NPC进入战斗

**请求**:

```json
{
  "cmd": 1401,
  "data": {
    "monsterId": 1101,
    "sceneId": 1001,
    "teamId": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `monsterId` | int | 怪物ID |
| `sceneId` | int | 场景ID |
| `teamId` | int | 队伍ID(组队时) |

**响应**:

```json
{
  "cmd": 1401,
  "code": 0,
  "data": {
    "battleId": 50001,
    "round": 1,
    "currentTurn": 0,
    "player": {
      "hp": 500,
      "maxHp": 500,
      "mp": 200,
      "maxMp": 200,
      "attack": 100,
      "defense": 50
    },
    "monster": {
      "monsterId": 1101,
      "name": "哈士奇",
      "hp": 300,
      "maxHp": 300,
      "attack": 30,
      "defense": 10
    },
    "buffs": []
  }
}
```

#### 5.4.2 普通攻击

- **协议ID**: 1402

**请求**:

```json
{
  "cmd": 1402,
  "data": {
    "battleId": 50001,
    "target": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `battleId` | long | 战斗ID |
| `target` | int | 目标(0=敌方全体,1=1号位) |

**响应**:

```json
{
  "cmd": 1402,
  "code": 0,
  "data": {
    "round": 1,
    "actions": [
      {
        "actor": 0,
        "skillId": 0,
        "actionType": 1,
        "targets": [
          {
            "target": 1,
            "damage": 50,
            "isCrit": false,
            "isDodge": false,
            "hpAfter": 250,
            "mpAfter": 200,
            "buffs": []
          }
        ]
      }
    ],
    "status": 0
  }
}
```

**动作类型(actionType)**:

| 值 | 说明 |
|----|------|
| 1 | 普通攻击 |
| 2 | 技能攻击 |
| 3 | 使用道具 |
| 4 | 防御 |
| 5 | 逃跑 |
| 6 | 召唤宠物 |

**战斗状态(status)**:

| 值 | 说明 |
|----|------|
| 0 | 进行中 |
| 1 | 玩家胜利 |
| 2 | 玩家失败 |
| 3 | 逃跑成功 |

#### 5.4.3 技能攻击

- **协议ID**: 1403

**请求**:

```json
{
  "cmd": 1403,
  "data": {
    "battleId": 50001,
    "skillId": 1001,
    "target": 1
  }
}
```

**响应**: 同普通攻击结构

#### 5.4.4 使用道具

- **协议ID**: 1404

**请求**:

```json
{
  "cmd": 1404,
  "data": {
    "battleId": 50001,
    "itemUid": 20001,
    "target": 0
  }
}
```

#### 5.4.5 跳过战斗动画

- **协议ID**: 1405
- **说明**: 跳过当前战斗播放动画，直接显示结果

**请求**:

```json
{
  "cmd": 1405,
  "data": {
    "battleId": 50001
  }
}
```

**响应**:

```json
{
  "cmd": 1405,
  "code": 0,
  "data": {
    "result": 1,
    "rewards": {
      "exp": 100,
      "silver": 500,
      "items": [{"itemId": 1001, "count": 1}]
    }
  }
}
```

#### 5.4.6 自动战斗

- **协议ID**: 1406
- **说明**: 开启/关闭自动战斗模式

**请求**:

```json
{
  "cmd": 1406,
  "data": {
    "battleId": 50001,
    "auto": true
  }
}
```

#### 5.4.7 战斗加速

- **协议ID**: 1407
- **说明**: 加快战斗播放速度

**请求**:

```json
{
  "cmd": 1407,
  "data": {
    "battleId": 50001,
    "speed": 2
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `speed` | int | 速度倍率(1=1倍速,2=2倍速) |

#### 5.4.8 查看目标详情

- **协议ID**: 1408
- **说明**: 查看敌方目标详细信息，含状态buff

**请求**:

```json
{
  "cmd": 1408,
  "data": {
    "battleId": 50001,
    "targetId": 1
  }
}
```

**响应**:

```json
{
  "cmd": 1408,
  "code": 0,
  "data": {
    "name": "骷髅法师",
    "level": 15,
    "hp": 300,
    "maxHp": 300,
    "mp": 100,
    "maxMp": 100,
    "attack": 50,
    "defense": 20,
    "buffs": [
      {"buffId": 101, "name": "免疫定身", "type": 1, "icon": "buff_icon_ds"},
      {"buffId": 102, "name": "免疫混乱", "type": 1, "icon": "buff_icon_hl"}
    ]
  }
}
```

**Buff类型(type)**:

| 值 | 说明 | 字体颜色 |
|----|------|----------|
| 1 | 增益状态 | 绿色 |
| 2 | 负面状态 | 红色 |
| 3 | 免疫状态 | 绿色 |

#### 5.4.9 逃跑

- **协议ID**: 1409

**请求**:

```json
{
  "cmd": 1409,
  "data": {
    "battleId": 50001
  }
}
```

---

### 5.5 任务系统

#### 5.5.1 获取任务列表

- **协议ID**: 1501

**请求**:

```json
{
  "cmd": 1501,
  "data": {
    "taskType": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `taskType` | int | 0=全部,1=主线,2=支线,3=日常,4=活动 |

**响应**:

```json
{
  "cmd": 1501,
  "code": 0,
  "data": {
    "tasks": [
      {
        "taskId": 1001,
        "taskName": "初入世界",
        "type": 1,
        "status": 1,
        "progress": "5/10",
        "npcStart": "世界村村长",
        "npcEnd": "云裳",
        "rewards": {
          "exp": 500,
          "silver": 1000,
          "items": [{"itemId": 11001, "count": 1}]
        },
        "desc": "与村长对话",
        "targets": [
          {"type": "talk", "target": "世界村村长", "current": 0, "total": 1}
        ]
      }
    ],
    "dailyTaskCount": 10,
    "dailyTaskCompleted": 3
  }
}
```

**任务状态(status)**:

| 值 | 说明 |
|----|------|
| 0 | 未接取 |
| 1 | 进行中 |
| 2 | 已完成(可提交) |
| 3 | 已提交 |
| 4 | 已失败 |

#### 5.5.2 接受任务

- **协议ID**: 1502
- **说明**: 从NPC处接受任务

**请求**:

```json
{
  "cmd": 1502,
  "data": {
    "taskId": 1001,
    "npcId": 1101
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `taskId` | int | 任务ID |
| `npcId` | int | 发布任务的NPC ID |

**响应**:

```json
{
  "cmd": 1502,
  "code": 0,
  "data": {
    "taskId": 1001,
    "status": 1,
    "progress": "0/10"
  }
}
```

#### 5.5.3 提交任务

- **协议ID**: 1503
- **说明**: 完成任务后向NPC提交

**请求**:

```json
{
  "cmd": 1503,
  "data": {
    "taskId": 1001,
    "npcId": 1102
  }
}
```

**响应**:

```json
{
  "cmd": 1503,
  "code": 0,
  "data": {
    "taskId": 1001,
    "status": 3,
    "rewards": {
      "exp": 500,
      "silver": 1000,
      "items": [{"itemId": 11001, "count": 1}]
    }
  }
}
```

#### 5.5.4 放弃任务

- **协议ID**: 1504

**请求**:

```json
{
  "cmd": 1504,
  "data": {
    "taskId": 1001
  }
}
```

#### 5.5.5 任务寻路

- **协议ID**: 1505
- **说明**: 获取任务目标NPC位置并自动寻路

**请求**:

```json
{
  "cmd": 1505,
  "data": {
    "taskId": 1001
  }
}
```

**响应**:

```json
{
  "cmd": 1505,
  "code": 0,
  "data": {
    "npcId": 1102,
    "npcName": "云裳",
    "mapId": 1001,
    "x": 120,
    "y": 300,
    "path": [[100, 200], [110, 250], [120, 300]]
  }
}
```

#### 5.5.6 日常任务数据

- **协议ID**: 1506

**请求**:

```json
{
  "cmd": 1506,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 1506,
  "code": 0,
  "data": {
    "dailyQuests": [],
    "completedCount": 3,
    "maxCount": 10,
    "refreshTime": 1650000000000
  }
}
```

---

### 5.6 商城系统

#### 5.6.1 获取商品列表

- **协议ID**: 1701

**请求**:

```json
{
  "cmd": 1701,
  "data": {
    "shopId": 1,
    "category": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `shopId` | int | 商店ID |
| `category` | int | 分类(0=全部,1=装备,2=道具,3=材料,4=宠物) |

**响应**:

```json
{
  "cmd": 1701,
  "code": 0,
  "data": {
    "goods": [
      {
        "id": 1,
        "itemId": 11001,
        "name": "新手剑",
        "price": 1000,
        "priceType": 1,
        "stock": -1,
        "limit": 1,
        "discount": 0.8,
        "vipLimit": 0,
        "levelLimit": 1
      }
    ],
    "refreshTime": 1650000000000
  }
}
```

**价格类型(priceType)**:

| 值 | 说明 |
|----|------|
| 1 | 银两 |
| 2 | 黄金 |
| 3 | 绑定金叶 |

#### 5.6.2 购买商品

- **协议ID**: 1702

**请求**:

```json
{
  "cmd": 1702,
  "data": {
    "shopId": 1,
    "goodsId": 1,
    "count": 1
  }
}
```

**响应**:

```json
{
  "cmd": 1702,
  "code": 0,
  "data": {
    "items": [{"itemId": 11001, "count": 1, "uid": 20001}],
    "cost": {
      "silver": 1000,
      "gold": 0
    },
    "balance": {
      "silver": 49000,
      "gold": 1000
    }
  }
}
```

#### 5.6.3 进阶商店

- **协议ID**: 1703
- **说明**: 装备进阶合成

**请求**:

```json
{
  "cmd": 1703,
  "data": {
    "equipUid": 10001,
    "materialUids": [20001, 20002, 20003]
  }
}
```

**响应**:

```json
{
  "cmd": 1703,
  "code": 0,
  "data": {
    "success": true,
    "newEquip": {
      "uid": 10005,
      "itemId": 11001,
      "advanceLevel": 1,
      "identifyAttrs": []
    }
  }
}
```

---

### 5.7 宠物系统

#### 5.7.1 获取宠物列表

- **协议ID**: 1801

**请求**:

```json
{
  "cmd": 1801,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 1801,
  "code": 0,
  "data": {
    "pets": [
      {
        "petId": 1001,
        "petUid": 50001,
        "name": "小恐龙",
        "level": 10,
        "quality": 3,
        "type": 1,
        "hp": 800,
        "maxHp": 800,
        "attack": 60,
        "defense": 30,
        "speed": 50,
        "exp": 200,
        "maxExp": 500,
        "skillPoints": 3,
        "skills": [
          {"skillId": 2001, "name": "撕咬", "level": 1},
          {"skillId": 2002, "name": "怒吼", "level": 0}
        ],
        "status": 1,
        "growValue": 80,
        "innateSkill": {"skillId": 3001, "name": "天生神力"}
      }
    ],
    "activePetUid": 50001,
    "petSlots": 10
  }
}
```

**宠物类型(type)**:

| 值 | 说明 |
|----|------|
| 1 | 迅捷(敏捷型) |
| 2 | 睿智(法术型) |
| 3 | 勇猛(力量型) |

**宠物状态(status)**:

| 值 | 说明 |
|----|------|
| 0 | 休息 |
| 1 | 出战 |

#### 5.7.2 宠物出战/休息

- **协议ID**: 1802

**请求**:

```json
{
  "cmd": 1802,
  "data": {
    "petUid": 50001,
    "action": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `action` | int | 1=出战,2=休息 |

#### 5.7.3 宠物使用道具

- **协议ID**: 1803

**请求**:

```json
{
  "cmd": 1803,
  "data": {
    "petUid": 50001,
    "itemUid": 30001
  }
}
```

#### 5.7.4 宠物学习技能

- **协议ID**: 1804

**请求**:

```json
{
  "cmd": 1804,
  "data": {
    "petUid": 50001,
    "skillId": 2001
  }
}
```

#### 5.7.5 宠物洗髓

- **协议ID**: 1805
- **说明**: 重置宠物属性

#### 5.7.6 宠物潜能

- **协议ID**: 1806
- **说明**: 激活宠物潜能

#### 5.7.7 宠物封印

- **协议ID**: 1807

#### 5.7.8 宠物重生

- **协议ID**: 1808

#### 5.7.9 宠物放生

- **协议ID**: 1809

---

### 5.8 技能系统

#### 5.8.1 获取技能列表

- **协议ID**: 1601

**请求**:

```json
{
  "cmd": 1601,
  "data": {
    "type": 0
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `type` | int | 0=全部,1=角色技能,2=宠物技能 |

**响应**:

```json
{
  "cmd": 1601,
  "code": 0,
  "data": {
    "skills": [
      {
        "skillId": 1001,
        "name": "火球术",
        "level": 1,
        "maxLevel": 5,
        "type": 1,
        "costMp": 20,
        "cooldown": 2,
        "damageType": 2,
        "damageRate": 150,
        "statusEffect": [],
        "icon": "sk_icon_1",
        "description": "对敌方单体造成150%法术伤害",
        "learnLevel": 10,
        "costSkillPoint": 1,
        "costSilver": 1000
      }
    ],
    "skillPoints": 5
  }
}
```

#### 5.8.2 学习/升级技能

- **协议ID**: 1602

**请求**:

```json
{
  "cmd": 1602,
  "data": {
    "skillId": 1001,
    "type": 0
  }
}
```

**响应**:

```json
{
  "cmd": 1602,
  "code": 0,
  "data": {
    "skillId": 1001,
    "level": 2,
    "skillPoints": 4,
    "silver": 48000
  }
}
```

---

### 5.9 装备系统

#### 5.9.1 装备强化

- **协议ID**: 1901
- **说明**: 强化装备提升属性

**请求**:

```json
{
  "cmd": 1901,
  "data": {
    "uid": 10001,
    "materialUids": [20001]
  }
}
```

**响应**:

```json
{
  "cmd": 1901,
  "code": 0,
  "data": {
    "uid": 10001,
    "strengthenLevel": 2,
    "attrs": {
      "attack": 55
    },
    "cost": {
      "silver": 2000,
      "items": [{"itemId": 20001, "count": 1}]
    }
  }
}
```

#### 5.9.2 装备修理

- **协议ID**: 1902
- **说明**: 修理已损坏的装备

**请求**:

```json
{
  "cmd": 1902,
  "data": {
    "uids": [10001, 10002],
    "repairType": 0,
    "npcId": 1000
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `uids` | long[] | 要修理的装备UID列表 |
| `repairType` | int | 0=普通修理(消耗银两),1=特殊修理(使用道具) |
| `npcId` | int | NPC ID(城市守卫) |

**响应**:

```json
{
  "cmd": 1902,
  "code": 0,
  "data": {
    "repaired": [10001, 10002],
    "cost": {
      "silver": 5000
    }
  }
}
```

#### 5.9.3 装备鉴定

- **协议ID**: 1903

#### 5.9.4 装备进阶

- **协议ID**: 1904
- **说明**: 装备进阶，增加鉴定属性条数（最多8条）

**请求**:

```json
{
  "cmd": 1904,
  "data": {
    "uid": 10001,
    "materials": [{"itemId": 30001, "count": 5}]
  }
}
```

**响应**:

```json
{
  "cmd": 1904,
  "code": 0,
  "data": {
    "success": true,
    "uid": 10001,
    "identifyAttrs": [
      {"attr": "attack", "value": 10},
      {"attr": "crit", "value": 5}
    ]
  }
}
```

---

### 5.10 邮件系统

#### 5.10.1 获取邮件列表

- **协议ID**: 2001

**请求**:

```json
{
  "cmd": 2001,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2001,
  "code": 0,
  "data": {
    "mails": [
      {
        "mailId": 50001,
        "title": "系统邮件",
        "sender": "系统",
        "time": 1650000000000,
        "isRead": false,
        "hasAttachment": true,
        "expireTime": 1650000000000
      }
    ],
    "unreadCount": 1
  }
}
```

#### 5.10.2 读取邮件

- **协议ID**: 2002

**请求**:

```json
{
  "cmd": 2002,
  "data": {
    "mailId": 50001
  }
}
```

**响应**:

```json
{
  "cmd": 2002,
  "code": 0,
  "data": {
    "mailId": 50001,
    "title": "系统邮件",
    "content": "恭喜您获得...",
    "sender": "系统",
    "time": 1650000000000,
    "attachments": [
      {"itemId": 11001, "count": 1}
    ]
  }
}
```

#### 5.10.3 领取附件

- **协议ID**: 2003

**请求**:

```json
{
  "cmd": 2003,
  "data": {
    "mailId": 50001
  }
}
```

#### 5.10.4 删除邮件

- **协议ID**: 2004

**请求**:

```json
{
  "cmd": 2004,
  "data": {
    "mailId": 50001
  }
}
```

#### 5.10.5 一键领取

- **协议ID**: 2005
- **说明**: 一键领取所有附件

---

### 5.11 社交系统

#### 5.11.1 好友列表

- **协议ID**: 2101

**请求**:

```json
{
  "cmd": 2101,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2101,
  "code": 0,
  "data": {
    "friends": [
      {
        "playerId": 100002,
        "name": "好友名",
        "level": 15,
        "job": 1,
        "online": true,
        "lastLoginTime": 1650000000000,
        "giftGiven": false,
        "giftReceived": true
      }
    ],
    "maxFriends": 50,
    "friendCount": 5
  }
}
```

#### 5.11.2 添加好友

- **协议ID**: 2102

**请求**:

```json
{
  "cmd": 2102,
  "data": {
    "playerId": 100002
  }
}
```

#### 5.11.3 删除好友

- **协议ID**: 2103

#### 5.11.4 好友赠送/领取

- **协议ID**: 2104

#### 5.11.5 发送聊天消息

- **协议ID**: 2105

**请求**:

```json
{
  "cmd": 2105,
  "data": {
    "channel": 1,
    "content": "大家好！",
    "targetId": 0
  }
}
```

**聊天频道(channel)**:

| 值 | 说明 |
|----|------|
| 1 | 世界 |
| 2 | 私聊 |
| 3 | 队伍 |
| 4 | 国家 |
| 5 | 系统 |
| 6 | 喇叭 |

---

### 5.12 成就系统

#### 5.12.1 获取成就列表

- **协议ID**: 2201

**请求**:

```json
{
  "cmd": 2201,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2201,
  "code": 0,
  "data": {
    "achievements": [
      {
        "achieveId": 1,
        "name": "初入江湖",
        "group": "renwu",
        "progress": "1/1",
        "completed": true,
        "rewardClaimed": false,
        "rewards": [{"itemId": 10001, "count": 1}]
      }
    ],
    "totalAchievePoints": 100,
    "currentPoints": 15
  }
}
```

**成就分组**:

| 组名 | 说明 |
|------|------|
| `renwu` | 任务成就 |
| `shaguai` | 杀怪成就 |
| `shengji` | 升级成就 |
| `shuxing` | 属性成就 |
| `haoyou` | 好友成就 |
| `juedou` | 决斗成就 |
| `xiangqian` | 镶嵌成就 |
| `chongzhi` | 充值成就 |
| `huangjin` | 黄金成就 |
| `guojia` | 国家成就 |
| `VIP` | VIP成就 |
| `rongyao` | 荣耀成就 |
| `ger` | 个人成就 |

#### 5.12.2 领取成就奖励

- **协议ID**: 2202

**请求**:

```json
{
  "cmd": 2202,
  "data": {
    "achieveId": 1
  }
}
```

---

### 5.13 签到系统

#### 5.13.1 获取签到信息

- **协议ID**: 2301

**请求**:

```json
{
  "cmd": 2301,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2301,
  "code": 0,
  "data": {
    "signedDays": [1, 2, 3],
    "totalDays": 3,
    "canSign": true,
    "signRewards": [
      {"day": 1, "items": [{"itemId": 1001, "count": 1}]},
      {"day": 2, "items": [{"itemId": 1002, "count": 1}]},
      {"day": 7, "items": [{"itemId": 2001, "count": 1}]},
      {"day": 30, "items": [{"itemId": 9999, "count": 1}]}
    ],
    "monthDays": 30,
    "today": 4
  }
}
```

#### 5.13.2 签到

- **协议ID**: 2302

**请求**:

```json
{
  "cmd": 2302,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2302,
  "code": 0,
  "data": {
    "signedDays": [1, 2, 3, 4],
    "totalDays": 4,
    "rewards": [{"itemId": 1004, "count": 1}]
  }
}
```

---

### 5.14 竞技场

#### 5.14.1 获取竞技场信息

- **协议ID**: 2401

**请求**:

```json
{
  "cmd": 2401,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2401,
  "code": 0,
  "data": {
    "rank": 100,
    "totalRank": 1000,
    "score": 1200,
    "challengeCount": 5,
    "maxChallengeCount": 5,
    "refreshTime": 1650000000000,
    "historyBestRank": 50,
    "winStreak": 3,
    "opponents": [
      {"playerId": 20001, "name": "对手1", "level": 12, "rank": 99, "score": 1210}
    ]
  }
}
```

#### 5.14.2 挑战

- **协议ID**: 2402

#### 5.14.3 购买挑战次数

- **协议ID**: 2403

#### 5.14.4 竞技场奖励领取

- **协议ID**: 2404

---

### 5.15 跨服系统

#### 5.15.1 获取跨服信息

- **协议ID**: 2501

#### 5.15.2 跨服匹配

- **协议ID**: 2502

#### 5.15.3 跨服战斗

- **协议ID**: 2503

---

### 5.16 充值支付

#### 5.16.1 获取充值列表

- **协议ID**: 2601

**请求**:

```json
{
  "cmd": 2601,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2601,
  "code": 0,
  "data": {
    "rechargeItems": [
      {"id": 1, "name": "6元礼包", "price": 6, "gold": 60, "bonusGold": 30, "firstBonus": 1.5},
      {"id": 2, "name": "30元礼包", "price": 30, "gold": 300, "bonusGold": 150, "firstBonus": 1.5},
      {"id": 3, "name": "98元礼包", "price": 98, "gold": 980, "bonusGold": 490, "firstBonus": 1.5},
      {"id": 4, "name": "328元礼包", "price": 328, "gold": 3280, "bonusGold": 1640, "firstBonus": 1.5},
      {"id": 5, "name": "648元礼包", "price": 648, "gold": 6480, "bonusGold": 3240, "firstBonus": 1.5}
    ],
    "totalRecharge": 6000,
    "historyRecharge": 3000,
    "firstRechargeStatus": true
  }
}
```

#### 5.16.2 提交订单

- **协议ID**: 2602

**请求**:

```json
{
  "cmd": 2602,
  "data": {
    "rechargeId": 1,
    "payType": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `rechargeId` | int | 充值档位ID |
| `payType` | int | 支付方式(1=微信,2=支付宝,3=银联) |

**响应**:

```json
{
  "cmd": 2602,
  "code": 0,
  "data": {
    "orderId": "20230715001",
    "payUrl": "https://...",
    "gold": 60,
    "bonusGold": 30
  }
}
```

#### 5.16.3 首充奖励领取

- **协议ID**: 2603

#### 5.16.4 充值月卡

- **协议ID**: 2604

---

### 5.17 城市系统

#### 5.17.1 获取个人城市信息

- **协议ID**: 2901

**请求**:

```json
{
  "cmd": 2901,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2901,
  "code": 0,
  "data": {
    "cityLevel": 1,
    "cityExp": 0,
    "buildings": [
      {"buildingId": 1, "name": "城主府", "level": 1, "status": 1},
      {"buildingId": 2, "name": "仓库", "level": 1, "status": 1},
      {"buildingId": 3, "name": "铁匠铺", "level": 0, "status": 0}
    ],
    "warehouseCapacity": 100
  }
}
```

#### 5.17.2 仓库存储

- **协议ID**: 2902
- **说明**: 将物品存入个人仓库

**请求**:

```json
{
  "cmd": 2902,
  "data": {
    "uid": 10001,
    "count": 1,
    "action": 1
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `action` | int | 1=存入,2=取出 |

#### 5.17.3 仓库扩容

- **协议ID**: 2903
- **说明**: 扩展仓库容量

#### 5.17.4 回城

- **协议ID**: 2904

**请求**:

```json
{
  "cmd": 2904,
  "data": {}
}
```

---

### 5.18 国家系统

#### 5.18.1 国家信息

- **协议ID**: 2801

#### 5.18.2 加入国家

- **协议ID**: 2802

#### 5.18.3 国家任务

- **协议ID**: 2803

---

### 5.19 挂机系统

#### 5.19.1 开始挂机

- **协议ID**: 2701
- **说明**: 在指定地图开始自动战斗挂机

**请求**:

```json
{
  "cmd": 2701,
  "data": {
    "mapId": 1001,
    "monsterGroupId": 1,
    "useSkill": true,
    "useItem": true,
    "petFight": true,
    "autoPickup": true
  }
}
```

| 参数 | 类型 | 说明 |
|------|------|------|
| `mapId` | int | 挂机地图ID |
| `monsterGroupId` | int | 怪物组ID |
| `useSkill` | bool | 是否自动释放技能 |
| `useItem` | bool | 是否自动使用药品 |
| `petFight` | bool | 宠物是否出战 |
| `autoPickup` | bool | 是否自动拾取 |

**响应**:

```json
{
  "cmd": 2701,
  "code": 0,
  "data": {
    "status": 1,
    "startTime": 1650000000000,
    "mapId": 1001,
    "monsterGroupId": 1
  }
}
```

#### 5.19.2 停止挂机

- **协议ID**: 2702

**请求**:

```json
{
  "cmd": 2702,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2702,
  "code": 0,
  "data": {
    "status": 0,
    "elapsedTime": 3600,
    "rewards": {
      "exp": 5000,
      "silver": 10000,
      "items": [
        {"itemId": 1001, "count": 5},
        {"itemId": 2001, "count": 1}
      ],
      "monsterKills": 120,
      "equipmentDrops": 3
    }
  }
}
```

#### 5.19.3 挂机状态

- **协议ID**: 2703
- **说明**: 查询当前挂机状态和收益

**请求**:

```json
{
  "cmd": 2703,
  "data": {}
}
```

**响应**:

```json
{
  "cmd": 2703,
  "code": 0,
  "data": {
    "isHanging": true,
    "elapsedTime": 1800,
    "totalKills": 60,
    "expGained": 2500,
    "silverGained": 5000,
    "itemsGained": 10,
    "hpPercent": 80,
    "mpPercent": 70,
    "currentHp": 400,
    "currentMp": 140
  }
}
```

---

## 6 错误码

| 错误码 | 说明 |
|--------|------|
| 0 | 成功 |
| 1001 | 系统错误 |
| 1002 | 参数错误 |
| 1003 | 签名验证失败 |
| 1004 | 会话过期，请重新登录 |
| 1005 | 请求过于频繁 |
| 1101 | 账号不存在 |
| 1102 | 密码错误 |
| 1103 | 账号被冻结 |
| 1104 | 已在其他设备登录 |
| 1201 | 角色不存在 |
| 1202 | 角色名已存在 |
| 1203 | 等级不足 |
| 1204 | 属性点不足 |
| 1301 | 背包已满 |
| 1302 | 物品不存在 |
| 1303 | 物品不足 |
| 1304 | 物品已绑定 |
| 1305 | 物品无法出售 |
| 1306 | 物品无法使用 |
| 1401 | 战斗中不能操作 |
| 1402 | 技能不存在 |
| 1403 | MP不足 |
| 1404 | 技能冷却中 |
| 1405 | 目标无效 |
| 1501 | 任务不存在 |
| 1502 | 任务已接取 |
| 1503 | 任务条件未满足 |
| 1504 | 任务已提交 |
| 1505 | 任务无法提交 |
| 1601 | 技能点不足 |
| 1602 | 银两不足 |
| 1701 | 商品不存在 |
| 1702 | 商品已售罄 |
| 1703 | 购买条件不足 |
| 1801 | 宠物不存在 |
| 1802 | 宠物已出战 |
| 1803 | 技能学习失败 |
| 1804 | 宠物已达技能上限 |
| 1901 | 装备不存在 |
| 1902 | 强化等级已达上限 |
| 1903 | 材料不足 |
| 1904 | 强化失败 |
| 1905 | 装备未损坏 |
| 2001 | 邮件不存在 |
| 2002 | 附件已领取 |
| 2101 | 对方已是好友 |
| 2102 | 好友已达上限 |
| 2103 | 对方不在线 |
| 2201 | 成就未完成 |
| 2202 | 奖励已领取 |
| 2301 | 已签到 |
| 2401 | 挑战次数不足 |
| 2601 | 支付失败 |
| 2602 | 订单已存在 |
| 2603 | 充值未完成 |
| 2701 | 挂机中 |
| 2702 | 未在挂机状态 |
| 9999 | 功能暂未开放 |

---

## 7 附录

### 7.1 CDN资源URL结构

```
CDN基础URL: https://sjh5cdn2.good321.net/resgood/
```

| 路径 | 说明 |
|------|------|
| `gd.js?v={timestamp}` | 主游戏脚本 |
| `v/gd/{version}.json` | 版本资源配置(如302.json) |
| `assets/{xx}/{hash}.json` | 资源数据(哈希分片存放) |
| `js/{xx}/{hash}.js` | 游戏脚本 |
| `ui/{module}.png` | 资源图集 |
| `sound/{name}.m4a` | 音效文件 |

### 7.2 数据类型

游戏角色属性分类（基于角色UI图标分析）：

**基础属性**:
- 攻击(gongji)、防御(fangyu)、生命(hp)、魔法(mp)、经验(exp)

**战斗属性**:
- 暴击(baoji)、闪避(shanbi)、命中(mingzhong)、破防(pifang)、格挡(gedang)
- 反击(fanji)、吸血(xixue)、反震(fanzhen)、连击(lianji)

**防御属性**:
- 物免(wumian)、魔免(mofang)、物抗(wukang)、魔抗(mokang)
- 毒抗(dukang)、混乱抗(hunluan)、封印抗(fengyin)、眩晕抗(xuanyun)
- 沉默抗(chenmo)、定身抗(dingshen)、睡抗(shuikang)、石化抗(shihua)
- 冰冻抗(bingdong)、虚弱抗(xuruo)、减速抗(jiansu)

**高级属性**:
- 强化伤害(qianghua_shanghai)、减免伤害(jianmian_shanghai)
- 最终伤害(zuizhong_shanghai)、特殊伤害(teshu_shanghai)
- 穿透伤害(chuantou_shanghai)、无视防御(wushifangyu)

### 7.3 游戏道具配置

#### 7.3.1 物品模板ID (itemId) 范围

物品模板ID（服务端标识）范围如下：

| 范围 | 类型 | 说明 |
|------|------|------|
| 0-299 | 基础道具/消耗品 | 药品、材料、卷轴等 |
| 8001-8841 | 装备/武器 | 武器、防具、饰品等 |
| 8901-9098 | 特殊道具 | 活动道具、特殊物品 |
| 5125 | 宠物相关 | 宠物蛋、宠物道具 |
| 8241 | 坐骑相关 | 坐骑道具 |
| 8652-8689 | 时装相关 | 时装外观道具 |

#### 7.3.2 物品图标索引 (iconIndex) 明细

游戏使用 `item_icon1~7` 精灵图集存储物品图标，每个图标对应一个数字索引。**注意：物品模板ID (itemId) 与图标索引 (iconIndex) 并非同一数值**，需要游戏客户端内部的映射表关联。

**item_icon（基础道具图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 0 ~ 99 | 基础道具/消耗品图标 |

**item_icon2（材料图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 100 ~ 199 | 材料/素材图标 |

**item_icon3（混合图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 200 ~ 274 | 高级材料/消耗品 |
| 8001 ~ 8026 | 装备（武器/防具） |

**item_icon4（装备图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 8027 ~ 8200 | 装备（武器/防具/饰品） |

**item_icon5（装备图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 8201 ~ 8478 | 装备（高级装备） |

**item_icon6（装备图标）** — 100个图标

| 索引范围 | 说明 |
|----------|------|
| 8479 ~ 8651 | 装备（高级装备/时装） |

**item_icon7（特殊图标）** — 95个图标

| 索引范围 | 说明 |
|----------|------|
| 275 ~ 299 | 高级道具/消耗品 |
| 302 ~ 308 | 特殊消耗品 |
| 5125 | 宠物相关图标 |
| 8241 | 坐骑相关图标 |
| 8553 | 特殊道具 |
| 8652 ~ 8689 | 时装相关 |
| 8769 ~ 8841 | 高级装备 |
| 8901 ~ 9098 | 特殊道具 |
| `dqd_pic_gx` | 命名图标 |
| `icon_wq_1` ~ `icon_wq_8` | 武器类型命名图标 |

**item_pet（宠物图标）** — 109个图标

| 索引范围 | 说明 |
|----------|------|
| 1001 ~ 1109 | 宠物头像/图标 |

**item_mount（坐骑图标）** — 117个图标

| 索引范围 | 说明 |
|----------|------|
| 31000 ~ 31200 | 坐骑外观图标 |
| 32011 ~ 32014 | 特殊坐骑图标 |
| 100125 ~ 100128 | 高级坐骑图标 |

#### 7.3.3 物品品质对照

| 品质值 | 名称 | 底色 | 说明 |
|--------|------|------|------|
| 1 | 普通 | 白色 | 基础品质 |
| 2 | 精致 | 绿色 | 优秀品质 |
| 3 | 稀有 | 蓝色 | 稀有品质 |
| 4 | 史诗 | 橙色 | 史诗品质 |
| 5 | 传说 | 紫色 | 最高品质 |

#### 7.3.4 物品属性字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `uid` | long | 物品唯一实例ID（服务端分配） |
| `itemId` | int | 物品模板ID（参见7.3.1范围） |
| `count` | int | 堆叠数量 |
| `slot` | int | 背包格子位置（0-based） |
| `bind` | bool | 是否已绑定 |
| `quality` | int | 品质（1=普通,2=精致,3=稀有,4=史诗,5=传说） |
| `durability` | int | 当前耐久度 |
| `maxDurability` | int | 最大耐久度 |
| `isEquiped` | bool | 是否已装备 |
| `iconIndex` | int | 图标索引（参见7.3.2明细） |

#### 7.3.5 背包类型

| 值 | 说明 |
|----|------|
| 0 | 普通背包 |
| 1 | 仓库 |
| 2 | 临时背包 |

#### 7.3.6 货币类型

| 字段名 | 名称 | 说明 |
|--------|------|------|
| `gold` | 黄金 | 充值货币，可用于商城购买 |
| `silver` | 银两 | 游戏币，任务/出售获得 |
| `bindGold` | 绑定金叶 | 绑定货币，部分商城使用 |

#### 7.3.7 价格类型 (priceType)

| 值 | 说明 |
|----|------|
| 1 | 银两 |
| 2 | 黄金 |
| 3 | 绑定金叶 |

#### 7.3.8 物品类型推断

基于游戏引导数据中提及的道具名称，推测以下物品类型：

| 物品名称 | 推断类型 |
|----------|----------|
| 宠物蛋 | 宠物道具 |
| 野外修理卷 | 消耗品/修理道具 |
| 药品 | 消耗品/恢复道具 |

> **注意**：由于游戏主逻辑JS文件（f91bfe6775e8406d6e6bc756cb64f74f.js, 5.8MB）经过重度混淆压缩，物品ID与名称的完整映射表（`itemId → name`）无法直接从静态资源中提取。该映射表要么在服务端维护，要么在客户端JS中以混淆形式嵌入。如需完整映射，建议通过以下方式获取：
> 1. 截取WebSocket通信中背包列表（协议ID 1301）的响应数据
> 2. 或截取商城列表（协议ID 1701）的响应数据
> 3. 或在游戏运行时通过JavaScript hook提取客户端内存中的配置表

### 7.4 场景地图配置

基于 scene 图集分析：

| 场景ID | 说明 |
|--------|------|
| 3_0~3_3 | 新手村 |
| 4_0~4_7 | 主城 |
| 11_0~11_4 | 野外/副本 |

### 7.5 任务NPC配置

基于 `renwu` 图集分析：

| NPC | 说明 |
|-----|------|
| 世界村村长 | 新手引导 |
| 云裳 | 任务交付 |
| 东海 | 战斗引导 |
| 仓库管理员 | 仓库功能 |
| 城市守卫 | 装备修理 |
| 游戏攻略师 | 攻略指导 |
| 武器大师 | 装备商店 |

---

> **文档版本**: 1.1  
> **生成日期**: 2026-07-20  
> **数据来源**: 基于抓包工具捕获的静态资源分析推断，实际协议以游戏客户端与服务端交互为准
