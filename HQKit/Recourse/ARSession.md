##ARSession

一个共享对象，用于管理增强现实体验所需的设备摄像头和运动处理

* 概观

  ARSession对象协调ARKit代表您执行的主要过程，以创建增强现实体验。这些过程包括从设备的运动感应硬件读取数据，控制设备的内置摄像头，以及对捕获的摄像头图像执行图像分析。会话综合所有这些结果，以建立设备所在的真实世界空间与您对AR内容建模的虚拟空间之间的对应关系。

  使用ARKit构建的每个AR体验都需要一个ARSession对象。如果使用ARSCNView或ARSKView对象轻松构建AR体验的可视部分，则视图对象包含ARSession实例。如果为AR内容构建自己的渲染器，则需要自己实例化和维护ARSession对象。

  运行会话需要配置。抽象ARConfiguration类的子类确定ARKit如何跟踪设备相对于现实世界的位置和运动，从而影响您可以创建的AR体验类型。例如，使用ARWorldTrackingConfiguration进行体验，通过设备的后置摄像头增强用户对周围世界的视图。
  
###开始 

1. 配置和运行会话

```
- runWithConfiguration：options：
使用指定的配置和选项启动会话的AR处理。
- runWithConfiguration：
使用指定的配置启动会话的AR处理。
ARSessionRunOptions
更改其配置时影响如何转换AR会话的当前状态的选项。

ARSessionRunOptionResetTracking
会话不会从先前的配置继续设备位置/运动跟踪。
ARSessionRunOptionRemoveExistingAnchors
将删除与先前配置中的会话关联的任何锚点对象。

configuration
定义会话的运动和场景跟踪行为的对象。
- pause
暂停会话中的处理。
暂停时，会话不会跟踪设备运动或捕获场景图像，也不会与其委托对象协调或更新任何关联的ARSCNView或ARSKView对象。
```

2. 响应AR更新

```
delegate
您提供的对象，用于接收捕获的视频图像和跟踪信息，或响应会话状态的更改。

如果您使用ARSCNView或ARSKView类来显示您的AR体验，则不需要会话委托。 这些视图自动显示捕获的视频图像并协调SceneKit或SpriteKit内容以跟踪设备和摄像机运动。

如果使用Metal或其他渲染技术为AR体验创建自己的可视化，请设置会话委托。 您的委托对象定期接收会话捕获的ARFrame对象。 这些对象包含可供您显示的视频帧图像和可用于协调显示场景元素的AR场景信息

delegateQueue
调度队列，会话通过该队列调用您的委托方法。
如果此值为nil（缺省值），则会话将调用主队列上的委托方法。

ARSessionDelegate
您可以实现接收捕获的视频帧图像和跟踪AR会话状态的方法。
ARSessionObserver
您可以实现的方法来响应AR会话状态的变化。
```
  
3. 显示AR内容并与之交互

```
设置currentFrame
具有相关AR场景信息的视频帧图像，最近由会话捕获。

- addAnchor：
添加要由会话跟踪的指定锚点。
锚点跟踪的更改将在捕获下一帧时生效。

- removeAnchor：
从会话的跟踪中删除指定的锚点
```

4. 保存或共享会话状态

```
- getCurrentWorldMapWithCompletionHandler：
返回封装世界跟踪会话的空间映射状态和锚点集的对象。

ARWorldMap封装了正在运行的ARSession的状态。 此状态包括ARKit对用户移动设备的物理空间的意识（ARKit用于确定设备的位置和方向），以及添加到会话的任何ARAnchor对象（可以表示检测到的真实世界功能或虚拟内容） 由你的应用程序放置）。 使用此方法保存会话的世界地图后，可以将其分配给配置的initialWorldMap属性并使用runWithConfiguration：options：启动具有相同空间感知和锚点的另一个会话。

通过保存世界地图并使用它们来启动新会话，您的应用可以添加新的AR功能：
  多用户AR体验。 通过将存档的ARWorldMap对象发送到附近用户的设备来创建共享参考框架。 通过两个设备跟踪同一个世界地图，您可以构建网络体验，让用户可以查看相同的虚拟内容并与之交互。

  持久的AR体验。 当您的应用变为非活动状态时保存世界地图，然后在您的应用下次在同一物理环境中启动时将其恢复。 您可以使用恢复的世界地图中的锚点将相同的虚拟内容放置在保存的会话中的相同位置。

  世界地图生成需要世界跟踪AR会话。 如果在未使用ARWorldTrackingConfiguration运行的ARSession上调用此方法，它会立即调用您的完成处理程序，不提供世界地图和错误。
  
  ARKit在会话的delegateQueue上调用您的completionHandler（如果设置，则在主队列上调用）。 如果您需要从此处理程序执行昂贵的工作（例如归档和保存或发送世界地图），请在适当的调度队列上执行此操作以避免中断性能。
```

5. 扫描3D对象以进行检测

```
- createReferenceObjectWithTransform：center：extent：completionHandler：
从会话的世界空间的指定区域创建参考对象（用于3D对象检测）。
```

6. 更新世界原点

```
- setWorldOrigin：
使用指定的变换更改AR世界坐标空间的基础。

```
  ARKit定义了一个世界坐标空间，供您用于放置虚拟内容并在AR体验中定位检测到的对象。 默认情况下，此空间基于会话开始时设备的初始位置和方向。 但是，在会话开始并检测到有用的参考点（例如平面或图像）之后，您可能会发现根据这些参考点重新定义世界坐标系很有帮助。
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  