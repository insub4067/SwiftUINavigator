# 🧭 SwiftUINavigator

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Static Badge](https://img.shields.io/badge/iOS-v13-blue)
![Static Badge](https://img.shields.io/badge/Swift-5.4-orange)

> Use SwiftUI View with UIKit Project easily.

## 🤔 Why do you need SwiftUINavigator?
> With UIHostingController, I faced bugs that were hard to predict and could not be resolved. That's why I made SwiftUINavigator to solve those problems.

## ⚒️ How it works
<img width="650" alt="스크린샷 2023-10-15 오후 2 20 50" src="https://github.com/insub4067/SwiftUINavigator/assets/85481204/ddfa6af3-9dcc-4295-8715-8ce26aa06565">


## ✔️ Simple Example
```swift
SwiftUIView() // return View
    .asViewController() // return WrapperViewController
    .title("SwiftUIView") // return UIViewController
    .backgroundColor(.gray) // return UIViewController
    .hidesBottomBarWhenPushed(true) // return UIViewController
```

## ✔️ Project Example

### UIKit side
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: scene.coordinateSpace.bounds)
    window?.windowScene = scene
    
    let controller = RootView().asViewController()
    let navigationController = UINavigationController(rootViewController: controller)
    
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
}
```

### SwiftUI side
```swift
struct RootView: Wrappable {
    
    weak var navigator: Navigator?
    
    var body: some View {
        Button("Button") {
            let controller = DestinationView().asViewController()
            navigator?.push(controller)
        }
    }
}

struct DestinationView: Wrappable {
    
    weak var navigator: Navigator?
    
    var body: some View {
        Button("Button") {
            navigator?.pop()
        }
    }
}
```
