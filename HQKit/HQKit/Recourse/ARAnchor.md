##ARAnchor

可用于在AR场景中放置对象的真实世界位置和方向

要跟踪实际或虚拟对象相对于摄像机的静态位置和方向，请创建锚点对象并使用addAnchor：方法将它们添加到AR会话。

>Tip

>向会话添加锚点有助于ARKit优化该锚点周围区域的世界跟踪精度，以便虚拟对象看起来相对于现实世界保持原位。 如果虚拟对象移动，则从旧位置移除相应的锚点，并在新位置添加一个锚点。

一些ARKit功能会自动为会话添加特殊锚点。 如果启用相应的功能，世界跟踪会话可以添加ARPlaneAnchor，ARObjectAnchor和ARImageAnchor对象; 面部跟踪会话添加ARFaceAnchor对象

**子类注释**

除了创建自己的ARAnchor实例以跟踪虚拟内容的真实位置之外，您还可以将ARAnchor子类化，以将自定义数据与您创建的锚点相关联。 当ARKit更新帧或在ARWorldMap中保存和加载锚点时，确保您的锚类行为正确：

  锚子类必须满足ARAnchorCopying协议的要求。 ARKit调用initWithAnchor :(在后台线程上）将锚类的实例从每个ARFrame复制到下一个ARFrame。 您的初始化程序的实现应该复制子类添加的任何自定义属性的值。

  锚子类还必须采用NSSecureCoding协议。 覆盖encodeWithCoder：和initWithCoder：当ARKit保存并在世界地图中加载它们时，保存并恢复子类的自定义属性的值。

  基于标识符属性，锚被认为是相等的。

  保存世界地图时，仅包含不采用ARTrackable的锚点
  
#### 开始

* 创建自定义锚点

```
- initWithTransform：
使用指定的转换创建新的锚点对象。
使用addAnchor：方法开始在AR会话中跟踪自定义锚点。


- initWithName：transform：
使用指定的转换和描述性名称创建新的锚点对象。
使用addAnchor：方法开始在AR会话中跟踪自定义锚点。

name 
锚的描述性名称。
要命名锚点，请使用initWithName：transform：initializer创建一个锚点。 对于另外创建的锚点，此属性为零。

ARKit不会向用户显示名称，但您的应用可以使用它来识别用于调试的锚点。
```
  
* 跟踪锚点

```
identifier
锚的唯一标识符。
无论是手动创建锚（使用initWithTransform：初始化程序）还是通过ARKit自动创建（并通过ARSessionDelegate，ARSCNViewDelegate或ARSKViewDelegate方法提供给锚），每个锚都会自动接收唯一标识符值。

您可以使用此值来确定伴随特定ARFrame捕获的锚点对应于先前捕获的帧中的锚点。

transform
一种矩阵，用于编码锚点相对于放置锚点的AR会话的世界坐标空间的位置，方向和比例。
ARKit中的世界坐标空间始终遵循右手惯例，但是基于会话配置进行定向。 有关详细信息，请参阅了解ARKit中的世界跟踪。
```

##ARObjectAnchor

有关在世界跟踪AR会话中检测到的真实3D对象的位置和方向的信息。

当您运行世界跟踪AR会话并为会话配置的detectObjects属性指定ARReferenceObject对象时，ARKit会在实际环境中搜索这些对象。 当会话识别出一个对象时，它会自动为每个检测到的对象添加一个ARObjectAnchor锚点列表。

要放置与检测到的对象的位置或大小匹配的虚拟3D内容，请使用锚点的继承转换属性以及锚点的referenceObject的中心和范围。

* 识别检测到的对象

```
referenceObject
检测到的对象由对象锚引用。
在配置会话时，此对象始终是您在detectionObjects数组中提供的ARReferenceObject对象之一。
```
  
  
##ARImageAnchor

有关在世界跟踪AR会话中检测到的图像的位置和方向的信息。

当您运行世界跟踪AR会话并为会话配置的detectionImages属性指定ARReferenceImage对象时，ARKit会在实际环境中搜索这些图像。 当会话识别出图像时，它会自动为每个检测到的图像添加一个ARImageAnchor锚点列表。

要在场景中查找已识别图像的范围，请将继承的transform属性与anchor的referenceImage的physicalSize一起使用。

* 识别检测到的图像

```
referenceImage
检测到的图像由图像锚点引用。
```

##ARPlaneAnchor

有关在世界跟踪AR会话中检测到的真实世界平面的位置和方向的信息。

当您运行启用了planeDetection选项的全局跟踪AR会话时，会话会自动将锚点列表添加到每个平面ARKit使用后向摄像头检测到的ARPlaneAnchor对象。 每个平面锚提供有关估计的表面位置和形状的信息

####开始

* 确定平面方向

* 使用详细的平面几何

* 使用基本平面尺寸

```

```

* 分类

```
classificationSupported
一个布尔值，指示当前设备上的平面分类是否可用。
分类
平面锚表示什么样的真实世界表面的一般特征。
ARPlaneClassification
由平面锚点表示的真实世界曲面的可能特征。
classificationStatus
ARKit分类飞机锚的过程的当前状态。
ARPlaneClassificationStatus
ARKit分类飞机锚的过程的可能状态。
```
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  