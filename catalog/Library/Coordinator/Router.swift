//
//  Router.swift
//  catalog
//
//  Created by Никита Владимирович on 04.09.2022.
//

import UIKit

protocol Router: AnyObject {
    
    func present(_ viewController: UIViewController, animated: Bool)
    
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: VoidClosure?)
    
    func dismiss(animated: Bool)
    
    func dismiss(animated: Bool, completion: VoidClosure?)
    
}

extension Router {
    
    func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
    
}
