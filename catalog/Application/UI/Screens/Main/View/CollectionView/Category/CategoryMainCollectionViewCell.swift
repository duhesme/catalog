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
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.layer.cornerRadius = CGFloat(71) / CGFloat(2)
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.text = "Phone"
        label.backgroundColor = .green
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    var icon: UIImage? {
        set {
            iconImageView.image = newValue
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
        containerView.backgroundColor = .red
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
    
    private func makeConstraints() {
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                iconImageView,
                titleLabel
            ])
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .fill
            
            return stackView
        }()
        
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(containerView.snp.width)
        }
    }
    
}
