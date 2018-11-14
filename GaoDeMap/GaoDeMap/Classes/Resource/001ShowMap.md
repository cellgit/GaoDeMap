### 显示地图
####第一步，准备工作

1) 如果您还没有配置 3D 地图 SDK 到工程中，可以先参考[手动部署](https://lbs.amap.com/api/ios-sdk/guide/create-project/manual-configuration/)或[自动部署](https://lbs.amap.com/api/ios-sdk/guide/create-project/cocoapods/)配置工程。

2) 如果您需要 SDK 使用 HTTPS 协议发起网络请求可以参考[应用HTTPS解决方案](https://lbs.amap.com/api/ios-sdk/guide/create-project/https-guide/)章节的内容。

####第二步，配置头文件
--
在您的 ViewController.h 中添加以下两个头文件，注意Swift需要在桥接文件中引入头文件：

```
//在桥接文件中引入头文件
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
```

####第三步，实例化地图对象
--
在 MapTypeViewController.m 文件中添加实例化 MAMapView 的代码。

```
class BaseMapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    func setupMap() {
        let mapView = MAMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
    }
}
```
