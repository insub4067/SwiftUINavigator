//
//  Navigator.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

import UIKit

public class Navigator {
    
    public weak var navigationController: UINavigationController?
    
    public func set(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    public func push(_ destination: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(destination, animated: animated)
    }
    
    public func present(_ destination: UIViewController, style: UIModalPresentationStyle = .fullScreen, animated: Bool = true) {
        destination.modalPresentationStyle = style
        navigationController?.topViewController?.present(destination, animated: animated)
    }
    
    public func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func dismiss(animation: Bool = true) {
        navigationController?.topViewController?.dismiss(animated: animation)
    }
    
    public func pop(to controller: AnyClass, animated: Bool = true) {
        
        let target = navigationController?.viewControllers
            .filter { $0.isMember(of: controller) }
            .first
        
        guard let target = target else { return }
        
        navigationController?.popToViewController(target, animated: animated)
    }
    
    public func pop(to controllers: AnyClass..., animated: Bool = true) {
        
        guard let viewControllers = navigationController?.viewControllers else { return }
        
        for controller in viewControllers {
            let shouldPop = controllers.contains(where: { controller.isMember(of: $0) })
            guard shouldPop else { continue }
            navigationController?.popToViewController(controller, animated: animated)
        }
    }
    
    public func removeFromParentAndSuperView() {
        navigationController?.topViewController?.removeFromParentAndSuperView()
    }
}
