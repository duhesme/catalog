//
//  MainCollectionView+Layout.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

extension MainCollectionView {
    
    typealias MainDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    typealias MainSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    enum Section: Int, Hashable, CaseIterable {
        case categoryHeader,
             category,
             search,
             hotSalesHeader,
             banner,
             bestSellerHeader,
             bestSeller
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            if sectionKind == .categoryHeader {
                return self.createSectionHeaderSectionLayout()
            } else if sectionKind == .category {
                return self.createCategorySectionLayout()
            } else if sectionKind == .search {
                return self.createSearchSectionLayout()
            } else if sectionKind == .hotSalesHeader {
                return self.createSectionHeaderSectionLayout()
            } else if sectionKind == .banner {
                return self.createBannerSectionLayout()
            } else if sectionKind == .bestSellerHeader {
                return self.createSectionHeaderSectionLayout()
            } else if sectionKind == .bestSeller {
                return self.createBestSellerGridSectionLayout()
            }
            
            return nil
        }
        
        return layout
    }
    
    func createSectionHeaderSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 17, bottom: 10, trailing: 35)
        
        return section
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
    
    func createSearchSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(34)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 32, bottom: 10, trailing: 37)
        return section
    }
    
    func createBannerSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(182))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(182))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    func createBestSellerGridSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 11)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(227))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
//        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 11)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 7)
        return section
    }
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        collectionView.register(CategoryMainCollectionViewCell.self, forCellWithReuseIdentifier: CategoryMainCollectionViewCell.identifier)
        collectionView.register(SearchMainCollectionView.self, forCellWithReuseIdentifier: SearchMainCollectionView.identifier)
        collectionView.register(SectionHeaderMainCollectionViewCell.self, forCellWithReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier)
        collectionView.register(BannerMainCollectionViewCell.self, forCellWithReuseIdentifier: BannerMainCollectionViewCell.identifier)
        collectionView.register(ProductMainCollectionViewCell.self, forCellWithReuseIdentifier: ProductMainCollectionViewCell.identifier)
        
        return collectionView
    }
    
}
