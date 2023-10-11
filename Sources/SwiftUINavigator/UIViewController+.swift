//
//  UIViewController+.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

#if canImport(UIKit)
import UIKit

public extension UIViewController {
    
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
