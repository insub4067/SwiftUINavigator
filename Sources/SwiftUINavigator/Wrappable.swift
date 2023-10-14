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
    
    var identifier: String { "\(Self.self)" }
    
    func asViewController(
        backgroundColor: UIColor? = nil,
        hidesBottomBarWhenPushed: Bool = true
    ) -> WrapperViewController<Self> {
        
        .init(
            content: self, 
            indentifier: identifier,
            backgroundColor: backgroundColor,
            hidesBottomBarWhenPushed: hidesBottomBarWhenPushed
        )
    }
}
#endif
