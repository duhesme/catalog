//
//  HeaderCategoryMainCollectionViewCell.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

final class SectionHeaderMainCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "sectionHeaderMainCollectionViewCell"
    }
    
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 25)
        
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("view all", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(Asset.Colors.Base.orange.color, for: .normal)
        
        return button
    }()
    
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
                titleLabel,
                viewAllButton
            ])
            stackView.axis = .horizontal
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
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
        }
        viewAllButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
        }
    }
    
}
