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
        hideBottomBar: Bool = true
    ) -> WrapperViewController<Self> {
        
        .init(
            content: self,
            backgroundColor: backgroundColor,
            hideBottomBar: hideBottomBar
        )
    }
}
#endif
