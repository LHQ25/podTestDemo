##ARKit

**集成iOS设备相机和动作功能，在您的应用或游戏中产生增强现实体验**

1. 概观

  增强现实（AR）描述了用户体验，这些体验将2D或3D元素从设备的相机添加到实时视图中，使得这些元素看起来居住在现实世界中。 ARKit结合了设备运动跟踪，摄像机场景捕捉，高级场景处理和显示便利性，简化了构建AR体验的任务。 您可以使用这些技术使用iOS设备的后置摄像头或前置摄像头创建多种AR体验。
  
2. 使用后置摄像头增强现实感

  最常见的AR体验类型显示来自iOS设备的后置摄像头的视图，并通过其他可视内容进行扩充，为用户提供了一种查看周围世界并与之交互的新方式。

  ARWorldTrackingConfiguration提供这种体验：ARKit映射和跟踪用户所居住的真实世界空间，并将其与坐标空间相匹配，以便您放置虚拟内容。 世界跟踪还提供使AR体验更具沉浸感的功能，例如识别用户环境中的对象和图像以及响应真实世界的光照条件
  
  >注意:
  您可以在用户的真实环境中显示3D对象，而无需构建自定义AR体验。 在iOS 12中，当您在应用程序中使用带有USDZ文件的QLPreviewController时，系统会为3D对象提供AR视图，或者在Web内容中使用带有USDZ文件的Safari或WebKit
  
3. 使用前置摄像头增强现实感

   在iPhone X上，ARFaceTrackingConfiguration使用正面的TrueDepth摄像头提供有关用户脸部姿势和表情的实时信息，供您在渲染虚拟内容时使用。 例如，您可以在摄像机视图中显示用户的面部并提供逼真的虚拟遮罩。 您还可以省略摄像机视图并使用ARKit面部表情数据为虚拟角色设置动画，如iMessage的Animoji应用程序中所示
   
---

###开始
1. 第一步 
 
  验证设备支持和用户权限
  确保您的应用可以使用ARKit并尊重用户隐私。
  
  ARSession
  一个共享对象，用于管理增强现实体验所需的设备摄像头和运动处理。
  
  ARConfiguration
  AR会话配置的抽象基类。
  
2. 显示

  ARSCNView
  用于显示增强使用3D SceneKit内容的摄像机视图的AR体验的视图。
  
  ARSKView
  用于显示增强使用2D SpriteKit内容的摄像机视图的AR体验的视图。
  
  使用Metal显示AR体验
通过渲染摄像机图像并使用位置跟踪信息来显示叠加内容，从而构建自定义AR视图。

3. 世界追踪

  创建AR体验，允许用户使用设备的后置摄像头探索周围世界中的虚拟内容。

  建立您的第一个AR体验
创建运行AR会话的应用程序，并使用平面检测使用SceneKit放置3D内容。

  了解ARKit中的世界跟踪
发现支持概念，功能和最佳实践，以构建出色的AR体验。
ARWorldTrackingConfiguration
使用后置摄像头的配置，跟踪设备的方向和位置，并检测真实世界的表面，以及已知的图像或对象。

  ARPlaneAnchor
有关在世界跟踪AR会话中检测到的真实世界平面的位置和方向的信息

4. 用户体验

  按照以下示例和人机界面指南>增强现实，构建引人注目的直观AR体验。

  管理会话生命周期和跟踪质量
通过提供清晰的反馈，从中断中恢复以及恢复以前的会话，使您的AR体验更加强大。

  在增强现实中处理3D交互和UI控件
遵循AR体验中的视觉反馈，手势交互和逼真渲染的最佳实践。

  SwiftShot：为增强现实创建游戏
了解Apple如何为WWDC18构建精选演示，并获取使用ARKit，SceneKit和Swift制作自己的多人游戏的提示

5. AR世界分享和坚持

  创建多用户AR体验
使用MultipeerConnectivity框架在附近设备之间传输ARKit世界地图数据，为AR体验创建共享基础。

  创建持久的AR体验
保存并加载ARKit世界地图数据，以允许用户在相同的真实环境中返回之前的AR体验。

  ARWorldMap
来自世界跟踪AR会话的空间映射状态和锚点集

6. 环境纹理

  为AR体验增添现实的思考
使用ARKit从摄像机图像生成环境探测纹理并渲染反射虚拟对象。

  AREnvironmentProbeAnchor
在世界跟踪AR会话中为特定空间区域提供环境照明信息的对象

7. 图像检测和跟踪

  在用户环境中使用已知的2D图像来增强世界跟踪AR会话。

  识别AR体验中的图像
  检测用户环境中的已知2D图像，并使用其位置放置AR内容。

  ARReferenceImage
  在世界跟踪AR会话期间在现实世界环境中识别的图像。

  ARImageAnchor
  有关在世界跟踪AR会话中检测到的图像的位置和方向的信息
  
8. 物体检测

  使用用户环境中的已知3D对象来增强世界跟踪AR会话。

  扫描和检测3D对象
  记录现实世界对象的空间特征，然后使用结果在用户环境中查找这些对象并触发AR内容。

  ARReferenceObject
  在世界跟踪AR会话期间在真实世界环境中识别的3D对象。
  
  ARObjectAnchor
  有关在世界跟踪AR会话中检测到的真实3D对象的位置和方向的信息。
  
  ARObjectScanningConfiguration
  一种配置，使用后置摄像头收集高保真空间数据，用于扫描3D对象以便以后检测.
  
9. 命中测试和真实世界的位置

  ARHitTestResult
通过检查AR会话的设备摄像机视图中的点找到有关真实世界表面的信息。

  ARAnchor
可用于在AR场景中放置对象的真实世界位置和方向。

  ARAnchorCopying
支持自定义ARAnchor子类。

  ARTrackable
场景中的真实世界对象，ARKit跟踪位置和方向的变化

10. 相机和场景细节

  ARFrame
具有位置跟踪信息的视频图像作为AR会话的一部分被捕获。

  ARCamera
有关AR会话中捕获的视频帧的摄像机位置和成像特征的信息。

  ARLightEstimate
与AR会话中捕获的视频帧相关联的估计场景照明信息

11. 面部追踪

  使用iPhone X上的TrueDepth相机创建响应用户脸部和面部表情的AR体验。

  创建基于脸部的AR体验
使用面部跟踪AR会话提供的信息来放置3D内容并为其添加动画。

  ARFaceTrackingConfiguration
使用TrueDepth相机跟踪用户脸部的移动和表情的配置。

  ARFaceAnchor
有关在面部跟踪AR会话中检测到的面部的姿势，拓扑和表情的信息。

  ARDirectionalLightEstimate
在面部跟踪AR会话中与捕获的视频帧相关联的估计的环境照明信息

12. 专业配置

  AROrientationTrackingConfiguration
使用后置摄像头并仅跟踪设备方向的配置。

  ARImageTrackingConfiguration
使用后置摄像头检测和跟踪已知图像的配置

13. 相关技术

  使用音频创建沉浸式AR体验
使用声音效果和环境声音层创建引人入胜的AR体验。

  使用ARKit实时使用Vision
管理Vision资源以有效执行Core ML图像分类器，并使用SpriteKit在AR中显示图像分类器输出
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

