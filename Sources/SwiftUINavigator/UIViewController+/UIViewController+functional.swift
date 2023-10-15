//
//  UIViewController+functional.swift
//
//
//  Created by 김인섭 on 10/15/23.
//

#if canImport(UIKit)
import UIKit

public extension UIViewController {
    
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }
    
    func hidesBottomBarWhenPushed(_ state: Bool) -> Self {
        self.hidesBottomBarWhenPushed = state
        return self
    }
    
    func backgroundColor(_ color: UIColor?) -> Self {
        self.view.backgroundColor = color
        return self
    }
}
#endif
