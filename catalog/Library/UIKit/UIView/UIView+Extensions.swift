//
//  UIView+Extensions.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

extension UIView {
    
    static func loadView() -> Self {
        return self.init(frame: UIScreen.main.bounds)
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
      }
    
}
