##NSCharacterSet

表示用于搜索操作的一组固定Unicode字符值的对象

  NSCharacterSet对象表示一组符合Unicode的字符。 NSString和NSScanner对象使用NSCharacterSet对象将字符组合在一起进行搜索操作，以便在搜索过程中可以找到任何特定的字符集。 集群的两个公共类NSCharacterSet和NSMutableCharacterSet分别声明静态和动态字符集的编程接口

  使用这些类创建的对象称为字符集对象（当不会产生混淆时，仅作为字符集）。 由于类集群的性质，字符集对象不是NSCharacterSet或NSMutableCharacterSet类的实际实例，而是其私有子类之一。 尽管字符集对象的类是私有的，但它的接口是公共的，正如这些抽象超类NSCharacterSet和NSMutableCharacterSet所声明的那样。 字符集类采用NSCopying和NSMutableCopying协议，方便将一种类型的字符集转换为另一种类型的字符集。

  NSCharacterSet类声明管理一组Unicode字符的对象的编程接口（有关Unicode的信息，请参阅NSString类集群规范）。 NSCharacterSet的主要原始方法characterIsMember：，为其界面中的所有其他实例方法提供基础。 NSCharacterSet的子类只需要实现此方法，加上mutableCopyWithZone：，以获得正确的行为。 为了获得最佳性能，子类还应该覆盖bitmapRepresentation，否则通过调用characterIsMember来工作：对于每个可能的Unicode值
  NSCharacterSet与其Core Foundation对应物CFCharacterSetRef是“免费桥接”。 有关免费桥接的更多信息，请参阅免费电话桥接。
  
  Swift覆盖到Foundation框架提供了CharacterSet结构，该结构桥接到NSCharacterSet类及其可变子类NSMutableCharacterSet。 有关值类型的更多信息，请参阅使用Swift与Cocoa和Objective-C一起使用Cocoa框架（Swift 4.1）。
  
  * 获得标准字符集

  ```
  alphanumericCharacterSet
包含Unicode General Categories L *，M *和N *中字符的字符集。
capitalizedLetterCharacterSet
包含Unicode General Category Lt中字符的字符集。
controlCharacterSet
包含Unicode General Category Cc和Cf中字符的字符集。
decimalDigitCharacterSet
包含十进制数类别中字符的字符集。
decomposableCharacterSet
包含单个Unicode字符的字符集，也可以通过Unicode字符编码标准3.2版中“标准分解”的定义表示为组合字符序列（例如带有重音的字母）。
illegalCharacterSet
包含非字符类别中的值或尚未在Unicode标准的3.2版中定义的字符集。
letterCharacterSet
包含Unicode General Category L *＆M *中字符的字符集。
lowercaseLetterCharacterSet
包含Unicode General Category Ll中字符的字符集。
newlineCharacterSet
包含换行符的字符集（U + 000A~U + 000D，U + 0085，U + 2028和U + 2029）。
nonBaseCharacterSet
包含Unicode General Category M *中字符的字符集。
punctuationCharacterSet
包含Unicode General Category P *中字符的字符集。
symbolCharacterSet
包含Unicode General Category S *中字符的字符集。
uppercaseLetterCharacterSet
包含Unicode General Category Lu和Lt中字符的字符集。
whitespaceAndNewlineCharacterSet
包含Unicode General Category Z *，U + 000A~U + 000D和U + 0085中的字符的字符集。
whitespaceCharacterSet
包含Unicode General Category Zs和CHARACTER TABULATION（U + 0009）中字符的字符集。
  ```
  
  * 获取URL编码的字符集

  ```
  URLFragmentAllowedCharacterSet
返回片段URL组件中允许的字符的字符集。
URLHostAllowedCharacterSet
返回主机URL子组件中允许的字符的字符集。
URLPasswordAllowedCharacterSet
返回密码URL子组件中允许的字符的字符集。
URLPathAllowedCharacterSet
返回路径URL组件中允许的字符的字符集。
URLQueryAllowedCharacterSet
返回查询URL组件中允许的字符的字符集。
URLUserAllowedCharacterSet
返回用户URL子组件中允许的字符的字符集。
  ```
  
* 创建自定义字符集

```
  
```
  