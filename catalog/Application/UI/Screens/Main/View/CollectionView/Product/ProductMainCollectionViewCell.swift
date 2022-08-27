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
        productView.favoriteButtonPressed = { [weak self] in
            guard let id = self?.id else { return }
            self?.favoriteButtonPressed?(id)
        }
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
    
    var isFavourite: Bool {
        get {
            return productView.isFavourite
        }
        set {
            productView.isFavourite = newValue
        }
    }
    
    var id: Int?
    
    var favoriteButtonPressed: ((_ id: Int) -> Void)?
    
    func setImage(fromStringURL url: String) {
        if let url = URL(string: url) {
            productView.setImage(fromURL: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        makeConstraints()
        configureAppearance()
    }
    
    private func configureAppearance() {
        dropShadow(color: Asset.Colors.Main.Product.shadow.color, opacity: 1, offSet: CGSize(width: 1, height: 1), radius: 3, scale: true)
    }
    
    private func makeConstraints() {
        contentView.addSubview(productView)
        
        productView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
