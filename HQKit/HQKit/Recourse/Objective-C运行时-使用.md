##Objective-C运行时

描述macOS Objective-C运行时库支持函数和数据结构。

Objective-C运行时是一个运行时库，它提供对Objective-C语言的动态属性的支持，因此被所有Objective-C应用程序链接。 Objective-C运行时库支持函数在/usr/lib/libobjc.A.dylib中的共享库中实现。

在Objective-C中编程时，通常不需要直接使用Objective-C运行时库。此API主要用于在Objective-C和其他语言之间开发桥接层，或用于低级调试。

* 使用类

```
class_getName
返回类的名称。
class_getSuperclass
返回类的超类。
class_setSuperclass
设置给定类的超类。弃用
class_isMetaClass
返回一个布尔值，指示类对象是否为元类。
class_getInstanceSize
返回类的实例大小。
class_getInstanceVariable
返回给定类的指定实例变量的Ivar。
class_getClassVariable
返回给定类的指定类变量的Ivar。
class_addIvar
向类添加新的实例变量。
class_copyIvarList
描述类声明的实例变量。
class_getIvarLayout
返回给定类的Ivar布局的描述。
class_setIvarLayout
设置给定类的Ivar布局。
class_getWeakIvarLayout
返回给定类的弱Ivars布局的描述。
class_setWeakIvarLayout
设置给定类的弱Ivars的布局。
class_getProperty
返回具有给定类的给定名称的属性。
class_copyPropertyList
描述类声明的属性。
class_addMethod
向具有给定名称和实现的类添加新方法。
class_getInstanceMethod
返回给定类的指定实例方法。
class_getClassMethod
返回指向描述给定类的给定类方法的数据结构的指针。
class_copyMethodList
描述类实现的实例方法。
class_replaceMethod
替换给定类的方法的实现。
class_getMethodImplementation
返回在特定消息发送到类的实例时将调用的函数指针。
class_getMethodImplementation_stret
返回在特定消息发送到类的实例时将调用的函数指针。
class_respondsToSelector
返回一个布尔值，指示类的实例是否响应特定选择器。
class_addProtocol
将协议添加到类中。
class_addProperty
向类添加属性。
class_replaceProperty
替换类的属性。
class_conformsToProtocol
返回一个布尔值，指示类是否符合给定的协议。
class_copyProtocolList
描述一个类采用的协议。
class_getVersion
返回类定义的版本号。
class_setVersion
设置类定义的版本号。
objc_getFutureClass
由CoreFoundation的免费桥接使用。
objc_setFutureClass
由CoreFoundation的免费桥接使用。
```

* 添加类

```
objc_allocateClassPair
创建一个新类和元类。
objc_disposeClassPair
销毁一个类及其相关的元类。
objc_registerClassPair
注册使用objc_allocateClassPair分配的类。
objc_duplicateClass
由Foundation的Key-Value Observing使用。
```

* 实例化类

```
object_copy
返回给定对象的副本。
object_dispose
释放给定对象占用的内存。
object_setInstanceVariable
更改类实例的实例变量的值。
object_getInstanceVariable
获取类实例的实例变量的值。
object_getIndexedIvars
返回指向使用给定对象实例分配的任何额外字节的指针。
object_getIvar
读取对象中实例变量的值。
object_setIvar
设置对象中实例变量的值。
object_getClassName
返回给定对象的类名。
object_getClass
返回对象的类。
object_setClass
设置对象的类。
```

* 获得类定义

```
objc_getClassList
获取已注册的类定义列表。
objc_copyClassList
创建并返回指向所有已注册类定义的指针列表。
objc_lookUpClass
返回指定类的类定义。
objc_getClass
返回指定类的类定义。
objc_getRequiredClass
返回指定类的类定义。
objc_getMetaClass
返回指定类的元类定义。
```

* 实例变量

```
ivar_getName
返回实例变量的名称。
ivar_getTypeEncoding
返回实例变量的类型字符串。
ivar_getOffset
返回实例变量的偏移量。
```

* 关联对象

```
objc_setAssociatedObject
使用给定的键和关联策略为给定对象设置关联值。
objc_getAssociatedObject
返回与给定键的给定对象关联的值。
objc_removeAssociatedObjects
删除给定对象的所有关联。
```

* 发送消息

当遇到方法调用时，编译器可能会生成对任何几个函数的调用，以执行实际的消息调度，具体取决于接收者，返回值和参数。 您可以使用这些函数从您自己的普通C代码动态调用方法，或使用NSObject的perform ...方法不允许的参数形式。 这些函数在/usr/include/objc/objc-runtime.h中声明。

* objc_msgSend将具有简单返回值的消息发送到类的实例。

* objc_msgSend_stret将具有数据结构返回值的消息发送到类的实例。

* objc_msgSendSuper将具有简单返回值的消息发送到类的实例的超类。

* objc_msgSendSuper_stret将具有数据结构返回值的消息发送到类的实例的超类。

```
objc_msgSend
将具有简单返回值的消息发送到类的实例。
objc_msgSend_fpret
将具有浮点返回值的消息发送到类的实例。
objc_msgSend_stret
将具有数据结构返回值的消息发送到类的实例。
objc_msgSendSuper
将具有简单返回值的消息发送到类的实例的超类。
objc_msgSendSuper_stret
将具有数据结构返回值的消息发送到类实例的超类。
```

* 方法

```
method_invoke
调用指定方法的实现。
method_invoke_stret
调用返回数据结构的指定方法的实现。
method_getName
返回方法的名称。
method_getImplementation
返回方法的实现。
method_getTypeEncoding
返回描述方法参数和返回类型的字符串。
method_copyReturnType
返回描述方法返回类型的字符串。
method_copyArgumentType
返回描述方法的单个参数类型的字符串。
method_getReturnType
通过引用返回描述方法返回类型的字符串。
method_getNumberOfArguments
返回方法接受的参数数。
method_getArgumentType
通过引用返回描述方法的单个参数类型的字符串。
method_getDescription
返回指定方法的方法描述结构。
method_setImplementation
设置方法的实现。
method_exchangeImplementations
交换两种方法的实现。
```

* 类库

```
objc_copyImageNames
返回所有已加载的Objective-C框架和动态库的名称。
class_getImageName
返回类源自的动态库的名称。
objc_copyClassNamesForImage
返回指定库或框架中所有类的名称。
```

* 选择器

```
sel_getName
返回给定选择器指定的方法的名称。
sel_registerName
使用Objective-C运行时系统注册方法，将方法名称映射到选择器，并返回选择器值。
sel_getUid
使用Objective-C运行时系统注册方法名称。
sel_isEqual
返回一个布尔值，指示两个选择器是否相等。
```

* 协议

```
objc_getProtocol
返回指定的协议。
objc_copyProtocolList
返回运行时已知的所有协议的数组。
objc_allocateProtocol
创建一个新的协议实例。
objc_registerProtocol
使用Objective-C运行时注册新创建的协议。
protocol_addMethodDescription
向协议添加方法。
protocol_addProtocol
将注册协议添加到正在构建的另一个协议。
protocol_addProperty
将属性添加到正在构建的协议中。
protocol_getName
返回协议的名称。
protocol_isEqual
返回一个布尔值，指示两个协议是否相等。
protocol_copyMethodDescriptionList
返回满足给定协议的给定规范的方法的方法描述数组。
protocol_getMethodDescription
返回给定协议的指定方法的方法描述结构。
protocol_copyPropertyList
返回协议声明的属性数组。
protocol_getProperty
返回给定协议的指定属性。
protocol_copyProtocolList
返回协议采用的协议数组。
protocol_conformsToProtocol
返回一个布尔值，指示一个协议是否符合另一个协议。
```

* 属性

```
property_getName
返回属性的名称。
property_getAttributes
返回属性的属性字符串。
property_copyAttributeValue
给定属性名称返回属性属性的值。
property_copyAttributeList
返回给定属性的属性属性数组。
```

* 使用Objective-C语言功能

```
objc_enumerationMutation
在foreach迭代期间检测到突变时由编译器插入。
objc_setEnumerationMutationHandler
设置当前的变异处理程序。
imp_implementationWithBlock
创建一个指向调用方法时调用指定块的函数的指针。
imp_getBlock
返回与使用imp_implementationWithBlock创建的IMP关联的块。
imp_removeBlock
将块与使用imp_implementationWithBlock创建的IMP解除关联，并释放已创建的块的副本。
objc_loadWeak
加载弱指针引用的对象并返回它。
objc_storeWeak
在__weak变量中存储新值。
```

* 类定义数据结构

```
class
表示Objective-C类的opaque类型。
method
一个opaque类型，表示类定义中的方法。
Ivar
表示实例变量的opaque类型。
Category
表示类别的opaque类型。
objc_property_t
一个opaque类型，表示Objective-C声明的属性。
IMP
指向方法实现开始的指针。
SEL
定义表示方法选择器的opaque类型。
objc_method_description
定义Objective-C方法。
objc_method_list
包含一系列方法定义。
弃用
objc_cache
方法调用的性能优化。 包含最近使用的方法的指针。
objc_protocol_list
表示正式协议列表。
objc_property_attribute_t
定义属性属性。
```

* 实例数据类型

这些是表示对象，类和超类的数据类型。

* id指向类实例的指针。

* id表示类的实例。

* objc_super指定实例的超类。

```
id
指向类实例的指针。
objc_super
指定实例的超类。

```

* 布尔值

```
BOOL
键入以表示布尔值。
```

* 关联参考文献

```
objc_AssociationPolicy
键入以指定关联的行为。
```