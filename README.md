# Swift 访问控制 Demo

## 简介

展示 Swift 的访问控制级别：public、internal、fileprivate、private。

## 启动和使用

```bash
cd swift-access-control-demo
swift run
```

## 教程

### 访问级别

- `public`: 任何地方可见，可继承/重写
- `internal`: 模块内可见（默认）
- `fileprivate`: 文件内可见
- `private`: 定义作用域内可见

### 细粒度控制

可以单独控制 get 和 set 访问级别
