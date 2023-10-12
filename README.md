# 🧭 SwiftUINavigator

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Static Badge](https://img.shields.io/badge/iOS-v13-blue)
![Static Badge](https://img.shields.io/badge/Swift-5.4-orange)

**Use SwiftUI View with UIKit Project easily.**

#### 🤔 Why do you need SwiftUINavigator when you have a UIHostingController?
> With UIHostingController, I faced bugs that were hard to predict and could not be resolved. That's why I made SwiftUINavigator to solve those problems.

## ✔️ Example

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
