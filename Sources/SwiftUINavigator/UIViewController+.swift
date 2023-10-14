//
//  UIViewController+.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

#if canImport(UIKit)
import UIKit

public extension UIViewController {
    
    private struct AssociatedKeys {
        static var identifier = "Identifier"
    }

    var identifier: String? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.identifier) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.identifier, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func addChildAndSubView(_ controller: UIViewController) {
        self.addChild(controller)
        controller.view.frame = self.view.frame
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    func removeFromParentAndSuperView() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
#endif
