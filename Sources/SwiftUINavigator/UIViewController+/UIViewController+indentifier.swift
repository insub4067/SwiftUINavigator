//
//  UIViewController+indentifier.swift
//
//
//  Created by 김인섭 on 10/15/23.
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
}
#endif
