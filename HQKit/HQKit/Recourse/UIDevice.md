##UIDevice

当前设备

使用UIDevice对象获取有关设备的信息，例如分配的名称，设备型号以及操作系统名称和版本。您还可以使用UIDevice实例来检测设备特征的变化，例如物理方向。您可以使用orientation属性获取当前方向，也可以通过注册UIDeviceOrientationDidChangeNotification通知来接收更改通知。在使用这些技术之一获取方向数据之前，必须使用beginGeneratingDeviceOrientationNotifications方法启用数据传递。当您不再需要跟踪设备方向时，请调用endGeneratingDeviceOrientationNotifications方法以禁用通知的传递。

同样，您可以使用UIDevice实例获取有关电池充电状态（由batteryState属性描述）和充电级别（由batteryLevel属性描述）更改的信息和通知。 UIDevice实例还提供对接近传感器状态的访问（由proximityState属性描述）。接近传感器检测用户是否将设备靠近他们的脸部。仅在需要时启用电池监控或接近感应。

您还可以使用playInputClick实例方法在自定义输入和键盘附件视图中播放键盘输入点击

* 获取共享设备实例

```
currentDevice
返回表示当前设备的对象

您可以访问返回的UIDevice实例的属性以获取有关设备的信息。 在注册接收设备通知之前，必须实例化UIDevice实例
```

* 确定可用功能

```
multitaskingSupported
一个布尔值，指示当前设备是否支持多任务处理
```

* 识别设备和操作系统

```
name
标识设备的名称。
此属性的值是任意字母数字字符串，它与设备关联作为标识符。 例如，您可以在常规>关于设置中找到iOS设备的名称

SYSTEMNAME
在接收器表示的设备上运行的操作系统的名称。

systemVersion
当前版本的操作系统。

model
设备的型号。
模型字符串的可能示例是@“iPhone”和@“iPod touch”。

localizedModel
设备的模型作为本地化字符串。
此属性的值是一个字符串，其中包含从model返回的字符串的本地化版本

userInterfaceIdiom
在当前设备上使用的接口样式。
对于通用应用程序，您可以使用此属性来定制应用程序对特定类型设备的行为。 例如，iPhone和iPad设备具有不同的屏幕尺寸，因此您可能希望根据当前设备的类型创建不同的视图和控件

identifierForVendor
一个字母数字字符串，用于唯一标识应用程序供应商的设备
```

* 跟踪设备方向

```
orientation
返回设备的物理方向。
属性的值是一个常量，表示设备的当前方向。 此值表示设备的物理方向，可能与应用程序用户界面的当前方向不同。 有关可能值的说明，请参阅UIDeviceOrientation。

除非通过调用beginGeneratingDeviceOrientationNotifications启用了方向通知，否则此属性的值始终返回0


UIDeviceOrientation
设备的物理方向。
orientation属性使用这些常量来标识设备方向。 这些常量标识设备的物理方向，并不依赖于应用程序用户界面的方向
UIDeviceOrientationUnknown
无法确定设备的方向。
UIDeviceOrientationPortrait
设备处于纵向模式，设备直立，主页按钮位于底部。
UIDeviceOrientationPortraitUpsideDown
设备处于纵向模式但是上下颠倒，设备保持直立，主页按钮位于顶部。
UIDeviceOrientationLandscapeLeft
设备处于横向模式，设备直立，主页按钮位于右侧。
UIDeviceOrientationLandscapeRight
设备处于横向模式，设备直立，主页按钮位于左侧。
UIDeviceOrientationFaceUp
该装置与地面平行，屏幕朝上。
UIDeviceOrientationFaceDown
该装置与地面平行，屏幕朝下


generatesDeviceOrientationNotifications
一个布尔值，指示接收器是否生成方向通知（是）（否）。
如果此属性的值为YES，则当设备更改方向时，共享UIDevice对象会发布UIDeviceOrientationDidChangeNotification通知。 如果值为NO，则不会生成方向通知。 设备方向通知只能在对beginGeneratingDeviceOrientationNotifications和endGeneratingDeviceOrientationNotifications方法的调用之间生成


 -  beginGeneratingDeviceOrientationNotifications
开始生成设备方向更改的通知。
在尝试从接收器获取方向数据之前，必须调用此方法。 此方法启用设备的加速度计硬件，并开始向接收器传送加速度事件。 接收器随后使用这些事件在设备方向更改时发布UIDeviceOrientationDidChangeNotification通知并更新orientation属性。

您可以安全地嵌套对此方法的调用，但是您应该始终将每个调用与对endGeneratingDeviceOrientationNotifications方法的相应调用进行匹配。


 -  endGeneratingDeviceOrientationNotifications
结束设备方向更改通知的生成
此方法停止发布UIDeviceOrientationDidChangeNotification通知，并通知系统如果加速计硬件未在其他地方使用，它可以关闭加速计硬件。 在上一次调用beginGeneratingDeviceOrientationNotifications方法之后调用此方法。
```

* 确定当前的方向

```
UIDeviceOrientationIsPortrait
返回一个布尔值，指示设备是否处于纵向方向。
UIDeviceOrientationIsLandscape
返回一个布尔值，指示设备是否处于横向方向。
UIDeviceOrientationIsFlat
返回一个布尔值，指示指定的方向是面朝上还是面朝下。
UIDeviceOrientationIsValidInterfaceOrientation
返回一个布尔值，指示指定的方向是纵向还是横向方向之一
```

* 获取设备电池状态

```
batteryLevel
设备的电池电量。
电池电量范围从0.0（完全放电）到1.0（100％充电）。 在访问此属性之前，请确保已启用电池监视。

如果未启用电池监控，则电池状态为UIDeviceBatteryStateUnknown，此属性的值为-1.0


batteryMonitoringEnabled
一个布尔值，指示是否启用电池监控（是）（否）。
如果您的应用需要通知电池状态变化，或者您想检查电池电量水平，请启用电池监控。

此属性的默认值为NO，其中：

禁用与电池相关的通知的发布

禁用读取电池电量和电池状态的功能


batteryState
设备的电池状态。
batteryState的值是UIDeviceBatteryState中的常量之一。

如果未启用电池监视，则此属性的值为UIDeviceBatteryStateUnknown。


UIDeviceBatteryState
设备的电池电量状态
UIDeviceBatteryStateUnknown
无法确定设备的电池状态。
UIDeviceBatteryStateUnplugged
设备未插入电源; 电池正在放电。
UIDeviceBatteryStateCharging
设备已接通电源，电池电量低于100％。
UIDeviceBatteryStateFull
设备已接通电源，电池100％充电。
```

* 使用接近传感器

```
proximityMonitoringEnabled
一个布尔值，指示是否启用接近监视（是）或否（否）。
仅在需要通知应用程序接近状态更改时才启用接近监视。 否则，禁用接近监控。 默认值为NO。

并非所有iOS设备都有接近传感器。 要确定是否有可用的邻近监控，请尝试启用它。 如果proximityMonitoringEnabled属性的值保持为NO，则不提供邻近度监视


proximityState
指示接近传感器是否接近用户的布尔值（是）否（否）。
```

* 播放输入点击

```
 -  playInputClick
在启用的输入视图中播放输入单击。.
使用此方法播放标准系统键盘单击以响应用户在自定义输入或键盘附件视图中点击。 仅当用户在“设置”>“声音”中启用了键盘单击时，并且仅当输入视图本身已启用且可见时，才会播放单击。

要为输入点击启用自定义输入或附件视图，请执行以下两个步骤：

在输入视图类中采用UIInputViewAudioFeedback协议。

实现enableInputClicksWhenVisible委托方法以返回YES。

有关更多信息，请参阅iOS文本编程指南。
```

* 获得当前的成语

```
UIUserInterfaceIdiom
设备的接口类型或具有特征环境的对象，例如视图和视图控制器。
UI_USER_INTERFACE_IDIOM
返回当前设备支持的接口惯用法（推荐用于在早于3.2的iOS版本中运行的应用程序）。

```

* 通知

```
所有UIDevice通知都由currentDevice返回的单例设备实例发布。

UIDeviceBatteryLevelDidChangeNotification
电池电量变化时发布。
UIDeviceBatteryStateDidChangeNotification
电池状态发生变化时发布。
UIDeviceOrientationDidChangeNotification
设备方向更改时发布。
UIDeviceProximityStateDidChangeNotification
当接近传感器的状态发生变化时发布。
```



























