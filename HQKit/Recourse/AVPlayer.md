## AVPlayer

>AVPlayer旨在一次播放单个媒体资产。 可以使用其replaceCurrentItemWithPlayerItem：方法重用播放器实例以播放其他媒体资产，但它一次只管理单个媒体资产的播放。 该框架还提供了AVPlayer的子类，称为AVQueuePlayer，您可以使用它来创建和管理要按顺序播放的媒体资产队列

>AVPlayer是用于管理媒体资产的回放和定时的控制器对象。 您可以使用AVPlayer播放本地和远程基于文件的媒体，例如QuickTime电影和MP3音频文件，以及使用HTTP Live Streaming提供的视听媒体。

>您使用AVPlayer播放媒体资产，AVFoundation使用AVAsset类进行建模。 AVAsset仅模拟媒体的静态方面，例如其持续时间或创建日期，并且它本身不适合使用AVPlayer进行播放。 要播放资源，您需要创建AVPlayerItem中找到的动态对应实例。 此对象模拟由AVPlayer实例播放的资产的计时和呈现状态。 有关更多详细信息，请参阅AVPlayerItem参考

>AVPlayer是一个动态对象，其状态不断变化。 您可以使用两种方法来观察播放的状态

* 一般状态观察：
 
 >您可以使用键值观察（KVO）来观察许多播放动态属性的状态变化，例如其currentItem或其回放速率。 您应该在主线程上注册和取消注册KVO更改通知。 这避免了在另一个线程上进行更改时接收部分通知的可能性。 AVFoundation在主线程上调用observeValueForKeyPath：ofObject：change：context：即使在另一个线程上进行了更改操作

* 定时状态观察：

>KVO适用于一般状态观测，但不用于观察不断变化的状态，如播放的时间。 AVPlayer提供了两种观察时间变化的方法：
addPeriodicTimeObserverForInterval：队列：usingBlock：
addBoundaryTimeObserverForTimes：队列：usingBlock：
这些方法允许您分别定期或通过边界观察时间变化。 当发生更改时，会调用您为这些方法提供的回调块或闭包，让您有机会采取某些操作，例如更新播放器用户界面的状态

***

>AVPlayer和AVPlayerItem是非可视对象，这意味着它们自己无法在屏幕上显示资产的视频。 您可以使用两种主要方法在屏幕上显示视频内容

* AVKit：
>展示视频内容的最佳方式是使用iOS和tvOS中的AVKit框架的AVPlayerViewController类或macOS中的AVPlayerView类。 这些课程提供视频内容，以及播放控件和其他媒体功能，为您提供全功能的播放体验。

* AVPlayerLayer：
>如果要为播放器构建自定义界面，则使用AVFoundation提供的名为AVPlayerLayer的Core Animation CALayer子类。 播放器图层可以设置为视图的背衬层，也可以直接添加到图层层次结构中。 与AVPlayerView和AVPlayerViewController不同，播放器层不提供任何播放控件，而只是在屏幕上显示可视内容。 由您来构建播放传输控件以播放，暂停和搜索媒体

 除了AVKit或AVPlayerLayer提供的视觉内容外，您还可以使用AVSynchronizedLayer呈现与播放器时序同步的动画内容。 这是一个特殊的Core Animation CALayer子类，用于将当前播放器时序赋予其图层子树。 您可以使用AVSynchronizedLayer在Core Animation中构建自定义效果，例如动画下三分之一或视频过渡，并让它们与播放器当前AVPlayerItem的时序同步播放。
####外部播放模式

>外部播放模式是指通过AirPlay将视频数据发送到Apple TV等外部设备，以及基于迷你连接器的HDMI / VGA适配器，以原始保真度进行全屏播放。 AirPlay视频播放也被视为“外部播放”模式。
在“外部屏幕”模式（也称为镜像和第二显示）中，视频数据在主机设备（例如iPhone）上呈现，呈现的视频被重新压缩并传送到外部设备，并且外部设备解压缩并显示视频。
外部播放属性会影响AirPlay视频播放，并取代已弃用的AirPlay支持属性

NOTE:

外部播放属性不适用于基于30针连接器的视频输出电缆和适配器

###创建一个播放器
```
- initWithURL：
初始化新播放器以播放由给定URL引用的单个视听资源。
此方法隐式创建AVPlayerItem对象。 您可以使用currentItem获取播放器项目。

+ playerWithURL：
返回一个新播放器，播放给定URL引用的单个视听资源。

- initWithPlayerItem：
初始化新播放以播放指定的播放项目。

+ playerWithPlayerItem：
返回初始化为播放指定播放器项目的新播放器。
```
###管理播放
```
- play
开始播放当前项目。
调用此方法与将速率设置为1.0

- pause
暂停当前项目的播放。
调用此方法与将速率设置为0.0

rate
目前的播放速度。
值0.0暂停视频，而值1.0以其自然速率播放当前项目。 如果关联的播放项目为AVPlayerItem属性canPlaySlowForward或canPlayFastForward返回YES，则可以使用0.0和1.0以外的速率。 如果播放器项为canPlayReverse，canPlaySlowReverse和canPlayFastReverse属性返回YES，则支持负速率值范围

actionAtItemEnd
当前播放项目完成播放时要执行的操作。
{
AVPlayerActionAtItemEnd

AVPlayerActionAtItemEndAdvance
表示播放应该前进到下一个项目（如果有的话）。
AVPlayerActionAtItemEndPause
表示播放器应暂停播放。
AVPlayerActionAtItemEndNone
表示播放不做任何事情
}

- replaceCurrentItemWithPlayerItem：
用新播放项目替换当前玩播放项目。
```
###管理自动等待行为
```
automaticallyWaitsToMinimizeStalling
一个布尔值，指示播放器是否应自动延迟播放以最小化停顿。
{
	播放通过HTTP传送的媒体时，此属性用于确定播放器是否应自动延迟播放以最小化停顿。当此属性为YES并且播放器从暂停状态（速率0.0）变为播放状态（速率> 0.0）时，播放器将尝试确定当前项目是否可以以当前指定的速率播放到其结尾。如果确定它可能遇到失速，则播放器的timeControlStatus的值将更改为AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate，并且当停止的可能性已最小化时，将自动开始播放。如果当前播放器项目的播放缓冲区用尽并且播放停止，则在播放期间将发生类似的情况。当停止可能性最小化时，将自动恢复播放。

当您需要精确控制播放开始时间时，您需要将此属性设置为NO，例如，如果您正在使用setRate：time：atHostTime：method同步多个播放器实例。如果此属性的值为NO，则只要播放缓冲区不为空，就会在请求时立即开始播放。如果播放缓冲区变空并且播放停止，则播放器的timeControlStatus将切换到AVPlayerTimeControlStatusPaused，播放速率将更改为0.0。

当播放的timeControlStatus为AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate且其reasonForWaitingToPlay为AVPlayerWaitingToMinimizeStallsReason时，将此属性的值更改为NO将导致播放器立即以指定的速率尝试播放
}


reasonForWaitingToPlay
播放器当前正在等待播放开始或恢复的原因。

{
当播放器的timeControlStatus的值为AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate时，您可以使用此属性确定播放器当前正在等待播放开始或恢复的原因。 此属性的可能值为：

AVPlayerWaitingWhileEvaluatingBufferingRateReason
表示播放器正在监视播放缓冲区填充率，以确定播放是否可能在没有中断的情况下完成。 建议您不要向用户显示指示等待状态的UI，而这是reasonForWaitingToPlay的值。
AVPlayerWaitingWithNoItemToPlayReason
表示播放器正在等待，因为其currentItem为零。
AVPlayerWaitingToMinimizeStallsReason
表示播放器在开始播放之前正在等待适当的播放缓冲条件。 播放可以继续播放，而不会以播放器指定的速率停止播放。 如果播放器项目的播放缓冲区已满并且无法进一步缓冲媒体数据，则播放也将继续

如果播放的timeControlStatus是AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate以外的值，则此属性的值将为nil。
}

timeControlStatus
一种状态，指示当前正在播放，无限期暂停或在等待适当的网络条件时暂停。
当automaticWaitsToMinimizeStalling为YES时，此属性的值在播放期间在AVPlayerTimeControlStatusPlaying和AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate之间转换，具体取决于是否有足够的媒体数据可用于继续播放。

使用KVO可以观察到此属性
{
AVPlayerTimeControlStatus
	AVPlayerTimeControlStatusPaused
当播放速率变为值0.0时，进入此状态。此更改可能是调用pause方法或显式更改播放速率的结果，但也可能由于外部事件（如iOS中断）而发生。在此状态下，播放将无限期暂停，并且在播放速率变为大于0.0的值并且已缓冲足够的媒体数据以进行播放之前不会再次开始播放。
AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate
当回放缓冲器变空并且在正常回放期间停止或者如果进行了播放请求并且缓冲了不足的媒体数据时，进入该状态。如果播放没有当前播放项目（currentItem为零），也将进入此状态。在此状态下，rate属性不指示当前播放速率，而是指示播放将在何时开始或恢复的速率。您可以参考reasonForWaitingToPlay属性来确定播放当前正在等待的原因。
AVPlayerTimeControlStatusPlaying
此状态表示正在进行正常播放。在此状态下，对播放费率所做的任何更改都将立即生效。如果由于媒体数据不足而播放停止，播放器的timeControlStatus将更改为AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate。
}


- playImmediatelyAtRate：
以指定的速率立即播放可用的媒体数据。
{
无论是否有足够的媒体缓冲以确保流畅播放，此方法都以指定的速率播放可用的媒体数据。 如果播放缓冲区中存在媒体数据，则调用此方法会将播放器的播放速率更改为指定的速率，将其timeControlStatus更改为AVPlayerTimeControlStatusPlaying的值。 如果播放器缓冲的媒体数据不足以开始播放，则播放器的行为就像在播放期间遇到停顿一样，但不会发布AVPlayerItemPlaybackStalledNotification
}

AVPlayerWaitingReason
以下是播放器的reasonForWaitingToPlay属性的有效常量值
```

###管理时间
```
- seekToTime:
返回当前播放器项的当前时间。
{
此属性不是键值可观察的。 要观察播放的时间，请使用addPeriodicTimeObserverForInterval：queue：usingBlock：或addBoundaryTimeObserverForTimes：queue：usingBlock：
}

- seekToTime：
将当前播放时间设置为指定时间。
{
寻求播放的时间可能与指定的效率时间不同。 对于样品的准确求求，请参见seekToTime：toleranceBefore：toleranceAfter：。
}

- seekToDate：
将当前播放时间设置为日期对象指定的时间。
{
寻求播放的时间可能与指定的效率日期不同。 对于样本的准确求求，请参阅seekToTime：toleranceBefore：toleranceAfter：
}

- seekToTime：completionHandler：
将当前播放时间设置为指定时间，并在搜索操作完成或中断时执行指定的块。
{
使用此方法可以在指定时间内查找当前播放项目，并在操作完成时收到通知。 如果搜索请求在没有被中断的情况下完成（由另一个搜索请求或任何其他操作），则执行的完成处理程序将在完成的参数设置为YES的情况下执行。

如果在调用此方法时正在进行另一个搜索请求，则会立即执行正在进行的搜索请求的完成处理程序，并将完成的参数设置为NO
}
- seekToDate：completionHandler：
将当前播放时间设置为指定时间，并在搜索操作完成或中断时执行指定的块。
{
使用此方法可以在指定时间内查找当前播放项目，并在操作完成时收到通知。 如果搜索请求在没有被中断的情况下完成（由另一个搜索请求或任何其他操作），则执行的完成处理程序将在完成的参数设置为YES的情况下执行。

如果在调用此方法时正在进行另一个搜索请求，则会立即执行正在进行的搜索请求的完成处理程序，并将完成的参数设置为NO
}

- seekToTime：toleranceBefore：toleranceAfter：
设置指定时间范围内的当前播放时间。
{
寻求的时间将在[时间 - 容差，时间+容量之后]的范围内，并且可能与指定的效率时间不同。 您可以通过为toleranceBefore和toleranceAfter传递kCMTimeZero的时间值来请求样本准确搜索。 样本精确搜索可能引起额外的解码延迟，这可能影响搜索性能。

为toleranceBefore和toleranceAfter传递kCMTimePositiveInfinity与直接传递seekToTime：相同。
}

- seekToTime：toleranceBefore：toleranceAfter：completionHandler：
设置指定时间范围内的当前播放时间，并在搜索操作完成或中断时调用指定的块
{
使用此方法可以搜索当前播放项目的指定时间，并在搜索操作完成时收到通知。

寻求的时间将在[时间 - 容差，时间+容量之后]的范围内，并且可能与指定的效率时间不同。 您可以通过为toleranceBefore和toleranceAfter传递kCMTimeZero的时间值来请求样本准确搜索。 样本精确搜索可能引起额外的解码延迟，这可能影响搜索性能。

调用此方法时，toleranceBefore设置为kCMTimePositiveInfinity，toleranceAfter设置为kCMTimePositiveInfinity与调用seekToTime：相同。

当完成的参数设置为NO时，将立即调用仍在进行中的任何先前搜索请求的完成处理程序。 如果新请求完成而没有被另一个搜索请求或任何其他操作中断，则将调用指定的完成处理程序，并将完成的参数设置为YES
}

```

###观察时间
```
- addPeriodicTimeObserverForInterval：queue：usingBlock：
请求在回放期间定期调用给定块以报告更改时间。
{
只要您希望播放器调用时间观察器，您必须保持对返回值的强引用。 每次调用此方法都应该与removeTimeObserver：的相应调用配对。 在不调用removeTimeObserver：的情况下释放observer对象将导致未定义的行为。

以指定的间隔周期性地调用该块，根据当前项的时间线进行解释。 每当跳转时以及每当播放开始或停止时，也会调用该块。 如果间隔实时对应于非常短的间隔，则玩家可以比请求的频率更少地调用该块。 即便如此，玩家也会经常足够地调用该块，以便客户端在其最终用户界面中适当地更新当前时间的指示。
}

- addBoundaryTimeObserverForTimes：queue：usingBlock：
在正常播放期间遍历指定时间时请求调用块。
{
边界时间是您在媒体时间轴中定义的任意兴趣点。由于在正常播放期间遍历这些时间，因此将调用您为此方法提供的块。只要您希望播放器调用时间观察器，您就必须保持对返回值的强引用。每次调用此方法都应该与removeTimeObserver：的相应调用配对。

播放器不保证始终为每个边界时间调用回调块。如果你的时间沿着时间轴非常接近（足够接近一个块的执行时间比它们之间的差异要长）或者如果一个搜索导致时间跳过一个或多个边界时间，则对任何特定边界进行时间观察时间可能不会发生。因此，最佳实践是实现回调块，以便它始终仅根据玩家的currentTime执行必要的计算
}
- removeTimeObserver：
取消先前注册的定期或边界时间观察者。
{
返回时，调用者保证不会有新的时间观察器块开始执行。 根据调用线程和用于添加时间观察器的队列，在此方法返回后，正在进行的块可能会继续执行。 您可以通过将对该队列的removeTimeObserver的调用排入队列来保证同步时间观察器的删除。 或者，在removeTimeObserver之后调用dispatch_sync（queue，^ {}）以等待任何正在进行的块完成执行。

您应该使用此方法在每次使用addPeriodicTimeObserverForInterval：queue：usingBlock：和addBoundaryTimeObserverForTimes：queue：usingBlock：添加观察者时显式取消
}

```
###配置媒体选择标准设置
```
appliesMediaSelectionCriteriaAutomatically
一个布尔值，指示接收器是否应自动将当前选择标准应用于播放器项目。
{
默认情况下，AVPlayer实例根据系统可访问性首选项应用选择条件。 要覆盖任何媒体选择组的默认条件，请使用setMediaSelectionCriteria：forMediaCharacteristic：
}

- mediaSelectionCriteriaForMediaCharacteristic：
返回具有指定媒体特征的媒体的自动选择条件。
- setMediaSelectionCriteria：forMediaCharacteristic：
对具有指定介质特征的介质应用自动选择标准
{
在以下情况下，条件将应用于AVPlayerItem实例：

It is made ready to play。

AVPlayerItem实例使用方法selectMediaOption：inMediaSelectionGroup：在不同的组中进行特定的媒体选择。 一组中的自动选择可能受另一组中的特定选择的影响。

基础系统偏好改变，例如 系统语言，辅助功能标题。

AVPlayerItem实例使用selectMediaOption：inMediaSelectionGroup：方法在任何组内进行的特定选择将覆盖该组中的自动选择，直到播放器项收到selectMediaOptionAutomaticallyInMediaSelectionGroup：message。
}
```

###管理外部播放
```
allowsExternalPlayback
一个布尔值，指示播放器是否允许切换到外部播放模式。default YES

externalPlaybackActive
一个布尔值，指示播放器当前是否正在外部播放模式下播放视频。

usesExternalPlaybackWhileExternalScreenIsActive
一个布尔值，指示播放器是否应在外部屏幕模式处于活动状态时自动切换到外部播放模式以播放视频内容。
{
一旦视频播放结束，播放器将自动切换回外部屏幕模式。 当在两种模式之间自动切换时，可以在外部显示器上看到短暂的转换。 此属性的默认值为NO。 如果allowExternalPlayback为NO，则此属性的值无效
}

externalPlaybackVideoGravity
仅适用于外部播放模式的播放器的视频重力
{
此属性的值可以是AVLayerVideoGravityResize，AVLayerVideoGravityResizeAspectFill或AVLayerVideoGravityResizeAspect。
}
```
###将播放同步到外部源
```
本节中的高级同步和速率控制方法目前仅支持基于文件的媒体，并且不支持使用HTTP Live Streaming提供的媒体。

- setRate：time：atHostTime：
将当前项目的播放速率和时间与外部源同步。
- prerollAtRate：completionHandler：
开始加载媒体数据以准备媒体管道以进行播放。
- cancelPendingPrerolls
取消任何挂起的预请求，并调用相应的完成处理程序（如果存在）。
masterClock
用于项目时基的主时钟
```

###管理音频输出
```
muted
一个布尔值，指示播放器的音频输出是否静音。

volume
播放器的音频播放音量，线性范围为0.0到1.0。
{
值0.0表示沉默; 值1.0（默认值）表示播放器实例的完整音量。

此属性用于控制相对于系统音量的播放器音量。 在iOS中没有以编程方式控制系统卷，但您可以使用MediaPlayer框架的MPVolumeView类来提供用于控制系统卷的标准用户界面
}

audioOutputDeviceUniqueID
指定用于播放音频的Core Audio输出设备的唯一ID
{
此属性的默认值为nil，表示使用默认音频输出设备。 否则，此属性的值是一个字符串，其中包含要用于音频输出的Core Audio输出设备的唯一ID。

Core Audio的kAudioDevicePropertyDeviceUID是音频输出设备唯一ID的合适来源
}
```
###获得播放器属性
```
status
指示播放器是否可用于播放的状态。
播放器的状态指示播放器是否可用于播放。 当此属性的值为AVPlayerStatusFailed时，您无法再使用播放器进行播放，并且需要创建一个新实例来替换它。 如果发生这种情况，您可以检查播放器的错误属性的值以确定失败的性质。

此属性是使用键值观察可观察的键值
播放器的状态并不表示其准备播放特定的播放项目。 您应该使用AVPlayerItem的status属性来进行确定
{
AVPlayerStatusUnknown
表示尚未知道播放器的状态，因为它尚未尝试加载新的媒体资源进行播放。
AVPlayerStatusReadyToPlay
表示播放器已准备好播放AVPlayerItem实例。
AVPlayerStatusFailed
表示由于错误，播放器无法再播放AVPlayerItem实例
}

error
如果接收者的状态是AVPlayerStatusFailed，则描述导致失败的错误。
此属性的值是一个错误对象，它描述了导致接收器无法再播放项目的原因。 如果接收者的状态不是AVPlayerStatusFailed，则此属性的值为nil


currentItem
玩家当前的播放项目。

outputObscuredDueToInsufficientExternalProtection
一个布尔值，指示由于外部保护不足而导致输出是否被遮挡
如果当前设备配置不符合保护项目的要求，则包含复制保护或其他形式的安全性的项目可能会使其可视内容被播放器对象遮挡。 此属性报告播放器当前是否遮挡了该项目。 如果当前项目不需要外部保护，或者设备配置足以保护项目，则此属性的值设置为NO。

您可以使用此属性来确定是否更改应用程序的用户界面以反映可见性的更改。 您可以使用键值观察来观察对此属性值的更改
```
###管理AirPlay
```
airPlayVideoActive
指示播放器当前是否通过AirPlay播放视频。
弃用
allowsAirPlayVideo
指示播放器是否允许AirPlay视频播放。
弃用
usesAirPlayVideoWhileAirPlayScreenIsActive
指示播放器是否应在AirPlay屏幕处于活动状态时自动切换到AirPlay Video以播放视频内容，并在播放完成后立即切换回AirPlay屏幕。
```
###常量
```
AVPlayerStatus
status属性的可能值，用于指示是否可以成功播放项目。
AVPlayerActionAtItemEnd
您可以将这些常量与actionAtItemEnd一起使用，以指示播放器在完成游戏时应采取的操作。
AVPlayerTimeControlStatus
这些常量是播放器的timeControlStatus属性的允许值。
```
###管理隐藏式字幕显示
```
closedCaptionDisplayEnabled
一个布尔值，指示播放器是否使用隐藏式字幕。
```
###实例属性
```
preferredVideoDecoderGPURegistryID
preventsDisplaySleepDuringVideoPlayback
```
###输入属性
```
```




















