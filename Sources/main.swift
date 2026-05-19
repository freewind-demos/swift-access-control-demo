// swift-access-control-demo.swift

// ============ public ============
// 任何地方可见，可被继承和重写
public class PublicClass {
    public var publicProperty = "公开属性"

    public func publicMethod() {
        print("公开方法")
    }
}

// ============ internal (默认) ============
// 模块内可见
internal class InternalClass {
    var internalProperty = "内部属性"

    func internalMethod() {
        print("内部方法")
    }
}

// ============ fileprivate ============
// 文件内可见
fileprivate class FilePrivateClass {
    fileprivate var fileprivateProperty = "文件私有属性"

    fileprivate func fileprivateMethod() {
        print("文件私有方法")
    }
}

// ============ private ============
// 类/结构体内可见
class PrivateDemo {
    private var privateProperty = "私有属性"

    private func privateMethod() {
        print("私有方法")
    }

    // 同一作用域内可以访问
    func access() {
        print(privateProperty)
        privateMethod()
    }
}

// ============ 示例 ============
let publicObj = PublicClass()
print(publicObj.publicProperty)

let internalObj = InternalClass()
print(internalObj.internalProperty)

fileprivate let fileObj = FilePrivateClass()
print(fileObj.fileprivateProperty)

let privateObj = PrivateDemo()
privateObj.access()

// ============ get/set 访问控制 ============
class Counter {
    private var _count = 0

    var count: Int {
        get { _count }
        set { _count = max(0, newValue) }
    }
}

var counter = Counter()
counter.count = 10
print("计数: \(counter.count)")
counter.count = -5
print("计数(不能为负): \(counter.count)")
