## SCNNode

场景图的结构元素，表示3D坐标空间中的位置和变换，您可以附加几何，灯光，相机或其他可显示内容

当包含它的场景被渲染时，SCNNode对象本身没有可见内容 - 它仅表示相对于其父节点的坐标空间变换（位置，方向和比例）。 要构建场景，可以使用节点层次结构来创建其结构，然后将灯光，相机和几何图形添加到节点以创建可见内容

* 创建节点

```
+ node
创建并返回节点对象。
+ nodeWithGeometry：
创建并返回附加了指定几何的节点对象。
+ nodeWithMDLObject：
从指定的Model I / O对象创建节点。
```

* 管理节点的转换

```
simdTransform
变换应用于节点相对于其父节点。动画。
simdPosition
应用于节点的转换。动画。
simdRotation
节点的方向，表示为绕轴的旋转角度。动画。
simdEulerAngles
节点的方向，以弧度表示为俯仰，偏航和滚转角度。动画。
simdOrientation
节点的方向，表示为四元数。动画。
simdScale
应用于节点的比例因子。动画。
simdPivot
节点位置，旋转和缩放的轴心点。动画。
```

* 管理节点内容

```
name
与节点关联的名称。
light
灯附着在节点上。
camera
相机连接到节点。
geometry
附加到节点的几何体。
morpher
负责混合节点几何的变形器对象。
skinner
skinner对象负责节点内容的骨架动画。
categoryBitMask
一个掩码，用于定义节点所属的类别。
SCNBoundingVolume
用于测量位置和大小的SCNNode和SCNGeometry类通用的方法。
```
* 约束节点行为

```
constraints
影响节点转换的约束列表。
```

* 使用节点动画

```
presentationNode
一个节点对象，表示当前在屏幕上显示的节点的状态。
pause
一个布尔值，用于确定是否运行附加到节点及其子节点的操作和动画。
```

* 修改节点可见性

```
hidden
一个布尔值，用于确定节点内容的可见性。动画。
opacity
节点的不透明度值。动画。
renderingOrder
节点的内容相对于其他节点的顺序。
castsShadow
一个布尔值，用于确定SceneKit是否将节点的内容呈现为阴影贴图。
movabilityHint
一个值，指示在渲染与运动相关的效果时SceneKit应如何处理节点。
SCNMovabilityHint
通知SceneKit渲染移动相关效果的值，由movabilityHint属性使用。
```

* 管理节点层次结构

```
parentNode
场景图层次结构中节点的父节点。
childNodes
场景图层次结构中节点子节点的数组。
- addChildNode：
将节点添加到节点的子阵列中。
- insertChildNode：atIndex：
将节点添加到指定索引处的节点的子数组中。
- removeFromParentNode
从其父节点的子节点数组中删除节点。
- replaceChildNode：with：
从节点的子数组中删除子节点并在其位置插入另一个节点。
```

* 搜索节点层次结构

```
- childNodesPassingTest：
返回节点的子节点子树中满足块应用的测试的所有节点。
- childNodeWithName：递归：
返回节点的子节点子树中具有指定名称的第一个节点。
- enumerateChildNodesUsingBlock：
为每个节点的子节点和后代节点执行指定的块。
- enumerateHierarchyUsingBlock：
为每个节点的子节点和子节点以及节点本身执行指定的块。
```

* 自定义节点渲染

```
filters
过滤器
要应用于节点的渲染内容的Core Image过滤器数组。
rendererDelegate
负责使用Metal或OpenGL为节点呈现自定义内容的对象。
```

* 将物理添加到节点

```
physicsBody
与节点关联的物理主体。
physicsField
与节点关联的物理字段。
```

* 使用粒子系统

```
- addParticleSystem：
将粒子系统附加到节点。
particleSystems
粒子系统附加到节点。
- removeParticleSystem：
删除连接到节点的粒子系统。
- removeAllParticleSystems
删除直接连接到节点的任何粒子系统。
```

* 使用位置音频

```
- addAudioPlayer：
将指定的自动播放器添加到节点并开始播放。
audioPlayers
当前连接到节点的音频播放器。
- removeAudioPlayer：
从节点中删除指定的音频播放器，停止播放。
- removeAllAudioPlayers
删除连接到节点的所有音频播放器，停止播放。
```

* 复制节点

```
- clone
创建节点及其子节点的副本。
- flattenedClone
创建节点及其子节点的优化副本。
```

* 命中测试

```
- hitTestWithSegmentFromPoint：toPoint：options：
在节点的子节点子树中搜索与两个指定点之间的线段相交的对象。
SCNHitTestOption
影响SceneKit命中测试方法行为的选项。
```

* 执行节点相关操作

```
- simdRotateBy：aroundTarget：
通过围绕场景空间中指定点的旋转，更改节点相对于其当前变换的位置和方向。
- simdLocalTranslateBy：
更改节点相对于其当前位置的位置。
- simdLocalRotateBy：
更改节点相对于其当前方向的方向。
- simdLookAt：
更改节点的方向，使其本地前向矢量指向指定位置。
- simdLookAt：up：localFront：
更改节点的方向，以便指定的前向矢量指向指定的位置。
```

* 计算节点相对变换

```
simdLocalRight
SceneKit的方向在所有节点的局部空间中视为“正确”。
simdLocalUp
SceneKit的方向在所有节点的局部空间中视为“向上”。
simdLocalFront
单位矢量SceneKit在所有节点的局部空间中视为“前进”。
simdWorldRight
相对于节点的“右”（+ X）方向向量，以世界空间表示。
simdWorldUp
相对于节点的“向上”（+ Y）方向向量，以世界空间表示。
simdWorldFront
相对于节点的“前向”（-Z）方向向量，以世界空间表示。
```

* 管理世界空间的变革

```
simdWorldTransform
世界变换应用于节点。
simdWorldOrientation
节点相对于场景世界坐标空间的方向。
simdWorldPosition
节点相对于场景世界坐标空间的位置。
```

* 在坐标空间之间转换

```
- simdConvertPosition：fromNode：
将位置从另一个节点的位置转换为节点的本地坐标空间。
- simdConvertPosition：toNode：
将位置从节点的本地坐标空间转换为另一个节点的位置。
- simdConvertTransform：fromNode：
将变换从另一个节点的变换转换为节点的本地坐标空间。
- simdConvertTransform：toNode：
将变换从节点的本地坐标空间转换为另一个节点的变换。
- simdConvertVector：fromNode：
将方向向量从另一个节点的方向向量转换为节点的本地坐标空间。
- simdConvertVector：toNode：
将方向向量从节点的本地坐标空间转换为另一个节点的方向向量。

```

* 处理UI焦点

```
focusBehavior
节点的焦点行为。
SCNNodeFocusBehavior
SceneKit节点的可聚焦状态的选项。
```

* 使用GameplayKit

```
entity
此节点表示的GameplayKit实体。
```

* 管理节点的变换（SceneKit类型）

```
transform
变换应用于节点相对于其父节点。动画。
location
应用于节点的转换。动画。
roation
节点的方向，表示为绕轴的旋转角度。动画。
eulerAngles
节点的方向，以弧度表示为俯仰，偏航和滚转角度。动画。
orientation
节点的方向，表示为四元数。动画。
sclale
应用于节点的比例因子。动画。
pivot
节点位置，旋转和缩放的轴心点。动画。

```

* 执行节点相关操作（SceneKit类型）

```
- rotateBy：aroundTarget：
通过围绕场景空间中指定点的旋转，更改节点相对于其当前变换的位置和方向。
- localTranslateBy：
更改节点相对于其当前位置的位置。
- localRotateBy：
更改节点相对于其当前方向的方向。
- 看着：
更改节点的方向，使其本地前向矢量指向指定位置。
- lookAt：up：localFront：
更改节点的方向，以便指定的前向矢量指向指定的位置。
```

* 计算节点相对变换（SceneKit类型）

```
localRight
SceneKit的方向在所有节点的局部空间中视为“正确”。
localUp
SceneKit的方向在所有节点的局部空间中视为“向上”。
localFront
单位矢量SceneKit在所有节点的局部空间中视为“前进”。
worldRight
相对于节点的“右”（+ X）方向向量，以世界空间表示。
worldUp
相对于节点的“向上”（+ Y）方向向量，以世界空间表示。
worldFront
相对于节点的“前向”（-Z）方向向量，以世界空间表示。
```

* 管理世界空间中的变换（SceneKit类型）

```
worldTransform
世界变换应用于节点。
- setWorldTransform：
设置应用于节点的世界变换。
worldOrientation
节点相对于场景世界坐标空间的方向。
worldPosition
节点相对于场景世界坐标空间的位置。
```

* 在坐标空间之间转换（SceneKit类型）

```
- convertPosition：fromNode：
将位置从另一个节点的位置转换为节点的本地坐标空间。
- convertPosition：toNode：
将位置从节点的本地坐标空间转换为另一个节点的位置。
- convertTransform：fromNode：
将变换从另一个节点的变换转换为节点的本地坐标空间。
- convertTransform：toNode：
将变换从节点的本地坐标空间转换为另一个节点的变换。
- convertVector：fromNode：
将方向向量从另一个节点的方向向量转换为节点的本地坐标空间。
- convertVector：toNode：
将方向向量从节点的本地坐标空间转换为另一个节点的方向向量。
```






















