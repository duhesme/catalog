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
        backgroundColor = .green
    }
    
    private func makeConstraints() {
        addSubview(searchView)
        
        searchView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
