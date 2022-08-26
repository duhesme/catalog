//
//  ProductView.swift
//  catalog
//
//  Created by Никита Владимирович on 26.08.2022.
//

import UIKit

final class ProductView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "199"
        label.backgroundColor = .red
        return label
    }()
    
    private let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "199"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let likeButton: BounceButton = {
        let button = BounceButton()
        button.backgroundColor = .white
        button.setImage(Asset.Assets.Main.Product.heart.image, for: .normal)
        button.layer.cornerRadius = CGFloat(25) / CGFloat(2)
        return button
    }()
    
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var price: String? {
        get {
            priceLabel.text
        }
        set {
            priceLabel.text = newValue
        }
    }
    
    var discountPrice: String? {
        get {
            discountPriceLabel.text
        }
        set {
            discountPriceLabel.text = newValue
        }
    }
    
    func setImage(fromURL url: URL) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        configureAppereance()
        makeConstraints()
    }
    
    private func configureAppereance() {
        backgroundColor = .brown
        
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func makeConstraints() {
        let contentView = UIView()
        
        let imageContainer = UIView()
        let priceContainer = UIView()
        let titleContainer = UIView()
        
        imageContainer.backgroundColor = .gray
        priceContainer.backgroundColor = .blue
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                imageContainer,
                priceContainer,
                titleContainer
            ])
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 0
            return stackView
        }()
        
        addSubview(contentView)
        contentView.addSubview(stackView)
        imageContainer.addSubview(imageView)
        imageContainer.addSubview(likeButton)
        priceContainer.addSubview(priceLabel)
        priceContainer.addSubview(discountPriceLabel)
        titleContainer.addSubview(titleLabel)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageContainer.snp.makeConstraints { make in
            make.height.equalTo(imageContainer.snp.width).multipliedBy(0.9)
        }
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.top.equalToSuperview().inset(6)
            make.right.equalToSuperview().inset(15)
        }
        
        priceContainer.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
        discountPriceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalTo(priceLabel.snp.right)
        }
        
        titleContainer.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
    }
    
}
