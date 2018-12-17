SCNScene

用于节点层次结构和全局属性的容器，它们一起形成可显示的3D场景

要使用SceneKit显示3D内容，您需要创建一个场景，其中包含节点和属性的层次结构，这些节点和属性共同代表您的可视元素。 通常，您在3D可视化编辑器中构建资源，然后使用Xcode的SceneKit场景编辑器将它们组装到场景中，为SceneKit渲染做好准备。

要显示场景，需要在运行时加载它，然后将其设置为SCNView的场景属性：scene

**创建场景**

  创建场景的最简单方法是通过Xcode的SceneKit场景编辑器。 首先从3D编辑器导入一个或多个资源，例如Blender。 然后调整资源的位置和属性，并设置全局场景属性（如光照环境）以构成场景。 场景编辑器创建一个.scn文件，您将其保存到应用程序包中的.scnassets文件夹。 在构建项目时，Xcode会优化目标平台的场景文件。
  
  
*  从文件创建场景

```
+scene
创建并返回一个空场景。
空场景仅包含没有内容的根SCNNode对象。 要填充场景，请将子节点添加到根节点。

+ sceneNamed：
从应用程序主包中具有指定名称的文件加载场景。
此方法提供了一种从应用程序主包中的文件加载完整场景的便捷方法。 调用此方法等效于使用NSBundle类定位场景文件并将结果URL传递给sceneWithURL：options：error：方法，指定无选项且无错误处理。

有关更详细的选项或仅加载文件场景图的一部分，请使用SCNSceneSource类。

使用Xcode的场景编辑器或外部工具创建场景时，应将场景文件复制到应用程序包内具有.scnassets扩展名的目录中。 您还应该将任何作为纹理引用的图像文件放在资产目录中。 Xcode将优化场景和纹理资源，以在每个目标设备上获得最佳性能，并为交付功能准备纹理资源，例如App Thinning和On-Demand Resources

+ sceneNamed：inDirectory：options：
从应用程序主包的特定子目录中具有指定名称的文件加载场景。
此方法提供了一种从应用程序主包中的文件加载完整场景的便捷方法。 调用此方法等效于使用NSBundle类定位场景文件并将结果URL传递给sceneWithURL：options：error：方法。

有关更详细的选项或仅加载文件场景图的一部分，请使用SCNSceneSource类。

使用Xcode的场景编辑器或外部工具创建场景时，应将场景文件复制到应用程序包内具有.scnassets扩展名的目录中。 您还应该将任何作为纹理引用的图像文件放在资产目录中。 Xcode将优化场景和纹理资源，以在每个目标设备上获得最佳性能，并为交付功能（如App Thinning和On-Demand Resources）准备纹理资源。


+ sceneWithURL：选项：错误：
从指定的URL加载场景。
此方法提供了一种从任意URL的文件加载完整场景的便捷方法。有关更详细的选项或仅加载文件场景图的一部分，请使用SCNSceneSource类。

处理Swift中的错误：

在Swift中，此方法返回非可选结果，并使用throws关键字标记，以指示在失败的情况下它会引发错误。

您可以在try表达式中调用此方法，并处理do语句的catch子句中的任何错误，如Swift编程语言中的错误处理和关于导入的Cocoa错误参数中所述。
使用Xcode的场景编辑器或外部工具创建场景时，应将场景文件复制到应用程序包内具有.scnassets扩展名的目录中。您还应该将任何作为纹理引用的图像文件放在资产目录中。 Xcode将优化场景和纹理资源，以在每个目标设备上获得最佳性能，并为交付功能（如App Thinning和On-Demand Resources）准备纹理资源。
```

* 从模型I / O资产创建场景

```
+ sceneWithMDLAsset：
从指定的Model I / O资产创建场景。

Model I / O框架为多种3D资产文件格式和相关资源的导入，导出，描述和处理提供了通用支持。 （有关详细信息，请参阅模型I / O.）MDLAsset类是3D对象的通用容器。 导入模型I / O资产会创建一个SceneKit场景，其中包含与存储在资源中的对象相对应的节点，几何，材质，相机和灯光。
```

* 管理场景中的动画效果

```
pause
一个布尔值，用于确定是否在场景图中运行动作，动画，粒子系统和物理模拟。
```

* 访问场景内容

```
rootNode
场景图的根节点。
所有场景内容 - 节点，几何及其材质，灯光，相机和相关对象 - 都组织在具有单个公共根节点的节点层次结构中。

使用外部工具创建的一些场景文件可能描述包含多个根节点的节点层次结构。 当SceneKit导入此类文件时，它们的单独根节点将成为新的唯一根节点的子节点。

每个子节点的坐标系相对于其父节点的变换进行定义。 您不应该修改根节点的transform属性。

background
在场景的其余部分之前渲染的背景。
如果材质属性的内容对象为nil，则在绘制场景的其余部分之前，SceneKit不会绘制任何背景。 （如果场景显示在SCNView实例中，则视图的背景颜色在场景内容后面可见。）

如果为材质属性指定立方体贴图纹理（请参阅contents属性的讨论），则SceneKit会将背景渲染为天空盒。

lightingEnvironment
一种立方体贴图纹理，用于描述场景内容周围的环境，用于高级照明效果。
使用SCNLightingModelPhysicallyBased照明模型渲染材质时，SceneKit会根据周围环境以不同方式照亮曲面。 例如，使用基于物理的阴影，即使是漫反射的表面也会从它上方的天空和它下面的地面呈现出一些颜色。

Tip

为了获得逼真的结果，请为照明环境和背景属性重用相同的内容。
有关定义多维数据集映射的信息，请参阅contents属性的讨论。
```

* 管理场景属性

```
- attributeForKey：
返回指定键的scene属性。
指定键的scene属性，如果不存在此属性，则为nil。

- setAttribute：forKey：
设置指定键的场景属性。

SCNSceneAttribute

SCNSceneEndTimeAttributeKey
场景结束时间的浮点值（在NSNumber对象中）。
SCNSceneFrameRateAttributeKey
用于场景帧速率的浮点值（在NSNumber对象中）。
SCNSceneStartTimeAttributeKey
场景开始时间的浮点值（在NSNumber对象中）。
SCNSceneUpAxisAttributeKey
SCNVector3结构（在NSValue对象中），指定场景的方向。
```

* 导出场景文件

```
- writeToURL：options：delegate：progressHandler：
将场景及其内容导出到指定URL的文件。
输出文件的格式取决于操作系统和参数文件扩展名：

在iOS 10.0，tvOS 10.0，watchOS 3.0，OS X v10.11及更高版本中，指定.scn扩展名以使用SceneKit的本机格式保存文件。此格式支持SceneKit的所有功能（包括物理，约束和粒子系统），以这种格式读取文件比从其他场景文件格式导入更快。

仅在macOS中，指定.dae扩展名以数字资产交换（DAE）格式导出以供其他应用程序使用。导出的DAE文件不包含特定于SceneKit的场景元素，例如物理实体和字段，约束和粒子系统。


SCNSceneExportDelegate
您可以实现的方法参与将场景导出到文件的过程。

 ++ - writeImage：withSceneDocumentURL：originalImageURL：
告诉委托者导出附加到场景的图像。
```

* 将雾添加到场景中

```
fogStartDistance
从场景的内容开始被雾遮挡的视点的距离。动画。
雾效果会使场景内容变得越来越不可见，因为它们离目前用于渲染的pointOfView节点越远。 在小于fogStartDistance属性值的距离处，场景内容完全可见。 在更远的距离，SceneKit将渲染的场景内容与常量颜色（由fogColor属性指定）混合。 在大于fogEndDistance属性的距离处，场景内容完全消失，只有雾色可见。 使用雾为您的应用或游戏添加大气效果，或通过隐藏远离当前视点的场景部分来提高渲染性能。

默认起始距离为0.0。

您可以对此属性值的更改进行动画处理。 请参阅动画SceneKit内容。



fogEndDistance
从场景的内容被雾完全遮挡的视点的距离。动画。
雾效果会使场景内容变得越来越不可见，因为它们离目前用于渲染的pointOfView节点越远。 在小于fogStartDistance属性值的距离处，场景内容完全可见。 在更远的距离，SceneKit将渲染的场景内容与常量颜色（由fogColor属性指定）混合。 在大于fogEndDistance属性的距离处，场景内容完全消失，只有雾色可见。 使用雾为您的应用或游戏添加大气效果，或通过隐藏远离当前视点的场景部分来提高渲染性能。

默认结束距离0.0禁用雾效果。 更改此属性的值以启用雾。

您可以对此属性值的更改进行动画处理。 请参阅动画SceneKit内容。


fogDensityExponent
雾的强度在起始距离和结束距离之间的过渡曲线。动画。
随着与pointOfView位置的距离增加，雾效果淡化场景的内容，将其替换为fogColor颜色的增加强度。 fogDensityExponent属性确定此转换的平滑性或突然性。

值0.0（默认值）指定无衰减 - 雾的强度在所有距离处都相同。 值1.0指定线性转换，值2.0指定二次转换曲线。 较高的值几乎没有明显的效果。

您可以对此属性值的更改进行动画处理。 请参阅动画SceneKit内容。



fogColor
要与场景一起渲染的雾效果的颜色。动画。

此属性的值可以是NSColor对象（在macOS中），UIColor对象（在iOS中）或CGColorRef对象。 默认雾色为白色。

您可以对此属性值的更改进行动画处理。 请参阅动画SceneKit内容。
```

* 在场景中使用物理

```
physicsWorld
与场景相关的物理模拟。

每个场景都会自动创建一个物理世界对象，以模拟场景中节点上的物理。 您可以使用此属性访问场景的全局物理属性（如重力），以及管理节点之间的物理交互。 要使场景中的节点参与物理模拟，请使用其physicsBody和physicsField属性中的一个或两个。
```

* 在场景中使用粒子系统

```
- addParticleSystem：withTransform：
使用指定的变换将粒子系统附加到场景。
直接附加到场景的粒子系统与场景中任何节点的坐标空间无关。 要附加粒子系统，其发射器位置遵循场景中节点的移动，请使用相应的SCNNode方法。

有关粒子系统的详细信息，请参阅SCNParticleSystem。


particleSystems
粒子系统附着在场景中。

- removeParticleSystem：
删除附加到场景的粒子系统。
如果系统参数未引用直接连接到场景的粒子系统，则此方法无效。

- removeAllParticleSystems
删除直接连接到场景的任何粒子系统。
调用此方法不会删除附加到场景中节点的粒子系统。
```


* 常量

``` 
Scene Attributes
方法attributeForKey：和setAttribute：forKey的选项字典中可用的属性键：
  场景导出选项
writeToURL的选项：options：delegate：progressHandler：method。
SCNSceneExportProgressHandler
场景导出期间SceneKit调用的块的签名。
```


























