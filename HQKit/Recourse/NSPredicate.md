>NSPredicate
用于约束搜索的获取或内存中过滤的逻辑条件的定义。

****创建

```
+ predicateWithFormat：
创建并返回通过创建具有给定格式的新字符串并解析结果而形成的新谓词。

+ predicateWithFormat：argumentArray：
通过将给定数组中的值替换为格式字符串并解析结果来初始化谓词。

+ predicateWithFormat：参数：
通过将参数列表中的值替换为格式字符串并解析结果来初始化谓词。

- predicateWithSubstitutionVariables：
返回谓词的副本，谓词的变量由给定的替换变量字典中指定的值替换。

+ predicateWithValue：
创建并返回始终求值为给定布尔值的谓词。

+ predicateWithBlock：
初始化使用指定的块对象和绑定字典进行求值的谓词。

+ predicateFromMetadataQueryString：
使用元数据查询字符串初始化谓词。
```

****测试

```
- evaluateWithObject：
返回一个布尔值，指示指定的对象是否与谓词指定的条件匹配。

- evaluateWithObject：substitutionVariables：
返回一个布尔值，指示在替换给定变量字典中的值之后指定的对象是否与谓词指定的条件匹配。

- allowEvaluation
强制安全解码的谓词以允许评估。
```
