//
//  LocationMainCollectionViewCell.swift
//  catalog
//
//  Created by Никита Владимирович on 27.08.2022.
//

import UIKit

final class LocationMainCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "locationMainCollectionViewCell"
    }
    
    private let locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Location.location.image
        
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Zihuatanejo, Gro"
        label.font = FontFamily.MarkPro.medium.font(size: 15)
        label.textColor = Asset.Colors.Base.textColor.color
        
        return label
    }()
    
    private let dropdownIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Location.downArrow.image
        
        return imageView
    }()
    
    private let filerIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Location.filter.image
        
        return imageView
    }()
    
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
        
    }
    
    private func makeConstraints() {
        let locationIconContainer = UIView()
        let dropdownIconContainer = UIView()
        
        let locationStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                locationIconContainer,
                locationLabel,
                dropdownIconContainer
            ])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.backgroundColor = .clear
            
            stackView.setCustomSpacing(11, after: locationIconContainer)
            stackView.setCustomSpacing(8, after: locationLabel)
            
            return stackView
        }()
        
        contentView.addSubview(locationStackView)
        locationIconContainer.addSubview(locationIconImageView)
        dropdownIconContainer.addSubview(dropdownIconImageView)
        contentView.addSubview(filerIconImageView)
        
        locationStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        locationIconContainer.snp.makeConstraints { make in
            make.width.equalTo(12)
        }
        
        dropdownIconContainer.snp.makeConstraints { make in
            make.width.equalTo(10)
        }
        
        locationIconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(12)
            make.height.equalTo(15)
        }
        
        dropdownIconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(10)
            make.height.equalTo(5)
        }
        
        filerIconImageView.snp.makeConstraints { make in
            make.width.equalTo(11)
            make.height.equalTo(13)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(35)
        }
    }
    
}

