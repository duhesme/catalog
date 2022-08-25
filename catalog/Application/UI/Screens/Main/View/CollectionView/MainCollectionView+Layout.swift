//
//  MainCollectionView+Layout.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

extension MainCollectionView {
    
    typealias MainDataSource = UICollectionViewDiffableDataSource<Section, MainModel>
    typealias MainSnapshot = NSDiffableDataSourceSnapshot<Section, MainModel>
    
    enum Section: Int, Hashable, CaseIterable {
        case category
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            
            if sectionKind == .category {
                return self.createCategorySectionLayout()
            }
            
            return nil
        }
        
        return layout
    }
    
    func createCategorySectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(71), heightDimension: .estimated(93))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 23
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0)
        
        return section
    }
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        collectionView.register(CategoryMainCollectionViewCell.self, forCellWithReuseIdentifier: CategoryMainCollectionViewCell.identifier)
        
        return collectionView
    }
    
}
