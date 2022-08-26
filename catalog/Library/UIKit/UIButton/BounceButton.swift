//
//  BounceButton.swift
//  catalog
//
//  Created by Никита Владимирович on 26.08.2022.
//

import UIKit

class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        }
        
        super.touchesBegan(touches, with: event)
    }
    
}
