//
//  QRView.swift
//  catalog
//
//  Created by Никита Владимирович on 27.08.2022.
//

import UIKit

final class QRView: UIView {
    
    private let contentView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Search.qrIcon.image
        
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
        contentView.backgroundColor = Asset.Colors.Base.orange.color
        contentView.layer.cornerRadius = 17
    }
    
    private func makeConstraints() {
        addSubview(contentView)
        contentView.addSubview(imageView)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(15)
        }
    }
    
}
