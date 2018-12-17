##AVPlayerItem

用于对播放器资产的时间和呈现状态进行建模的对象

###创建一个播放器播放对象
```
- initWithURL：
使用给定的URL准备播放器项目。
+ playerItemWithURL：
返回准备使用给定URL的新播放器项。
- initWithAsset：
初始化给定资产的新播放器项目。
+ playerItemWithAsset：
返回给定资产的新播放器项目。
- initWithAsset：automatedLoadedAssetKeys：
使用指定的资产初始化播放器项目，并自动加载资产键。
+ playerItemWithAsset：automatedLoadedAssetKeys：
创建具有指定资产的播放器项目，并自动加载资产键。
```

###检查状态
```
asset
初始化期间提供的基础资产。
automaticallyLoadedAssetKeys
在播放器项目之前自动加载的资产键数组达到AVPlayerItemStatusReadyToPlay状态。
track
一组AVPlayerItemTrack对象。
status
玩家项目的状态。
AVPlayerItemStatus
表示项目状态的常量
duration
项目媒体的持续时间。
timebase
项目的时基信息。
loadedTimeRanges
已加载项目的时间范围。
presentationSize
玩家呈现项目的视觉部分的大小。
timedMetadata
媒体流最近遇到的定时元数据。
error
如果播放器项的状态为AVPlayerItemStatusFailed，则说明导致失败的错误。
```
###移动播放头
```
- stepByCount：
将播放器项目的当前时间向前或向后移动指定的步数。
seekableTimeRanges
一系列可以寻找的时间范围。
- seekToTime：completionHandler：
将当前播放时间设置为指定时间，并在搜索操作完成或中断时执行指定的块。
- seekToDate：completionHandler：
将当前播放时间设置为指定时间，并在搜索操作完成或中断时执行指定的块。
- seekToTime：toleranceBefore：toleranceAfter：completionHandler：
设置指定时间范围内的当前播放时间，并在搜索操作完成或中断时调用指定的块。
- cancelPendingSeeks
取消任何挂起的搜索请求，并调用相应的完成处理程序（如果存在）。
- seekToDate：
将当前播放时间设置为日期对象指定的时间。
弃用
- seekToTime：
将当前播放时间设置为指定时间。
弃用
- seekToTime：toleranceBefore：toleranceAfter：
设置指定时间范围内的当前播放时间。
弃用
```
###获取有关播放的信息
```
playbackLikelyToKeepUp
一个布尔值，指示项目是否可能在没有停顿的情况下播放。
playbackBufferEmpty
一个布尔值，指示回放是否已消耗所有缓冲的媒体，并且播放将停止或结束。
playbackBufferFull
一个布尔值，指示内部介质缓冲区是否已满并且是否已暂停进一步的I / O.
canPlayReverse
一个布尔值，指示是否可以以-1.0的速率播放项目。
canPlayFastForward
一个布尔值，指示项目是否可以以大于1.0的速率播放。
canPlayFastReverse
一个布尔值，指示项目是否可以低于-1.0的速率播放。
canPlaySlowForward
一个布尔值，指示项目是否可以以0.0到1.0之间的速率播放。
canPlaySlowReverse
一个布尔值，指示项目是否可以-1.0和0.0之间的速率播放。
canStepBackward
一个布尔值，指示项目是否支持向后步进。
canStepForward
一个布尔值，指示项目是否支持前进。
```

###获取时间信息
```
- currentTime
返回项目的当前时间。
- currentDate
以NSDate对象的形式返回项目的当前时间。
forwardPlaybackEndTime
正向播放结束的时间。
reversePlaybackEndTime
反向播放结束的时间。
```

###配置网络行为
```
preferredPeakBitRate
此项目的网络带宽消耗所需的限制（以每秒位数为单位）。
preferredForwardBufferDuration
播放器应该在播放头之前缓冲来自网络的媒体以防止播放中断的持续时间。
canUseNetworkResourcesForLiveStreamingWhilePaused
一个布尔值，指示播放器项目是否可以使用网络资源在暂停时保持播放状态为最新。
preferredMaximumResolution
要下载的视频所需的最大分辨率。
```
###配置项目的设置
```
audioMix
播放期间要应用的音频混合参数。
videoComposition
播放期间要应用的视频合成设置。
customVideoCompositor
自定义视频合成器，如果有的话。
AVVideoCompositing
自定义视频合成器必须实现的方法。
seekingWaitsForVideoCompositionRendering
一个布尔值，指示在使用视频合成搜索时项目的时间是否跟随显示的视频帧。
audioTimePitchAlgorithm
用于管理缩放音频编辑的音频音调的处理算法。
videoApertureMode
{
AVVideoApertureModeCleanAperture
AVVideoApertureModeEncodedPixels
AVVideoApertureModeProductionAperture
}

AVVideoApertureMode
{
AVVideoApertureModeCleanAperture
AVVideoApertureModeEncodedPixels
AVVideoApertureModeProductionAperture
}
```
###访问日志
```
- accessLog
返回表示网络访问日志快照的对象。
- errorLog
返回表示错误日志快照的对象。
AVPlayerItemAccessLog
用于检索与播放器项关联的访问日志的对象。
AVPlayerItemAccessLogEvent
播放器项目访问日志中的单个条目。
AVPlayerItemErrorLog
与播放器项关联的错误日志。
AVPlayerItemErrorLogEvent
播放器项目的错误日志中的单个项目。
```
###管理授权
```
- requestContentAuthorizationAsynchronouslyWithTimeoutInterval：completionHandler：
执行适当的操作以允许用户授权内容进行回放。
contentAuthorizationRequestStatus
最近调用requestContentAuthorizationAsynchronouslyWithTimeoutInterval：completionHandler：的状态。
AVContentAuthorizationStatus
调用requestContentAuthorizationAsynchronouslyWithTimeoutInterval得到的可能状态值：completionHandler：。
authorizationRequiredForPlayback
一个布尔值，指示是否需要授权才能播放内容。
applicationAuthorizedForPlayback
一个布尔值，指示应用程序是否可用于播放内容。
contentAuthorizedForPlayback
一个布尔值，指示内容是否已被用户授权。
- cancelContentAuthorizationRequest
导致当前未完成的内容授权请求被取消。
```
###媒体选项
```
currentMediaSelection
每个接收者的媒体选择组的当前媒体选择。
- selectMediaOption：inMediaSelectionGroup：
选择给定媒体选择组中AVMediaSelectionOption实例描述的媒体选项，并取消选择该组中的所有其他选项。
- selectMediaOptionAutomaticallyInMediaSelectionGroup：
选择指定媒体选择组中与接收者的自动选择条件最匹配的媒体选项。
externalSubtitleOptionLanguages
一组BCP 47语言代码，用于补充要呈现给用户的字幕选项列表。
弃用
selectedExternalSubtitleOptionLanguage
指定用户界面中标记的外部字幕选项语言的BCP 47语言代码。
弃用
- selectedMediaOptionInMediaSelectionGroup：
指示当前从指定组中选择的媒体选择选项。
弃用
```
###访问文本样式规则
```
textStyleRules
一组文本样式规则，适用于WebVTT字幕和其他易读文本。
```
###管理项目的输出
```
outputs
与项目关联的输出。
- addOutput：
将指定的播放器项输出对象添加到接收器。
- removeOutput：
从接收器中删除指定的播放器项输出对象。
```
###管理项目的数据收集器
```
mediaDataCollectors
相关媒体数据收集器的集合。
- addMediaDataCollector：
将指定的媒体数据收集器添加到播放器项的mediaDataCollectors集合中。
- removeMediaDataCollector：
从播放器项的mediaDataCollectors集合中删除指定的媒体数据收集器。
```

###将用于播放的元数据与AVKit相关联
```
navigationMarkerGroups
时间标记组提供了导航播放器项目内容的方法。
interstitialTimeRanges
表示插页式内容的玩家项目演示的时间范围。
externalMetadata
播放器项目的附加元数据，用于补充或覆盖底层媒体资产中嵌入的元数据。
nextContentProposal
该项目建议遵循当前的内容。
```
###发送通知
```
AVPlayerItemFailedToPlayToEndTimeErrorKey
从AVPlayerItemTimeJumpedNotification通知的用户信息字典中检索错误对象（NSError）的关键。
AVPlayerItemDidPlayToEndTimeNotification
当项目播放到结束时间时发布。
AVPlayerItemFailedToPlayToEndTimeNotification
当项目未能播放到结束时间时发布。
AVPlayerItemTimeJumpedNotification
当项目的当前时间不连续变化时发布。
AVPlayerItemPlaybackStalledNotification
发布时某些媒体没有及时到达继续播放。
AVPlayerItemNewAccessLogEntryNotification
添加新的访问日志条目时发布。
AVPlayerItemNewErrorLogEntryNotification
添加新的错误日志条目时发布。
```
























