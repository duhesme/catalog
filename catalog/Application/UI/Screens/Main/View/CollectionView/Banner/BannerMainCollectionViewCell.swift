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
        
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
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
        containerView.backgroundColor = .purple
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
    
    private func makeConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setImage(fromStringURL url: String) {
        guard let imageUrl = URL(string: url) else { return }
        imageView.kf.setImage(with: .network(imageUrl))
    }
    
}
