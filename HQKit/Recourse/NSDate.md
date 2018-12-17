## NSDate
表示特定时间点，与任何日历或时区无关

* Creating a Date  创建日期


```
+date
创建并返回设置为当前日期和时间的新日期对象。
+ dateWithTimeIntervalSinceNow：
创建并返回从当前日期和时间设置为给定秒数的日期对象。
+ dateWithTimeInterval：sinceDate：
创建并返回从指定日期开始设置为给定秒数的日期对象。
+ dateWithTimeIntervalSinceReferenceDate：
从2001年1月1日00:00:00 UTC创建并返回设置为给定秒数的日期对象。
+ dateWithTimeIntervalSince1970：
从1970年1月1日00:00:00 UTC创建并返回设置为给定秒数的日期对象。

```

* 初始化日期

```
- init
返回初始化为当前日期和时间的日期对象。
- initWithTimeIntervalSinceNow：
返回相对于当前日期和时间初始化的日期对象，给定的秒数。
- initWithTimeInterval：sinceDate：
返回相对于另一个给定日期初始化的日期对象，给定的秒数。
- initWithTimeIntervalSinceReferenceDate：
返回相对于2001年1月1日00:00:00 UTC初始化的日期对象，给定的秒数。
- initWithTimeIntervalSince1970：
返回相对于1970年1月1日00:00:00 UTC初始化的日期对象，给定的秒数。
- initWithCoder：
返回从给定的unarchiver中的数据初始化的日期对象。
```

* 获得时间边界

```
distantFuture
表示遥远未来日期的日期对象。
distantPast
表示远处过去日期的日期对象。
```

* Comparing Dates

```
- isEqualToDate：
返回一个布尔值，指示给定对象是否与接收器完全相等的日期。
- earlierDate:
返回接收器的早期和另一个给定日期。
- laterDate：
返回接收器的后一个和另一个给定的日期。
- compare:
指示接收器的时间顺序和另一个给定日期。
当前date和另一个date完全相同，NSOrderedSame
当前date晚于anotherDate，NSOrderedDescending
当前date早于另一个日期，NSOrderedAscending。

```

* Getting Time Intervals 获得时间间隔

```
- timeIntervalSinceDate：
当前date与另一个给定date之间的间隔。
timeIntervalSinceNow
日期对象与当前日期和时间之间的间隔。
timeIntervalSinceReferenceDate
日期对象与2001年1月1日00:00:00 UTC之间的间隔。
timeIntervalSince1970
日期对象与1970年1月1日00:00:00 UTC之间的间隔。
timeIntervalSinceReferenceDate
2001年1月1日世界贸易组织00:00:00与当前日期和时间之间的间隔。
NSTimeIntervalSince1970
从1970年1月1日至参考日期2001年1月1日的秒数。

```

* 添加时间间隔

```
- dateByAddingTimeInterval：
返回一个新的日期对象，该对象设置为相对于接收者的给定秒数。

```

* 描述日期

```
description
日期对象的字符串表示形式。
- descriptionWithLocale：
使用给定的语言环境返回日期的字符串表示形式。
```

* 识别通知

```
NSSystemClockDidChangeNotification
系统时钟更改时发布通知。
```

























