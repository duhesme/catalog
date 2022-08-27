//
//  SearchMainCollectionView.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import Foundation
import UIKit

final class SearchMainCollectionView: UICollectionViewCell {
    
    class var identifier: String {
        return "searchMainCollectionView"
    }
    
    private let searchView = SearchView()
    private let qrView = QRView()
    
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
        backgroundColor = .clear
        searchView.layer.cornerRadius = 18
        searchView.clipsToBounds = true
        clipsToBounds = true
    }
    
    private func makeConstraints() {
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                searchView,
                qrView
            ])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 11
            stackView.backgroundColor = .clear
            
            return stackView
        }()
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qrView.snp.makeConstraints { make in
            make.width.equalTo(34)
        }
    }
    
}
