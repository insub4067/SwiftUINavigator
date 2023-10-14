//
//  Wrappable.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

#if canImport(SwiftUI)
import SwiftUI

public protocol Wrappable: View {
    
    var navigator: Navigator? { get set }
}

public extension Wrappable {
    
    func asViewController(
        backgroundColor: UIColor? = nil,
        hidesBottomBarWhenPushed: Bool = true
    ) -> WrapperViewController<Self> {
        
        .init(
            content: self, 
            indentifier: "\(Self.self)",
            backgroundColor: backgroundColor,
            hidesBottomBarWhenPushed: hidesBottomBarWhenPushed
        )
    }
}
#endif
