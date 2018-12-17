##NSDateFormatter 介绍

格式化程序，用于在日期及其文本表示之间进行转换。

* 转换对象

```
字符串转NSDate  字符串无法解析则返回nil
- (NSDate *)dateFromString:(NSString *)string;
- 
date 格式化成时间字符串
- (NSString *)stringFromDate:(NSDate *)date;

返回给定日期的字符串表示形式，使用指定的日期和时间样式为当前语言环境设置格式。
+ (NSString *)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle;

通过引用返回给定字符串的日期表示和所用字符串的范围，并返回一个布尔值，指示是否可以解析该字符串。
- (BOOL)getObjectValue:(out id  _Nullable *)obj forString:(NSString *)string range:(inout NSRange *)rangep error:(out NSError * _Nullable *)error;
```

* 管理格式和样式

```
日期样式
@property NSDateFormatterStyle dateStyle;
时间风格
@property NSDateFormatterStyle timeStyle;
日期格式字符串。
@property(copy) NSString *dateFormat;
使用指定的接收器区域设置从模板设置日期格式。
- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate;
返回一个本地化的日期格式字符串，表示为指定的语言环境适当排列的给定日期格式组件
+ (NSString *)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale;

NSFormattingContext

NSFormattingContextUnknown
未知的格式化上下文。
NSFormattingContextDynamic
格式化上下文在运行时自动确定。
NSFormattingContextStandalone
独立使用的格式化上下文。
NSFormattingContextListItem
列表或菜单项的格式上下文。
NSFormattingContextBeginningOfSentence
句子开头的格式化上下文。
NSFormattingContextMiddleOfSentence
句子中间的格式化上下文。
```

* 管理属性

```
日历
@property(copy) NSCalendar *calendar;
默认日期
@property(copy) NSDate *defaultDate;
区域设置
@property(copy) NSLocale *locale;
时区
@property(copy) NSTimeZone *timeZone;
可以用两位数年份说明符表示的最早日期
@property(copy) NSDate *twoDigitStartDate;
公历的开始日期
@property(copy) NSDate *gregorianStartDate;
```

* 管理行为版本

```
一个布尔值，指示接收器在解析字符串时是否使用启发式算法
@property(getter=isLenient) BOOL lenient;
一个布尔值，指示接收方是否对日期组件使用诸如“今天”和“明天”之类的短语
@property BOOL doesRelativeDateFormatting;
```

* 管理AM和PM符号

```
AM符号
@property(copy) NSString *AMSymbol;
PM符号
@property(copy) NSString *PMSymbol;
```

* 管理工作日符号

```
工作日符号数组
@property(copy) NSArray<NSString *> *weekdaySymbols;
短工作日符号数组。
@property(copy) NSArray<NSString *> *shortWeekdaySymbols;
非常短的工作日符号数组
@property(copy) NSArray<NSString *> *veryShortWeekdaySymbols;
独立工作日符号数组。
@property(copy) NSArray<NSString *> *standaloneWeekdaySymbols;
短独立工作日符号数组。
@property(copy) NSArray<NSString *> *shortStandaloneWeekdaySymbols;
非常短的独立工作日符号数组
@property(copy) NSArray<NSString *> *veryShortStandaloneWeekdaySymbols;
```

* 管理月份符号

```
月份符号
@property(copy) NSArray<NSString *> *monthSymbols;
短月份符号
@property(copy) NSArray<NSString *> *shortMonthSymbols;
非常短月份符号
@property(copy) NSArray<NSString *> *veryShortMonthSymbols;
独立月份符号
@property(copy) NSArray<NSString *> *standaloneMonthSymbols;
短的独立月份符号
@property(copy) NSArray<NSString *> *shortStandaloneMonthSymbols;
非常短的独立月份符号
@property(copy) NSArray<NSString *> *veryShortStandaloneMonthSymbols;
```

* 管理季度符号

```
季度符号
@property(copy) NSArray<NSString *> *quarterSymbols;
短季度符号
@property(copy) NSArray<NSString *> *shortQuarterSymbols;
独立季度符号
@property(copy) NSArray<NSString *> *standaloneQuarterSymbols;
短独立季度符号
@property(copy) NSArray<NSString *> *shortStandaloneQuarterSymbols;
```

* 管理时代符号

```
时代符号
@property(copy) NSArray<NSString *> *eraSymbols;
长时代符号
@property(copy) NSArray<NSString *> *longEraSymbols;
```
























