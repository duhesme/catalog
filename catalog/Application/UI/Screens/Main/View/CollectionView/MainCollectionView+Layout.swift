//
//  MainCollectionView+Layout.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

extension MainCollectionView {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            return nil
        }
        
        return layout
    }
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }
    
}
