# Swift 系统学习 · 42 天打卡清单

> **背景**：Objective-C 为主，Swift 生疏，系统回温至可独立开发。  
> **主线项目**：「习惯打卡 Habit App」（列表 + 详情 + 网络 + 本地存储 + 设置）  
> **建议节奏**：每天约 30 分钟阅读 + 1 小时编码（周末可加倍）  
> **仓库建议**：`swift-learning`，每周打 tag：`week-1` … `week-6`

---

## 学习前准备（第 0 天）

- [ ] 安装最新 Xcode + Command Line Tools
- [ ] 创建学习仓库 `swift-learning`
- [ ] 创建主线 App 工程「Habit」（UIKit / SwiftUI 可后建）
- [ ] 书签：Swift.org、Apple HIG、WWDC Videos
- [ ] 阅读下方「OC → Swift 对照表」

### OC → Swift 对照表

| Objective-C | Swift |
|-------------|-------|
| `@property` | `var` / `let`、`lazy` |
| `nullable` | `?` / `guard let` |
| Block | 闭包、`@escaping`、`[weak self]` |
| Delegate | 仍常用；SwiftUI 用 `Binding` |
| Category | `extension` |
| `NSArray` / `NSDictionary` | `Array` / `Dictionary`（值类型） |
| GCD | `async/await`、`Task`（GCD 要能读老代码） |
| `#define` | `enum`、`static let` |

---

## 第 1 周：Swift 语言系统回温

**本周目标**：脱离 OC 写法，能写 idiomatic Swift。

### Day 1 · 类型与可选

- [ ] 阅读：值类型 vs 引用类型、`struct` vs `class`
- [ ] 练习：OC 模型类 → `struct` + `Codable`
- [ ] Git 提交：`Day01-Models`

### Day 2 · 函数与闭包

- [ ] 阅读：尾随闭包、`@escaping`、capture list
- [ ] 练习：OC `completion:` → Swift 闭包版
- [ ] 练习：3 个 `[weak self]` 场景

### Day 3 · 协议与扩展

- [ ] 阅读：`protocol` 默认实现、`extension` 组织代码
- [ ] 练习：定义 `NetworkService` 协议 + Mock 实现

### Day 4 · 错误处理

- [ ] 阅读：`throws` / `try` / `Result` / `do-catch`
- [ ] 练习：统一 `AppError: Error`

### Day 5 · 泛型与集合

- [ ] 阅读：泛型、`where`、`map` / `filter` / `reduce`
- [ ] 练习：泛型缓存 `Cache<Key, Value>`

### Day 6 · 属性与访问控制

- [ ] 阅读：`lazy`、`willSet`/`didSet`、`private`、`final`
- [ ] 练习：重构模型，封装内部可变状态

### Day 7 · 周复盘

- [ ] 独立实现：JSON 解析 → 模型列表（Playground 或 CLI）
- [ ] 笔记：《从 OC 最容易写错的 10 个 Swift 点》
- [ ] 周末选读：Hacking with Swift 基础前 15 课（薄弱处）

---

## 第 2 周：现代 Swift（并发 + 内存）

**本周目标**：新代码用 `async/await`；能读 Combine 与老 GCD。

### Day 8 · async/await 基础

- [ ] 阅读：`async let`、`await`、`Task`
- [ ] 练习：`fetchHabits()` 异步拉数据（可先 mock）

### Day 9 · Actor 与线程安全

- [ ] 阅读：`actor`、`@MainActor`
- [ ] 练习：全局可变状态 → `actor HabitStore`

### Day 10 · 结构化并发

- [ ] 阅读：`TaskGroup`、取消（了解即可）
- [ ] 练习：并发 3 个请求后合并结果

### Day 11 · Combine 入门

- [ ] 阅读：`Publisher`、`@Published`、`sink`
- [ ] 练习：搜索框 debounce 过滤列表

### Day 12 · 内存与性能

- [ ] 阅读：值语义、COW 概念、`weak` / `unowned`
- [ ] 练习：Instruments 查 Leaks（造错再修）

### Day 13 · Swift 6 / 严格并发

- [ ] 阅读：`Sendable`、数据竞争警告
- [ ] 练习：模型 `Sendable`，UI 更新标 `@MainActor`

### Day 14 · 周项目

- [ ] 完成：命令行/Playground 版 Habit API 客户端
- [ ] 自查：无滥用 force unwrap、主线程更新 UI
- [ ] WWDC：近 2 年 Swift Concurrency 任看 1 期

---

## 第 3 周：UIKit 现代化

**本周目标**：维护 OC 遗留项目不吃力；掌握 Diffable、新 API。

### Day 15 · UIKit 生命周期

- [ ] 对照 OC：VC 生命周期、Scene 差异
- [ ] 练习：TabBar + Navigation 骨架

### Day 16 · 布局

- [ ] 练习：习惯列表 Cell 自适应高度（Auto Layout 或 SnapKit）
- [ ] 检查：触控 ≥ 44pt、Safe Area、语义色

### Day 17 · Diffable Data Source

- [ ] 阅读：`UICollectionViewDiffableDataSource`
- [ ] 练习：列表增删改 + 动画

### Day 18 · Compositional Layout

- [ ] 练习：统计卡片 + 列表混合布局

### Day 19 · 导航与弹窗

- [ ] 练习：Push、Sheet、`UIAlertController`
- [ ] 对照 OC `presentViewController`

### Day 20 · 现代控件与交互

- [ ] 练习：`UIButton.Configuration`
- [ ] 练习：左滑删除（可参考 SwipeCellKit 思路）

### Day 21 · 周项目

- [ ] 完成：**UIKit 版 Habit App**（列表 + 详情 + 新增，本地假数据）
- [ ] 开源阅读：[Kingfisher](https://github.com/onevcat/Kingfisher) Package 结构 + 一条 API 调用链

---

## 第 4 周：SwiftUI

**本周目标**：能写新功能屏；理解声明式 UI 与状态管理。

### Day 22 · SwiftUI 基础

- [ ] 阅读：`View`、`Modifier`、`Preview`
- [ ] 练习：复刻 UIKit 列表页（静态数据）

### Day 23 · 状态管理

- [ ] 阅读：`@State`、`@Binding`、`@StateObject`
- [ ] 练习：新增/编辑习惯表单

### Day 24 · Observable 与 MVVM

- [ ] 阅读：`@Observable`（iOS 17+）
- [ ] 练习：`HabitViewModel` + 列表绑定
- [ ] 笔记：对比 OC KVO / 手动 `reloadData`

### Day 25 · 导航

- [ ] 阅读：`NavigationStack`、`NavigationPath`
- [ ] 练习：列表 → 详情 → 编辑

### Day 26 · 网络与 .task

- [ ] 练习：`URLSession` + async 拉远程数据
- [ ] UI：加载态 / 空态 / 错误态

### Day 27 · 持久化

- [ ] 选一个深入：**SwiftData** 或 **Core Data**
- [ ] 练习：离线缓存习惯列表

### Day 28 · 周项目

- [ ] 完成：**SwiftUI 版 Habit App**（功能对齐 UIKit 版）
- [ ] 笔记：同样功能 UIKit vs SwiftUI 各 5 条优劣
- [ ] 跑通：[swiftui-sample](https://github.com/apple/swiftui-sample) 任一样例

---

## 第 5 周：工程化 + 真实项目技能

**本周目标**：SPM、分层、测试；能进团队仓库不懵。

### Day 29 · SPM

- [ ] 练习：SPM 引入网络库或自封装 URLSession
- [ ] 了解：CocoaPods 老项目「只维护不新增」策略

### Day 30 · 项目分层

- [ ] 划分：`App` / `Features` / `Core`
- [ ] 练习：拆成 3 个 Group 或 3 个 Local Package

### Day 31 · 网络层设计

- [ ] 阅读：[Moya](https://github.com/Moya/Moya) README
- [ ] 练习：`HabitAPI` enum + async 请求封装

### Day 32 · 单元测试

- [ ] 阅读：XCTest、`@testable import`
- [ ] 练习：ViewModel JSON 解析、日期计算各 ≥ 2 测试

### Day 33 · 存储与权限

- [ ] 练习：Token → Keychain；引导 flag → UserDefaults
- [ ] 阅读：隐私权限「用时再申请」

### Day 34 · 调试与发布

- [ ] 练习：断点、LLDB `po`、`os_log`
- [ ] 了解：Archive、TestFlight、签名常见报错

### Day 35 · 周项目

- [ ] 合并：SwiftUI 壳 + 分层 + 网络 + 持久化
- [ ] 单元测试 ≥ 5 个
- [ ] 开源阅读：Moya 一条请求完整链路

---

## 第 6 周：架构进阶 + 开源实战

**本周目标**：具备读中型仓库能力；完成作品集。

### Day 36 · MVVM 规范

- [ ] 画图：View → ViewModel → Repository → API/DB
- [ ] 重构 Habit App Repository 层

### Day 37 · 导航解耦

- [ ] 阅读：Coordinator / Router 模式
- [ ] 练习：页面跳转抽到 Router（不必全 App）

### Day 38 · 架构体验（二选一）

- [ ] **TCA**：[swift-composable-architecture](https://github.com/pointfreeco/swift-composable-architecture) Tutorial 前 3 节  
  **或**  
- [ ] **VIPER**：读一个模块划分示例

### Day 39 · OC ↔ Swift 混编

- [ ] 阅读：Bridging Header、`@objc`、`@objcMembers`
- [ ] 练习：OC 类被 Swift 调用（模拟老项目）

### Day 40 · 体验与性能

- [ ] 排查：列表滚动卡顿（主线程、图片尺寸）
- [ ] 适配：Dark Mode、Dynamic Type 各 1 屏

### Day 41 · 开源精读

- [ ] 克隆 Kingfisher，画「下载 → 缓存 → 回调」时序图
- [ ] 尝试改一行配置（缓存/超时），本地 commit

### Day 42 · 总复盘 + 作品集

- [ ] README：介绍、架构图、技术栈、截图
- [ ] 完成下方「42 天结业自测」
- [ ] 规划下阶段 30 天（Widget / Push / CI / 模块化 选 2 项）

---

## 每日固定节奏（可复制到日历）

```text
[30min] 读文档 / WWDC / 教程
[60min] Habit App 当日功能
[15min] 「OC 对照笔记」1 条
[15min] Git commit + 勾选本文件
```

---

## 42 天结业自测

- [ ] 1. `struct` 和 `class` 如何选型？`Codable` 怎么用？
- [ ] 2. `guard let` 和 `if let` 区别？何时用 `??`
- [ ] 3. 闭包为何需要 `@escaping`？`[weak self]` 何时必须？
- [ ] 4. `async` 里更新 UI 为什么要 `@MainActor`？
- [ ] 5. `actor` 解决什么问题？
- [ ] 6. Diffable Data Source 比 `reloadData` 好在哪里？
- [ ] 7. `@State` 与 `@Observable` / `@Bindable` 区别？
- [ ] 8. `NavigationStack` 与旧 `NavigationView` 差异？
- [ ] 9. Core Data 与 SwiftData 你会选哪个？为什么？
- [ ] 10. SPM 与 CocoaPods 如何共存？
- [ ] 11. OC Delegate 如何迁移到 Swift？
- [ ] 12. 单元测试应测 ViewModel 还是 View？
- [ ] 13. 图片列表卡顿查哪三层？
- [ ] 14. 读开源项目如何快速定位入口？
- [ ] 15. Swift 6 `Sendable` 与数据竞争警告含义？

---

## 推荐资源

| 类型 | 链接 |
|------|------|
| 官方文档 | https://www.swift.org/documentation/ |
| Apple 文档 | https://developer.apple.com/documentation/ |
| 教程 | https://www.hackingwithswift.com |
| 视频 | https://developer.apple.com/videos/ |
| 示例 | https://developer.apple.com/sample-code/ |

### 开源参考（按周）

| 周次 | 项目 |
|------|------|
| 3 | [Kingfisher](https://github.com/onevcat/Kingfisher) |
| 4 | [swiftui-sample](https://github.com/apple/swiftui-sample) |
| 5 | [Moya](https://github.com/Moya/Moya)、[Alamofire](https://github.com/Alamofire/Alamofire) |
| 6 | [swift-composable-architecture](https://github.com/pointfreeco/swift-composable-architecture) |
| 进阶 | [isowords](https://github.com/pointfreeco/isowords)、[firefox-ios](https://github.com/mozilla-mobile/firefox-ios) |

---

## 进度总览

| 周 | 天数 | 主题 | 完成 |
|----|------|------|------|
| 0 | 准备 | 环境 + 对照表 | ☐ |
| 1 | Day 1–7 | Swift 语言 | ☐ |
| 2 | Day 8–14 | 并发 + Combine | ☐ |
| 3 | Day 15–21 | UIKit | ☐ |
| 4 | Day 22–28 | SwiftUI | ☐ |
| 5 | Day 29–35 | 工程化 | ☐ |
| 6 | Day 36–42 | 架构 + 开源 | ☐ |

---

*生成日期：2026-05-20 · 祝学习顺利 🎯*
