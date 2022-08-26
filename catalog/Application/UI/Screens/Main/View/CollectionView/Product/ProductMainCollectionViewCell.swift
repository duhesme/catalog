//
//  ProductMainCollectionViewCell.swift
//  catalog
//
//  Created by Никита Владимирович on 26.08.2022.
//

import UIKit

final class ProductMainCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "productMainCollectionViewCell"
    }
    
    private let productView: ProductView = {
        let productView = ProductView()
        return productView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    var title: String? {
        get {
            productView.title
        }
        set {
            productView.title = newValue
        }
    }
    
    var price: String? {
        get {
            productView.price
        }
        set {
            productView.price = newValue
        }
    }
    
    var discountPrice: String? {
        get {
            productView.discountPrice
        }
        set {
            productView.discountPrice = newValue
        }
    }
    
    func setImage(fromURL url: URL) {
        productView.setImage(fromURL: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        makeConstraints()
    }
    
    private func makeConstraints() {
        contentView.addSubview(productView)
        
        productView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}