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
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "199"
        label.font = FontFamily.MarkPro.regular.font(size: 10)
        label.textColor = Asset.Colors.Main.Product.priceFont.color
        return label
    }()
    
    private let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "199"
        label.font = FontFamily.MarkPro.medium.font(size: 16)
        label.textColor = Asset.Colors.Main.Product.discountPriceFont.color
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = FontFamily.MarkPro.regular.font(size: 10)
        return label
    }()
    
    private let likeButton: BounceButton = {
        let button = BounceButton()
        
        button.backgroundColor = .white
        button.setImage(Asset.Assets.Main.Product.heart.image, for: .normal)
        button.layer.cornerRadius = CGFloat(25) / CGFloat(2)
        
        button.dropShadow(color: Asset.Colors.Main.Product.likeButtonShadow.color, opacity: 1, offSet: CGSize(width: 1, height: 1), radius: 3, scale: true)
        
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
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: newValue!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            attributeString.addAttribute(NSAttributedString.Key.font, value: FontFamily.MarkPro.regular.font(size: 10), range: NSRange(location: 0, length: attributeString.length))
            
            priceLabel.attributedText = attributeString
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
    
    var isFavourite: Bool {
        get {
            if likeButton.imageView?.image == Asset.Assets.Main.Product.selectedHeart.image {
                return true
            } else {
                return false
            }
        }
        set {
            if newValue == true {
                likeButton.setImage(Asset.Assets.Main.Product.selectedHeart.image, for: .normal)
            } else {
                likeButton.setImage(Asset.Assets.Main.Product.heart.image, for: .normal)
            }
        }
    }
    
    var favoriteButtonPressed: (() -> Void)?
    
    func setImage(fromURL url: URL) {
        imageView.kf.setImage(with: .network(url))
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
        
        likeButton.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
    }
    
    private func configureAppereance() {
        backgroundColor = .white
        
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func makeConstraints() {
        let contentView = UIView()
        
        let imageContainer = UIView()
        let priceContainer = UIView()
        let titleContainer = UIView()
        
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
        priceContainer.addSubview(discountPriceLabel)
        priceContainer.addSubview(priceLabel)
        titleContainer.addSubview(titleLabel)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
            make.height.equalTo(20)
        }
        discountPriceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(21)
            make.centerY.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalTo(discountPriceLabel.snp.right).offset(7)
        }
        
        titleContainer.snp.makeConstraints { make in
            make.height.equalTo(26)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.left.equalToSuperview().inset(21)
        }
    }
    
    @objc private func favouriteButtonPressed() {
        favoriteButtonPressed?()
        isFavourite = !isFavourite
    }
    
}
