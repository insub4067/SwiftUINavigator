//
//  WrapperViewController.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

#if canImport(SwiftUI)
import SwiftUI

public class WrapperViewController<Content: Wrappable>: UIViewController {
    
    var hController = UIHostingController<Content?>(rootView: nil)
    var content: Content
    let navigator: Navigator

    init(
        content: Content,
        backgroundColor: UIColor? = nil,
        hidesBottomBarWhenPushed: Bool = true
    ) {
        self.navigator = Navigator()
        self.content = content
        self.content.navigator = self.navigator
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = backgroundColor ?? .systemBackground
        self.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        
        setHController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigator.set(self.navigationController)
    }
}

extension WrapperViewController {
    
    func setHController() {
        hController = .init(rootView: content)
        hController.view.backgroundColor = self.view.backgroundColor
        addChildAndSubView(hController)
    }
}
#endif
