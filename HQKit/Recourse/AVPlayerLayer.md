##AVPlayerLayer

管理播放器视觉输出的对象
播放器图层的继承内容属性的值是不透明的，不应使用

###创建播放器层
```
+ playerLayerWithPlayer：
返回播放器图层以显示指定播放器的可视输出
```

###配置播放器
```
player
播放器层显示视觉输出的播放器。

readyForDisplay
一个布尔值，指示第一个视频帧是否已准备好显示相关播放器的当前项目。
{
使用此属性作为最佳显示或动画播放器层进入视图的时间的指示器。 当此属性为NO时，可以显示或使其可见，但是在该值变为YES之前，该层将不具有任何用户可见内容。

对于其资产不包含已启用的视频轨道的玩家的currentItem，此属性保持为NO。

此属性是使用键值观察可观察的键值
}

videoGravity
一个值，指定视频在播放器图层边界内的显示方式。
{
视频重力决定了视频内容在播放器图层范围内的缩放或拉伸方式。 播放器图层支持以下视频重力值：

AVLayerVideoGravityResize
指定应拉伸视频以填充图层的边界。
AVLayerVideoGravityResizeAspect
指定播放器应保留视频的宽高比并使视频适合图层的边界。
AVLayerVideoGravityResizeAspectFill
指定播放器应保留视频的宽高比并填充图层的边界。

默认值为AVLayerVideoGravityResizeAspect。

此属性是可动画的
}
AVLayerVideoGravity
一个值，用于定义视频在图层边界矩形内的显示方式。


videoRect
视频图像的当前大小和位置显示在接收器的边界内。
{
您可以使用此属性来确定图层边界内视频图像的显示矩形。 此rect的大小和位置取决于媒体的宽高比（例如16：9或4：3），图层的边界以及视频的强度。

此属性是使用键值观察可观察的键值。
}

pixelBufferAttributes
播放期间播放器层中显示的视觉输出的客户端要求。
{
此属性可用于自定义销售给播放器层的像素缓冲区的格式。 此属性不适用于一般用途，AVPlayerLayer的大多数用途不需要此属性
}
AVMakeRectWithAspectRatioInsideRect
返回一个缩放的CGRect，它维护由边界CGRect中的CGSize指定的宽高比
{
当尝试在另一个CALayer的边界内拟合AVPlayerItem对象的naturalSize属性时，这很有用。 您通常会将此函数的返回值用作AVPlayerLayer框架属性值。 
}
```


















