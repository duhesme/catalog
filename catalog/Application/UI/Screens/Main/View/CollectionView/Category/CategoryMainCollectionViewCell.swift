//
//  CategoryMainCollectionViewCell.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

final class CategoryMainCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "categoryMainCollectionViewCell"
    }
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.baseOrange.color
        view.layer.cornerRadius = CGFloat(71) / CGFloat(2)
        
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Asset.Assets.Main.Category.question.image
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.text = "Phone"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    override var isSelected: Bool {
        set {
            if newValue {
                iconContainer.backgroundColor = Asset.Colors.baseOrange.color
            } else {
                iconContainer.backgroundColor = .white
            }
        }
        get {
            if iconContainer.backgroundColor == Asset.Colors.baseOrange.color {
                return true
            } else {
                return false
            }
        }
    }
    
    var icon: UIImage? {
        set {
            if newValue == nil {
                iconImageView.image = Asset.Assets.Main.Category.question.image
            } else {
                iconImageView.image = newValue
            }
        }
        get {
            return iconImageView.image
        }
    }
    
    var title: String? {
        set {
            titleLabel.text = newValue
        }
        get {
            return titleLabel.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    private let containerView = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        setUpAppearance()
        makeConstraints()
    }
    
    private func setUpAppearance() {
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
    
    private func makeConstraints() {
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                iconContainer,
                titleLabel
            ])
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .fill
            
            return stackView
        }()
        
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        iconContainer.addSubview(iconImageView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconContainer.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(containerView.snp.width)
        }
        iconImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
}
