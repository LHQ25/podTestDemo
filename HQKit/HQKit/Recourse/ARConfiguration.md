##ARConfiguration

AR会话配置的抽象基类

* 概观

  ARConfiguration是一个抽象类;您不创建或使用此类的实例。

  要运行AR会话，请创建具体ARConfiguration子类的实例，该子类提供您希望在应用或游戏中使用的增强现实体验。然后，设置配置对象的属性并将配置传递给会话的runWithConfiguration：options：方法。 ARKit包括以下具体配置类：

  ARWorldTrackingConfiguration
提供高质量的AR体验，使用后置摄像头精确跟踪设备的位置和方向，并允许平面检测，命中测试，基于环境的照明以及图像和目标检测。

  AROrientationTrackingConfiguration
提供使用后置摄像头的基本AR体验，并仅跟踪设备的方向。

  ARImageTrackingConfiguration
提供基本的AR体验，使用后置摄像头并跟踪可见图像，无论用户的环境如何。

  ARFaceTrackingConfiguration
提供使用前置摄像头的AR体验，并跟踪用户脸部的移动和表情。

  ARObjectScanningConfiguration
提供使用后置摄像头收集高保真空间数据，创建参考对象以便在其他AR体验中进行检测。

####开始

1. 验证设备支持

```
isSupported
一个布尔值，指示当前设备是否支持此会话配置类。

不同类型的AR体验（使用具体的ARConfiguration子类配置）可以具有不同的硬件要求。

在尝试创建AR配置之前，请通过检查相应配置类的isSupported属性来验证用户的设备是否支持您计划使用的配置。 如果此属性的值为NO，则当前设备不支持所请求的配置。

所有ARKit配置都需要具有A9或更高版本处理器的iOS设备。 如果您的应用程序支持其他设备并提供增强现实作为辅助功能，请使用此属性确定是否向用户提供基于AR的功能。

如果您的应用需要ARKit作为其核心功能，请使用应用的Info.plist的UIRequiredDeviceCapabilities部分中的arkit键，使您的应用仅在支持ARKit的设备上可用。
```
2. 配置AR会话

```
lightEstimationEnabled
一个布尔值，指定ARKit是否分析捕获的摄像机图像中的场景照明。
当此值为YES（默认值）时，正在运行的AR会话在其捕获的每个ARFrame对象的lightEstimate属性中提供场景照明信息。

如果为AR场景渲染自己的叠加图形，则可以在着色算法中使用此信息，以帮助使这些图形与摄像机捕获的场景的真实照明条件相匹配。 （ARSCNView类自动使用此信息配置SceneKit照明。）

worldAlignment
一个值，指定会话如何将实际设备运动映射到3D场景坐标系。
创建AR体验取决于能够构建用于将对象放置在虚拟3D世界中的坐标系，该虚拟3D世界映射到设备的真实位置和运动。 运行会话配置时，ARKit会根据设备的位置和方向创建场景坐标系; 您创建的任何ARAnchor对象或AR会话检测到的ARAnchor对象相对于该坐标系定位。

有关可能的值，请参阅ARWorldAlignment。

ARWorldAlignmentGravity
坐标系的y轴与重力平行，其原点是设备的初始位置。
ARWorldAlignmentGravityAndHeading
坐标系的y轴与重力平行，其x轴和z轴朝向罗盘航向，其原点是设备的初始位置。
ARWorldAlignmentCamera
场景坐标系被锁定以匹配摄像机的方向。

ARWorldAlignment
ARKit如何基于真实世界的设备运动构建场景坐标系的选项。
```

3. 管理视频捕获选项

```
videoFormat
用于运行此配置的会话的视频捕获大小和帧速率。
ARVideoFormat类是不可变的; 要设置AR会话的帧速率和视频分辨率，请选择supportedVideoFormats数组中的一种视频格式。

supportedVideoFormats
当前设备上可用的一组视频捕获格式。
默认情况下，新会话配置的videoFormat属性与此阵列中的第一个视频捕获格式匹配。 要更改会话的视频格式，请将该属性的值更改为此阵列中的其他ARVideoFormat对象之一。
ARConfiguration是一个抽象基类，因此它对该属性的实现总是返回一个空数组。 从计划用于AR会话的配置子类中读取此属性，例如ARWorldTrackingConfiguration或ARFaceTrackingConfiguration。

不同的设备和iOS版本提供不同的受支持视频格式集，但此阵列的顺序始终在低质量格式之前提供更高质量的格式。 为了在所有设备和版本中获得最佳结果，请根据数组中的顺序选择格式，而不是选择硬编码的最小分辨率或帧速率值。

ARVideoFormat
用于AR会话的视频大小和帧速率规范。
```

4. Recording Audio

```
providesAudioData
一个布尔值，指定是否在AR会话期间捕获音频。

要接收和处理捕获的音频数据，会话委托必须实现会话：didOutputAudioSampleBuffer：方法。
```

##ARVideoFormat

用于AR会话的视频大小和帧速率规范。

这个类是不可变的; 要为AR会话设置帧速率和视频分辨率，请将配置的videoFormat属性设置为supportedVideoFormats数组中的一种格式。

####开始

* 视频格式设置

```
每秒帧数
会话捕获视频并提供AR帧信息的速率。
imageResolution
会话中捕获的视频图像的大小（以像素为单位）。
```

##ARWorldTrackingConfiguration

使用后置摄像头的配置，跟踪设备的方向和位置，并检测真实世界的表面，以及已知的图像或对象。

所有AR配置都建立了设备所在的真实世界与虚拟3D坐标空间之间的对应关系，您可以在其中建模内容。 当您的应用程序将该内容与实时摄像头图像一起显示时，用户会体验到您的虚拟内容是现实世界的一部分。

在空间之间创建和维护这种对应关系需要跟踪设备的运动。 ARWorldTrackingConfiguration类以六个自由度（6DOF）跟踪设备的运动：具体地说，三个旋转轴（滚动，俯仰和偏转）和三个平移轴（在x，y和z中移动）。

这种跟踪可以创建沉浸式AR体验：虚拟对象可以看起来与现实世界保持在相同的位置，即使用户倾斜设备以查看对象的上方或下方，或者移动设备以查看 对象的两侧和背面。

世界跟踪会话还为您的应用提供了多种方式来识别或与相机可见的真实场景元素进行交互：

使用planeDetection查找真实的水平或垂直曲面，将它们作为ARPlaneAnchor对象添加到会话中。

使用detectionImages识别和跟踪已知2D图像的移动，将它们作为ARImageAnchor对象添加到场景中。

使用detectObjects识别已知的3D对象，将它们作为ARObjectAnchor对象添加到场景中。

在ARFrame，ARSCNView或ARSKView上使用命中测试方法，以查找相应视图中对应于2D点的真实世界特征的3D位置。

####开始

* 创建配置

```
- init 
初始化新的世界跟踪配置。
要在AR会话中使用配置，请将其传递给ARSession runWithConfiguration：options：方法。

+ new
创建新的世界跟踪配置。
要在AR会话中使用配置，请将其传递给ARSession runWithConfiguration：options：方法。

initialWorldMap
从先前AR会话尝试使用此会话配置恢复的状态。
ARWorldMap封装了正在运行的ARSession的状态。 此状态包括ARKit对用户移动设备的物理空间的意识（ARKit用于确定设备的位置和方向），以及添加到会话的任何ARAnchor对象（可以表示检测到的真实世界功能或虚拟内容） 由你的应用程序放置）。 使用getCurrentWorldMapWithCompletionHandler：保存会话的世界地图后，您可以将其分配给配置的initialWorldMap属性并使用runWithConfiguration：options：启动具有相同空间感知和锚点的另一个会话。

通过保存世界地图并使用它们来启动新会话，您的应用可以添加新的AR功能：
  多用户AR体验。 通过将存档的ARWorldMap对象发送到附近用户的设备来创建共享参考框架。 通过两个设备跟踪同一个世界地图，您可以构建网络体验，让用户可以查看相同的虚拟内容并与之交互。

  持久的AR体验。 当您的应用变为非活动状态时保存世界地图，然后在您的应用下次在同一物理环境中启动时将其恢复。 您可以使用恢复的世界地图中的锚点将相同的虚拟内容放置在保存的会话中的相同位置。
  
  当您使用初始世界地图运行会话时，会话将在ARCamera.TrackingState.limited（_ :)（ARCamera.TrackingState.Reason.relocalizing）跟踪状态中启动，而ARKit会尝试将记录的世界地图与当前环境进行协调。 如果成功，跟踪状态会在短时间后变为ARCamera.TrackingState.normal，表示当前世界坐标系和锚点与记录的世界地图中的坐标系统和锚点匹配。

如果ARKit无法将记录的世界地图与当前环境进行协调（例如，如果设备与记录世界地图的位置完全不同），则会话将无限期地保留在ARCamera.TrackingState.Reason.relocalizing状态中。
```

* 启用平面检测

```
planeDetection
一个值，指定会话是否以及如何尝试自动检测摄像头捕获图像中的平面。
默认情况下，平面检测已关闭。 如果启用ARPlaneDetectionHorizontal或ARPlaneDetectionVertical平面检测，会话将添加ARPlaneAnchor对象，并在其捕获的视频图像的分析检测到看似平坦的区域时通知您的ARSessionDelegate，ARSCNViewDelegate或ARSKViewDelegate对象。

ARPlaneDetection
选择ARKit是否以及如何检测捕获图像中的平面。
ARPlaneDetectionHorizontal
会话检测垂直于重力的平面。
ARPlaneDetectionVertical
会话检测与重力平行的表面（无论其他方向如何）。
ARPlaneDetectionNone
平面检测已禁用。
```

* 启用图像检测和跟踪

```
detectionImages
ARKit尝试在用户环境中检测的一组图像。
使用此属性选择已知的2D图像，以便ARKit在用户的环境中查找，并显示为ARImageAnchor，以便在您的AR体验中使用。 使用Xcode资产目录为ARKit提供参考图像以检测，或使用ARReferenceImage类以编程方式定义它们。

ARKit有两种方法可以在会话期间识别此集合中的图像：
  通过图像检测，ARKit在第一次检测到相机视图中的图像时进行报告，并在此后提供对图像锚点变换的不频繁更新。 当图像从视图中消失时，图像检测不会连续跟踪图像或轨迹的真实运动。 图像检测最适用于AR内容响应场景中的静态图像的情况 - 例如，识别博物馆中的艺术品或将动画元素添加到电影海报中。

  在iOS 12.0或更高版本中，设置maximumNumberOfTrackedImages以启用图像跟踪。 图像跟踪为相对于世界移动的检测图像提供连续更新，并且可以准确地跟踪图像何时从视图中消失（或者在之后重新出现）。 图像跟踪非常适合AR内容响应移动对象上的图像的情况 - 例如，将交互式角色添加到桌面卡或棋盘游戏中。
  
  性能注意事项
大量的检测图像可以降低图像检测的准确性和性能。 为获得最佳效果，请在此套装中使用不超过25张图像。

通过更改哪一组图像处于活动状态以进行检测，您可以支持更大的检测图像总数。 例如，识别美术馆中的绘画的应用可以基于用户当前所在的博物馆区域（在使用核心位置在博物馆内定位用户之后）来限制检测图像的集合。

要在不影响会话的情况下检测不同的图像集，请调用会话的runWithConfiguration：options：方法，其配置包含不同的detectImages集且没有选项。

maximumNumberOfTrackedImages
同时跟踪运动的最大检测图像数。
将图像添加到detectionImages集使图像检测能够在ARKit首次在摄像机视图中找到图像时报告图像的位置和方向，并且此后仅提供不频繁的更新。

将此属性设置为大于零的值（默认值）可启用图像跟踪，即使附着的真实对象在世界范围内移动，也会连续跟踪检测到的图像。 如果超过最大值，则只有已经跟踪的图像将继续跟踪，直到跟踪丢失或其他图像被删除。

启用图像跟踪的世界跟踪会话可以同时跟踪少量图像。 您可以使用ARImageTrackingConfiguration跟踪更多图像。

```

* 启用3D对象检测

```
detectionObjects
一组3D对象，供ARKit尝试在用户环境中进行检测。

使用此属性选择已知的3D对象，以便ARKit在用户的环境中查找，并显示为ARObjectAnchor，以便在您的AR体验中使用。

要创建用于检测的参考对象，请在世界跟踪会话中扫描它们，并使用ARWorldMap提取ARReferenceObject实例。 然后，您可以将参考对象保存为文件，并将它们打包到您使用Xcode资产目录创建的任何ARKit应用程序中。
```

* 使用基于环境的照明

```
environmentTexturing
ARKit用于生成环境纹理的行为。
环境纹理是立方体贴图纹理，用于描绘场景中特定点的所有方向上的视图。在3D资产渲染中，环境纹理是基于图像的照明算法的基础，其中表面可以逼真地反射来自其周围环境的光。 ARKit可以使用摄像机图像在AR会话期间生成环境纹理，允许SceneKit或自定义渲染引擎为AR体验中的虚拟对象提供逼真的基于图像的照明。

要为配置启用纹理贴图生成，请更改此属性（从其默认值AREnvironmentTexturingNone）：

使用AREnvironmentTexturingManual环境纹理，您可以通过创建AREnvironmentProbeAnchor对象并将它们添加到会话来识别场景中您想要光探测纹理贴图的点。

通过AREnvironmentTexturingAutomatic环境纹理，ARKit可自动创建，定位AREnvironmentProbeAnchor对象并将其添加到会话中。

在这两种情况下，当会话收集摄像机图像时，ARKit会自动生成环境纹理。使用委托方法（例如session：didUpdateAnchors）来查找纹理何时可用，并从锚点的environmentTexture属性中访问它。

如果使用ARSCNView和automaticUpdatesLighting选项显示AR内容，SceneKit会自动检索AREnvironmentProbeAnchor纹理贴图并使用它们点亮场景。


AREnvironmentTexturing
用于在世界跟踪AR会话中生成环境纹理的选项。
AREnvironmentTexturingNone
ARKit不生成环境贴图纹理。
AREnvironmentTexturingManual
ARKit仅为您明确添加到会话的探测锚点生成环境纹理。
AREnvironmentTexturingAutomatic
ARKit自动确定生成环境纹理的时间和位置。


AREnvironmentProbeAnchor
在世界跟踪AR会话中为特定空间区域提供环境照明信息的对象。
```

* 管理设备摄像头行为

```
autoFocusEnabled
一个布尔值，用于确定设备相机是使用固定焦点还是自动对焦行为。

在针对iOS 11.3 SDK或更高版本链接的应用中，ARKit默认启用自动对焦。
```

##AREnvironmentProbeAnchor

在世界跟踪AR会话中为特定空间区域提供环境照明信息的对象。

环境纹理从场景中的特定点描绘所有方向的视图。在3D资产渲染中，环境纹理是基于图像的照明算法的基础，其中表面可以逼真地反射来自其周围环境的光。 ARKit可以使用摄像机图像在AR会话期间生成环境纹理，允许SceneKit或自定义渲染引擎为AR体验中的虚拟对象提供逼真的基于图像的照明。

要为AR会话启用纹理贴图生成，请设置environmentTexturing属性：

使用AREnvironmentTexturingManual环境纹理，您可以通过创建AREnvironmentProbeAnchor对象并将它们添加到会话来识别场景中您想要光探测纹理贴图的点。

通过AREnvironmentTexturingAutomatic环境纹理，ARKit可自动创建，定位AREnvironmentProbeAnchor对象并将其添加到会话中。

在这两种情况下，当会话收集摄像机图像时，ARKit会自动生成环境纹理。使用委托方法（例如session：didUpdateAnchors）来查找纹理何时可用，并从锚点的environmentTexture属性中访问它。

如果使用ARSCNView和automaticUpdatesLighting选项显示AR内容，SceneKit会自动检索AREnvironmentProbeAnchor纹理贴图并使用它们点亮场景

* 创建探针锚

```
- initWithTransform：extent：
创建一个新的环境探测锚点。
使用addAnchor：方法开始在AR会话中跟踪自定义锚点。 将环境探测锚添加到场景后，ARKit开始为其生成环境纹理。 要在锚具有新的environmentTexture时收到通知，请实现会话：didUpdateAnchors：，renderer：didUpdateNode：forAnchor：或view：didUpdateNode：forAnchor：delegate方法。


- initWithName：transform：extent：
创建具有描述性名称的新锚点对象。
使用addAnchor：方法开始在AR会话中跟踪自定义锚点。 将环境探测锚添加到场景后，ARKit开始为其生成环境纹理。 要在锚具有新的environmentTexture时收到通知，请实现会话：didUpdateAnchors：，renderer：didUpdateNode：forAnchor：或view：didUpdateNode：forAnchor：delegate方法。

```
* 访问纹理贴图

```
environmentTexture
一个立方体贴图纹理，表示探针锚点位置在所有方向上的视图。
```

* 检查探针锚

```
extend
锚点位置周围的区域，用于投影其纹理以进行视差校正。

渲染反射对象可能涉及将environmentTexture投影到以锚点位置为中心的代理几何体上，然后从投影纹理中进行采样。

环境探测锚可以具有无限范围，指示其纹理将用作全局照明环境或有限范围，指示纹理表示场景的特定区域中的局部照明条件。
```






















