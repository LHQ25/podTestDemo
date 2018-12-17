## NSDateInterval
*  Creating Date Intervals 创建日期间隔

```
通过将开始和结束日期设置为当前日期来初始化日期间隔。
- init
使用给定的开始日期和持续时间初始化日期间隔。
- initWithStartDate:duration:
从给定的开始日期和结束日期初始化日期间隔。
- initWithStartDate:endDate:
返回从给定的unarchiver中的数据初始化的日期间隔。
- initWithCoder:
```

* 访问开始日期，结束日期和持续时间

```
日期间隔的开始日期。
@property(readonly, copy) NSDate *startDate;
日期间隔的结束日期。
@property(readonly, copy) NSDate *endDate;
日期间隔的持续时间。
@property(readonly) NSTimeInterval duration;
```

* 比较日期间隔


```
 与指定的日期间隔进行比较。
-(NSComparisonResult)compare:(NSDateInterval *)dateInterval;
返回NSComparisonResult值，该值指示接收方的时间顺序和给定的日期间隔：

如果接收者的startDate早于dateInterval发生，或者两个startDate值相等且接收者的持续时间小于dateInterval的持续时间，则NSOrderedAscending。

NSOrderedDescending，如果接收者的startDate发生的时间晚于dateInterval，或两个startDate值相等且接收者的持续时间大于dateInterval的持续时间。

NSOrderedSame，如果接收者的startDate和duration值等于dateInterval的值。

是否等于指定的日期间隔。
- isEqualToDateInterval:

```


* 确定交叉点

```
是否与指定的日期间隔相交。
- intersectsDateInterval:

与指定日期间隔之间的交集。
- intersectionWithDateInterval:
```

* 确定日期是否在日期间隔内发生

```
是否包含指定日期。
- containsDate:
```
























