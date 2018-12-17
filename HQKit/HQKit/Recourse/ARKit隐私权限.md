**验证设备支持和用户权限**

确保您的应用可以使用ARKit并尊重用户隐私

ARKit需要iOS 11.0或更高版本以及带有A9或更高版本处理器的iOS设备。某些ARKit功能需要更高版本的iOS版本或特定设备。 ARKit还使用设备摄像头，因此您需要配置iOS隐私控件，以便用户可以允许您的应用访问摄像头。

如何处理设备兼容性支持取决于您的应用程序如何使用ARKit：

* 如果您的应用程序的基本功能需要AR（使用后置摄像头）：在应用程序的Info.plist文件的UIRequiredDeviceCapabilities部分添加arkit密钥。使用此密钥可使您的应用仅适用于与ARKit兼容的设备。

* 如果增强现实是应用程序的辅助功能：通过测试相应ARConfiguration子类的isSupported属性，检查当前设备是否支持您要使用的AR配置。

* 如果您的应用使用面部追踪AR：面部追踪需要iPhone X上的前置TrueDepth相机。您的应用仍可在其他设备上使用，因此您必须测试ARFaceTrackingConfiguration.isSupported属性以确定当前设备上的面部追踪支持

>Tip
>
>在应用程序的UI中提供AR功能之前，请检查isSupported属性，以便不受支持的设备上的用户不会因尝试访问这些功能而失望

**处理用户同意和隐私**

要让您的应用使用ARKit，用户必须明确授予您的应用访问相机的权限。 当您的应用首次运行AR会话时，ARKit会自动询问用户是否有权限。

iOS要求您的应用在系统要求摄像头或麦克风权限时提供静态消息。 您应用的Info.plist文件必须包含NSCameraUsageDescription键。 对于该密钥，请提供说明您的应用需要相机访问权限的文本，以便用户可以放心地授予您的应用权限
>注意

>如果您使用Xcode模板创建新的ARKit应用程序，则会为您提供默认的相机使用说明

如果您的应用使用ARFaceTrackingConfiguration，ARKit会为您的应用提供个人面部信息。 如果您使用ARKit面部追踪功能，您的应用必须包含隐私政策，向用户描述您打算如何使用面部追踪和面部数据。 有关详细信息，请参阅Apple Developer Program License Agreement

























