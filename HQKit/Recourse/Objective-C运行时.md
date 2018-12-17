##Objective-C运行时

获得对Objective-C运行时和Objective-C根类型的低级访问。

Objective-C运行时模块API定义了Objective-C语言的基础。 这些API包括：

诸如NSObject类和NSObject协议之类的类型，它们提供大多数Objective-C类的根功能

构成Objective-C运行时的函数和数据结构，它提供对Objective-C语言的动态属性的支持

您通常不需要直接使用此模块。

* 类

```
NSObject
大多数Objective-C类层次结构的根类，子类从该类继承运行时系统的基本接口，并具有表现为Objective-C对象的能力。
Object
protocol
list
```

* 协议

```
NSObject
所有Objective-C对象的基础方法组。
```

* 参考

```
  Objective-C运行时
描述macOS Objective-C运行时库支持函数和数据结构。
  Objective-C结构
  Objective-C常数
  Objective-C函数
  Objective-C数据类型
```