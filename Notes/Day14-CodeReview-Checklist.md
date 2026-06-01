# Day 14 · 代码 Review 自查清单

> Week 2 周项目：`Day14-HabitAPIClient`  
> 目标：async + Codable + 统一错误 + 无主线程违规

---

## 1. 强制解包 / 可选

- [ ] 无业务逻辑里的 `!`（`try!`、`foo!`）
- [ ] JSON / 网络结果用 `do-catch` 或 `throws`，不用 `try!`
- [ ] 可选解包优先 `guard let` / `if let`
- [ ] `as?` 失败有分支，不用 `as!`

## 2. 并发与线程

- [ ] 网络 `fetchHabits()` **未**标 `@MainActor`（在后台执行）
- [ ] UI 输出在 `HabitConsoleUI`（`@MainActor`）或 `await MainActor.run`
- [ ] `actor HabitStore` 修改状态，外部 `await store.xxx`
- [ ] 跨 Task 传递的模型遵守 `Sendable`（`Habit`、`AppError`）

## 3. 错误处理

- [ ] 对外统一 `AppError`，边界 `AppError.map(_:)`
- [ ] 失败路径有用户可读 `userMessage`
- [ ] 无「只 print 不处理」的 `catch { }`

## 4. 模型与 API

- [ ] `Habit`：`Codable` + `CodingKeys` 拼写正确
- [ ] `JSONDecoder.dateDecodingStrategy = .iso8601`
- [ ] 空数据有 `AppError.emptyData`

## 5. 内存（Week 2 回顾）

- [ ] 无闭包循环引用（本 CLI 无 VC；有回调时 `[weak self]`）
- [ ] Combine 若使用：`store(in: &cancellables)`

## 6. 命名与结构

- [ ] `fetchHabits`（非 fecth）
- [ ] `refreshAsync` / `refresh` 语义清晰
- [ ] 分层：`Core` 网络 · `Features` 仓库 · `App` 入口

## 7. 运行验证

```bash
cd Day14-HabitAPIClient
xcodebuild -scheme Day14-HabitAPIClient -destination 'platform=macOS' build
.build/debug/Day14-HabitAPIClient   # 或 Xcode Run
```

- [ ] 场景 1 Mock 成功列表
- [ ] 场景 2 JSON 文件（需在工程目录运行或配置 Working Directory）
- [ ] 场景 3 网络失败有 ❌ 提示
- [ ] 场景 4 解析失败有 ❌ 提示

---

## 8. 自评分（1–5）

| 项 | 分 |
|----|-----|
| 独立完成度 | |
| 错误处理 | |
| 并发正确性 | |
| 代码可读性 | |

**Week 2 结业**：能向他人讲清「请求 → 解码 → actor 存 → MainActor 展示」全链路。
