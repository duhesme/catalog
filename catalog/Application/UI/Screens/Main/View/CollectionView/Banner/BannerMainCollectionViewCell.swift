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
