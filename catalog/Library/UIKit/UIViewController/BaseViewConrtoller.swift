//
//  BaseViewConrtoller.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
    
    var rootView: View { view as! View }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = View.loadView()
    }
    
}
