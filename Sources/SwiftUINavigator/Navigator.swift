//
//  Navigator.swift
//
//
//  Created by 김인섭 on 10/12/23.
//

#if canImport(UIKit)
import UIKit

public class Navigator {
    
    public weak var viewController: UIViewController?
    
    public func set(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
}

// Presentation
public extension Navigator {
    
    func push(_ destination: UIViewController, animated: Bool = true) {
        self.viewController?.navigationController?.pushViewController(destination, animated: animated)
    }
    
    func present(_ destination: UIViewController, style: UIModalPresentationStyle = .fullScreen, animated: Bool = true) {
        destination.modalPresentationStyle = style
        self.viewController?.navigationController?.topViewController?.present(destination, animated: animated)
    }
}

// Dismiss, Dismiss
public extension Navigator {
    
    func popToRootViewController(_ animated: Bool = true) {
        viewController?.navigationController?.popToRootViewController(animated: animated)
    }
    
    func pop(animated: Bool = true) {
        self.viewController?.navigationController?.popViewController(animated: animated)
    }
    
    func pop(to controller: AnyClass, animated: Bool = true) {
        
        let target = self.viewController?.navigationController?.viewControllers
            .filter { $0.isMember(of: controller) }
            .first
        
        guard let target = target else { return }
        self.viewController?.navigationController?.popToViewController(target, animated: animated)
    }
    
    func pop(to identifier: String, animated: Bool = true) {
        let target = self.viewController?.navigationController?.viewControllers
            .filter { $0.identifier == identifier }
            .first
            
        guard let target = target else { return }
        self.viewController?.navigationController?.popToViewController(target, animated: animated)
    }
    
    func pop(toOneOf controllers: AnyClass..., animated: Bool = true) {
        
        guard let viewControllers = self
            .viewController?
            .navigationController?
            .viewControllers
        else { return }
        
        for controller in viewControllers {
            let shouldPop = controllers.contains(where: { controller.isMember(of: $0) })
            guard shouldPop else { continue }
            self.viewController?.navigationController?.popToViewController(controller, animated: animated)
        }
    }
    
    func pop(toOneOf identifiers: String..., animated: Bool = true) {
        
        guard let viewControllers = self
            .viewController?
            .navigationController?
            .viewControllers
        else { return }
        
        let target = viewControllers
            .filter { identifiers.contains($0.identifier ?? "") }
            .first
        
        guard let target = target else { return }
        self.viewController?.navigationController?.popToViewController(target, animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        self.viewController?.dismiss(animated: animated)
    }
    
    func removeFromParentAndSuperView() {
        self.viewController?.navigationController?.topViewController?.removeFromParentAndSuperView()
    }
}
#endif
