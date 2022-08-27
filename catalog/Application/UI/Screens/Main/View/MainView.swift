//
//  MainView.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit
import Combine

final class MainView: UIView {
    
    let events = PassthroughSubject<MainViewEvent, Never>()
    
    private let collectionView = MainCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        makeConstraints()
        backgroundColor = .gray
        
        collectionView.pullToRefresh = { [unowned self] in
            events.send(.pullToRefresh)
        }
    }
    
    private func makeConstraints() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateStoreContent(content: StoreContent) {
        collectionView.updateStoreContent(content: content)
    }
    
}
