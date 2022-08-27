//
//  BannerMainCollectionViewCell.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit
import Kingfisher

final class BannerMainCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "bannerMainCollectionViewCell"
    }
    
    private let containerView = UIView()
    private var newView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.SFProDisplay.medium.font(size: 25)
        label.textColor = .white
        label.text = "iPhone 12"

        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.SFProDisplay.regular.font(size: 11)
        label.textColor = .white
        label.text = "Súper. Mega. Rápido."
        
        return label
    }()
    
    private let newLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.SFProDisplay.medium.font(size: 10)
        label.textColor = .white
        label.text = "New"
        
        return label
    }()
    
    private let buyNowButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = FontFamily.SFProDisplay.medium.font(size: 11)
        button.setTitleColor(Asset.Colors.Main.Banner.buyNowFont.color, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.setTitle("Buy now", for: .normal)
        
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    var isNew: Bool? {
        get {
            return !newView.isHidden
        }
        set {
            if newValue == nil || newValue == false {
                newView.isHidden = true
            } else {
                newView.isHidden = false
            }
        }
    }
    
    var isBuy: Bool {
        get {
            !buyNowButton.isHidden
        }
        set {
            buyNowButton.isHidden = !newValue
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var subtitle: String? {
        get {
            return subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        setUpAppearance()
        makeConstraints()
    }
    
    private func setUpAppearance() {
        containerView.backgroundColor = .purple
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
    
    private func makeConstraints() {
        let newViewContainer = UIView()
        newView = UIView()
        newView.layer.cornerRadius = CGFloat(27) / CGFloat(2)
        newView.backgroundColor = Asset.Colors.Base.orange.color
        
        let buyNowContainer = UIView()
        buyNowContainer.backgroundColor = .clear
        
        let titleStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                titleLabel,
                subtitleLabel
            ])
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 5
            stackView.backgroundColor = .clear
            
            return stackView
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                newViewContainer,
                titleStackView,
                buyNowContainer
            ])
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.backgroundColor = .clear
            stackView.setCustomSpacing(18, after: newViewContainer)
            stackView.setCustomSpacing(26, after: titleStackView)
            
            return stackView
        }()
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(stackView)
        newViewContainer.addSubview(newView)
        newView.addSubview(newLabel)
        buyNowContainer.addSubview(buyNowButton)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(23)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(18)
        }
        
        newViewContainer.snp.makeConstraints { make in
            make.height.equalTo(27)
        }
        newView.snp.makeConstraints { make in
            make.width.height.equalTo(27)
        }
        newLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        buyNowContainer.snp.makeConstraints { make in
            make.height.equalTo(23)
        }
        
        buyNowButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(98)
        }
    }
    
    func setImage(fromStringURL url: String) {
        guard let imageUrl = URL(string: url) else { return }
        imageView.kf.setImage(with: .network(imageUrl))
    }
    
}
