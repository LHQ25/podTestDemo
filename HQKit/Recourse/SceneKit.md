##SceneKit

使用高级场景描述创建3D游戏并将3D内容添加到应用程序。 轻松添加动画，物理模拟，粒子效果和逼真的基于物理的渲染。

SceneKit将高性能渲染引擎与描述性API相结合，用于导入，操纵和渲染3D资源。 与较低级别的API（如Metal和OpenGL）要求您精确地实现显示场景的渲染算法不同，SceneKit仅需要描述场景内容以及您希望它执行的动作或动画。

* 第一步

  SCNScene

  用于节点层次结构和全局属性的容器，它们一起形成可显示的3D场景。

  SCNView
  
  用于显示3D SceneKit内容的视图。
  
* 场景结构

  使用节点组织场景
  使用节点定义场景的结构。
  
  SCNNode
  场景图的结构元素，表示3D坐标空间中的位置和变换，您可以附加几何，灯光，相机或其他可显示内容。
  
  SCNReferenceNode
场景图节点，用作从单独场景文件加载内容的占位符。

* 显示和交互

  SCNSceneRenderer
SCNView，SCNLayer和SCNRenderer类通用的方法和属性。

  SCNSceneRendererDelegate
您的应用可以实现的方法参与SceneKit的动画循环或执行其他渲染。

  SCNLayer
Core Animation层，将SceneKit场景作为其内容呈现。

  SCNRenderer
用于在现有Metal工作流或OpenGL上下文中显示SceneKit场景的渲染器。

  SCNHitTestResult
有关场景空间或视图空间搜索场景元素的结果的信息。

* 照明，相机和阴影

  SCNLight
可以连接到节点以照亮场景的光源。

  SCNCamera
一组摄像机属性，可以附加到节点以提供显示场景的视点。

  SCNMaterial
一组着色属性，用于在渲染时定义几何体表面的外观。

  SCNMaterialProperty
用于材料视觉属性之一的颜色或纹理的容器。

* 几何

  SCNGeometry
可以在场景中显示的三维形状（也称为模型或网格），具有定义其外观的附加材料。

  SCNGeometrySource
用于顶点数据的容器，其形成三维对象或几何的定义的一部分。

  SCNGeometryElement
索引数据的容器，描述顶点如何连接以定义三维对象或几何。

  内置几何类型
基本形状 - 例如球体，盒子和平面 - 以及用于从2D文本和Bézier曲线生成3D对象的特征。

* 动画和约束

  animation
创建以预定方式移动场景元素的声明性动画，或管理使用外部创作工具导入的动画。

  Constraints
根据指定的规则自动调整节点的位置或方向。

  SCNSkinner
管理骨架动画与其动画的节点和几何之间关系的对象。

  SCNMorpher
管理节点基础几何体与一个或多个目标几何体之间平滑过渡的对象。


* 物理

  物理模拟
向场景元素添加动态行为; 检测接触和碰撞; 模拟重力，弹簧和车辆等逼真效果。

* 粒子系统

  SCNParticleSystem
一个对象，使用您指定的一般行为的高级模拟动画和渲染小图像精灵系统。

  SCNParticlePropertyController
由粒子系统渲染的单个粒子的单个属性的动画。

  基于文档浏览器视图控制器构建应用程序
实现自定义文档文件格式以管理用户与不同云存储提供程序上的文件的交互。

* 音频

  SCNAudioSource
一种简单，可重复使用的音频源 - 从文件加载的音乐或声音效果 - 用于位置音频播放。

  SCNAudioPlayer
用于在SceneKit场景中回放位置音频源的控制器。

* 渲染器自定义

  SCNShadable
使用Metal或OpenGL着色器程序自定义SceneKit渲染几何体和材质的方法。

  SCNProgram
一个完整的Metal或OpenGL着色器程序，它取代了SceneKit对几何体或材质的渲染。

  SCNBufferStream
管理自定义着色器程序使用的Metal缓冲区的对象。

  SCNTechnique
使用带有自定义Metal或OpenGL着色器的附加绘图过程来增强或后处理SceneKit渲染场景的规范。

  SCNTechniqueSupport
SceneKit对象的通用接口，支持使用SCNTechnique对象进行多通道渲染。

  SCNNodeRendererDelegate
您可以实现的方法使用您自己的自定义Metal或OpenGL绘图代码来呈现节点的内容。

* 场景资产导入

  SCNSceneSource
管理与从文件或数据加载场景内容相关联的数据读取任务的对象。

* JavaScript

  SCNExportJavaScriptModule
使SceneKit类和全局常量可用于指定的JavaScript上下文。

* SceneKit数据类型
* 
  SceneKit 3D数据类型
SceneKit特定的向量，矩阵以及相关的函数和操作。matrices, and related functions and operations.









