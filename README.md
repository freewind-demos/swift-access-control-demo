# Swift 访问控制 Demo

## 简介

本 demo 展示 Swift 的访问控制级别。Swift 提供了精细的访问控制，让你可以控制代码的可见性和可访问性。

## 基本原理

### 什么是访问控制？

访问控制决定代码的某个部分可以在什么范围内被访问。Swift 提供了五个访问级别，从最开放到最严格：

| 级别 | 关键字 | 可见范围 |
|------|--------|----------|
| 开放 | open | 任何地方，可继承/重写 |
| 公开 | public | 任何地方，但不可继承/重写 |
| 内部 | internal | 模块内可见（默认） |
| 文件私有 | fileprivate | 文件内可见 |
| 私有 | private | 定义作用域内可见 |

### 访问级别的选择

```
open        → public → internal → fileprivate → private
最开放                                              最严格
```

---

## 启动和使用

### 环境要求

- Swift 5.0+
- macOS 或 Linux

### 安装和运行

```bash
cd swift-access-control-demo
swift run
---

## 教程

### public：公开访问

`public` 让代码在任何地方都可见：

```swift
public class PublicClass {
    public var publicProperty = "公开属性"

    public func publicMethod() {
        print("公开方法")
    }
}

let publicObj = PublicClass()
print(publicObj.publicProperty)
```

### internal：内部访问（默认）

`internal` 是默认访问级别，代码只在模块内可见：

```swift
internal class InternalClass {
    var internalProperty = "内部属性"

    func internalMethod() {
        print("内部方法")
    }
}
// 在同一个模块内可以访问
let internalObj = InternalClass()
print(internalObj.internalProperty)
```

### fileprivate：文件私有

`fileprivate` 限制代码只在同一文件内可见：

```swift
fileprivate class FilePrivateClass {
    fileprivate var fileprivateProperty = "文件私有属性"

    fileprivate func fileprivateMethod() {
        print("文件私有方法")
    }
}
// 同一文件内可以访问
let fileObj = FilePrivateClass()
print(fileObj.fileprivateProperty)
```

### private：私有访问

`private` 是最严格的访问级别，只在定义的作用域内可见：

```swift
class PrivateDemo {
    private var privateProperty = "私有属性"

    private func privateMethod() {
        print("私有方法")
    }

    // 同一作用域内可以访问
    func access() {
        print(privateProperty)  // 可以访问
        privateMethod()         // 可以访问
    }
}

let privateObj = PrivateDemo()
privateObj.access()
// privateObj.privateProperty  // 错误！无法访问
```

### get/set 访问控制

可以分别控制属性的 getter 和 setter：

```swift
class Counter {
    private var _count = 0

    // 外部可以读取，但不能直接设置
    var count: Int {
        get { _count }
        set { _count = max(0, newValue) }  // set 是 private
    }
}

var counter = Counter()
counter.count = 10
print("计数: \(counter.count)")  // 可以读取
counter.count = -5
print("计数(不能为负): \(counter.count)")  // 自动限制为 0
```

---

## 访问级别的使用场景

| 场景 | 推荐访问级别 |
|------|-------------|
| API 公开接口 | public / open |
| 模块内部使用 | internal（默认） |
| 同文件辅助代码 | fileprivate |
| 类内部细节 | private |

---

## 关键代码详解

### 访问级别的继承规则

- **public / internal** 的类：子类可以继承
- **public** 的成员：子类可以继承但不能重写
- **open** 的类/成员：子类可以继承/重写

### fileprivate vs private

```swift
// fileprivate: 同一文件内可见
fileprivate class FileHelper {
    static func help() {}
}

// private: 仅在定义的作用域内可见
class MyClass {
    private var secret = "secret"
}
```

---

## 总结

Swift 的访问控制非常精细：

1. **open** — 完全开放，可继承和重写
2. **public** — 公开，但不可继承/重写
3. **internal** — 模块内可见（默认）
4. **fileprivate** — 文件内可见
5. **private** — 作用域内可见
6. **get/set 控制** — 读写权限可以分开控制

最佳实践：
- 对外 API 使用 public / open
- 内部实现使用 internal（默认）
- 细节实现使用 fileprivate / private
- 用 private(set) 让属性只读
