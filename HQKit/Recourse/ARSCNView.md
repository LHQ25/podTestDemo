##ARSCNView

用于显示增强使用3D SceneKit内容的摄像机视图的AR体验的视图

ARSCNView类提供了创建增强现实体验的最简单方法，该体验将虚拟3D内容与现实世界的设备相机视图相结合。当您运行视图提供的ARSession对象时：

视图会自动将设备摄像头的实时视频输入渲染为场景背景。

视图的SceneKit场景的世界坐标系直接响应由会话配置建立的AR世界坐标系。

视图会自动移动其SceneKit相机以匹配设备的实际移动。

因为ARKit自动将SceneKit空间与现实世界匹配，所以放置虚拟对象以使其看起来保持真实世界位置只需要适当地设置该对象的SceneKit位置。 （请参阅使用SceneKit提供3D虚拟内容。）

* 第一步

```
session
用于管理视图内容的运动跟踪和摄像机图像处理的AR会话。
视图创建自己的会话对象; 使用此属性可以访问和配置视图的会话

scene
要在视图中显示的SceneKit场景。
与父SCNView类不同，ARSCNView对象需要显示非零场景。
```

* 响应AR更新

```
delegate
您提供的对象，用于调整视图的AR场景信息与SceneKit内容的同步。
ARSCNViewDelegate
您可以实现的方法来调解SceneKit内容与AR会话的自动同步。
```

* 命中真实世界表面的测试

```
- hitTest：type：
在捕获的摄像机图像中搜索与SceneKit视图中的点对应的真实世界对象或AR锚点。

命中测试搜索通过AR会话处理摄像机图像检测到的真实世界对象或表面。 视图坐标系中的2D点可以指沿着3D线的任何点，该点从设备相机开始并沿由设备方向和相机投影确定的方向延伸。 此方法沿着该线搜索，以距离相机的距离的顺序返回与其相交的所有对象。

Tip

此方法搜索AR会话检测到的AR锚点和现实世界对象，而不是视图中显示的SceneKit内容。 要搜索SceneKit对象，请改用视图的hitTest：options：方法。
命中测试的行为取决于您指定的类型以及指定它们的顺序。有关详细信息，请参阅ARHitTestResult和各种ARHitTestResultType选项。
```

* 将内容映射到真实世界的位置

```
- anchorForNode：
返回与指定的SceneKit节点关联的AR锚点（如果有）。
ARAnchor对象跟踪节点，如果节点未与视图场景中的锚点关联，则为nil。

- nodeForAnchor：
返回与指定AR锚点关联的SceneKit节点（如果有）。
锚点跟踪AR场景中的位置的节点，如果锚点没有关联节点或者不在视图的AR会话中，则为nil。

- unprojectPoint：ontoPlaneWithTransform：
返回点从2D视图投影到ARKit检测到的3D世界空间中的平面上。
从指定的2D点投射的光线与指定平面相交的世界空间中的3D点。 如果光线不与平面相交，则此方法返回float3向量，其中所有元素都是NaN。
```

* 管理场景照明

```
automaticallyUpdatesLighting
一个布尔值，指定ARKit是否在视图的场景中创建和更新SceneKit灯光。

如果此值为YES（默认值），则视图会自动创建一个或多个SCNLight对象，将它们添加到场景中，并更新其属性以反映来自摄像机场景的估计光照信息。 如果要直接控制SceneKit场景中的所有光照，请将此值设置为NO。
```

* 调试AR显示

```
ARSCNDebugOptions
绘制叠加内容的选项有助于在SceneKit视图中调试AR跟踪。

ARSCNDebugOptionShowWorldOrigin
显示坐标轴可视化，指示AR世界坐标系的位置和方向。
ARSCNDebugOptionShowFeaturePoints
显示一个点云，显示ARKit用于跟踪设备位置的场景分析的中间结果。
```

##SCNView

用于显示3D SceneKit内容的视图

在macOS中，SCNView是NSView的子类。 在iOS和tvOS中，SCNView是UIView的子类。 作为操作系统视图层次结构的一部分，SCNView对象为应用程序用户界面中的SceneKit内容提供了一个位置。 您可以使用其initWithFrame：options：方法或将其添加到nib文件或故事板来创建SceneKit视图。 要为SceneKit视图提供内容，请将SCNScene对象分配给其scene属性。

有关使用SceneKit视图的其他重要方法和属性，请参阅SCNSceneRenderer协议。 （您还可以使用SCNRenderer类将SceneKit内容渲染到任意Metal命令队列或OpenGL上下文中，或使用SCNLayer类渲染到macOS上的Core Animation层.SCNSceneRenderer协议定义所有三个SceneKit渲染类共有的功能。）

* 初始化SceneKit视图

```
- initWithFrame：选项：
使用指定的框架矩形和选项初始化并返回新分配的SceneKit视图对象。
初始化视图对象，如果无法创建对象，则为nil。


SCNViewOption
指定初始化选项的字典键，在初始化SceneKit视图时使用。

SCNPreferLowPowerDeviceKey
是否为金属渲染选择低功耗设备的选项。
SCNPreferredDeviceKey
用于金属渲染的设备。
SCNPreferredRenderingAPIKey
用于渲染视图的渲染API（例如，Metal或OpenGL）。
```

* 指定场景

```
scene
要在视图中显示的场景。
```
* 配置视图

```
backgroundColor
视图的背景颜色。
SceneKit在渲染场景的内容后面显示此颜色。 如果场景内容填充视图或者场景使用background属性提供其自己的背景，则视图的背景颜色可能不可见。

此属性的值必须是可以使用RGBA组件表示的颜色。


preferredFramesPerSecond
视图用于渲染其场景的动画帧速率。
SceneKit根据显示视图的屏幕功能，选择尽可能接近首选帧速率的实际帧速率。 实际帧速率通常是屏幕的最大刷新率的一个因素，以提供一致的帧速率。 例如，如果屏幕的最大刷新率是每秒60帧，那么这也是视图设置为实际帧速率的最高帧速率。 但是，如果您要求较低的帧速率，SceneKit可能会选择30,20,15或其他因素作为实际帧速率。 因此，您需要选择应用可以始终如一地维护的帧速率。

默认值为每秒60帧。


rendersContinuously
一个布尔值，用于确定视图是始终以其首选帧速率渲染还是仅在其可见内容更改时渲染。
当此值为NO（默认值）时，视图仅在其场景图中的某些内容更改或动画时重绘其内容。 使用此选项可最大限度地提高能效。

如果将此值更改为YES，则视图将以preferredFramesPerSecond属性指定的速率不断重绘自身，无论内容是在更改还是动画。


antialiasingMode
用于渲染视图场景的抗锯齿模式。
SceneKit可以使用一种称为多重采样的技术，提供抗锯齿，使渲染场景中的边缘平滑。 多重采样多次渲染每个像素并组合结果，以与其使用的样本数量成比例的性能成本创建更高质量的图像。

有关可用值，请参阅SCNView。 在macOS中，默认模式为SCNAntialiasingModeMultisampling4X。 在iOS中，默认模式为SCNAntialiasingModeNone。

SCNAntialiasingMode
SCNView属性使用的视图场景的抗锯齿渲染模式。
SCNAntialiasingModeNone
禁用抗锯齿渲染。
SCNAntialiasingModeMultisampling2X
启用多重采样抗锯齿，每个屏幕像素有两个样本。
SCNAntialiasingModeMultisampling4X
启用多重采样抗锯齿，每个屏幕像素有四个样本。
SCNAntialiasingModeMultisampling8X
启用多重采样抗锯齿，每个屏幕像素有8个样本。
SCNAntialiasingModeMultisampling16X
启用多重采样抗锯齿，每个屏幕像素有16个样本。
```

* 管理相机控件

```
allowsCameraControl
一个布尔值，用于确定用户是否可以操作用于渲染场景的当前视点。
如果将此属性设置为YES，则SceneKit会创建一个摄像机节点并处理鼠标或触摸事件，以允许用户平移，缩放和旋转其场景视图。 （启用用户摄像头控制不会修改场景图中已存在的摄像头对象或包含它们的节点。）

启用用户摄像头控制时，defaultCameraController对象处理输入事件并驱动摄像头行为。您可以使用该对象的方法和属性来更改用户相机交互的样式，并使用cameraControlConfiguration属性来调整控件灵敏度。

在默认配置中，SceneKit提供以下控件：

用一根手指平移以围绕场景旋转相机

用两根手指平移以在本地xy平面上平移相机

用三个手指垂直平移，向后移动相机

双击切换到场景中的下一个摄像头

用两根手指旋转以滚动相机（在相机节点的z轴上旋转）

捏放大或缩小（更改相机的fieldOfView）

此属性的默认值为NO。如果要以编程方式控制摄像机，请使用此选项


cameraControlConfiguration
摄像机控制器的事件处理行为的当前配置。


SCNCameraControlConfiguration
影响相机控制器行为的属性。
defaultCameraController
SCNCameraController
```

* 在视图场景中播放动作和动画

```
- pause：
暂停播放视图的场景。
- play：
恢复播放视图的场景。
- stop：
停止播放视图的场景并将场景时间重置为其开始时间。
```

* 捕获视图快照

```
- snapshot
将视图的场景渲染为新的图像对象。
```

* 使用View的OpenGL ES上下文

```
eaglContext
视图用于呈现其内容的OpenGL ES上下文。
如果使用OpenGL ES进行自定义呈现（请参阅SCNShadable，SCNNodeRendererDelegate和SCNSceneRendererDelegate协议），则可以使用此属性在用于呈现场景的上下文与应用程序使用的其他OpenGL ES上下文之间共享OpenGL ES资源。 有关共享OpenGL ES资源的详细信息，请参阅EAGL Sharegroup管理上下文的OpenGL ES对象。 （SceneKit会根据需要自动在您应用中的多个SCNView实例之间共享自己的OpenGL ES资源。）

如果为SceneKit视图提供自己的EAGLContext对象，请在创建时指定OpenGL ES 2.0或3.0 API。 SceneKit支持OpenGL ES 3.0，但在OpenGL ES 3.0上下文中渲染时会禁用某些功能。 SceneKit不支持OpenGL ES 1.1
```

* 使用View的OpenGL上下文

```
openGLContext
视图用于呈现其内容的OpenGL上下文。
如果使用OpenGL进行自定义呈现（请参阅SCNShadable，SCNNodeRendererDelegate和SCNSceneRendererDelegate协议），则可以使用此属性在用于呈现场景的上下文与应用程序使用的其他OpenGL上下文之间共享OpenGL资源。 有关共享OpenGL资源的详细信息，请参阅共享渲染上下文资源。 （SceneKit会根据需要自动在您应用中的多个SCNView实例之间共享自己的OpenGL资源。）


pixelFormat
视图的OpenGL像素格式。
像素格式对象配置用于渲染的OpenGL属性。 例如，如果使用OpenGL进行自定义渲染（请参阅SCNShadable，SCNNodeRendererDelegate和SCNSceneRendererDelegate协议），则将像素格式设置为指定OpenGL 3.2 Core Profile的格式允许您在自定义渲染代码中使用现代OpenGL API。

要更改像素格式，您可以执行以下任一操作：

在为要渲染的视图提供场景之前设置此属性的值。

在SCNView子类中，覆盖此属性的getter方法以返回首选像素格式。
```


##SCNCameraControlConfiguration

影响相机控制器行为的属性

















