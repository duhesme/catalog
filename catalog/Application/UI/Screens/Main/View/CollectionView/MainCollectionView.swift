//
//  MainCollectionView.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit
import SnapKit

final class MainCollectionView: UIView {
    
    private var collectionView: UICollectionView!
    
    lazy private var mainDataSource = makeMainDataSource()

    private let categories: [Category] = [
        Category(image: Asset.Assets.Main.Catalog.phone.image, title: "Phone"),
        Category(image: Asset.Assets.Main.Catalog.computer.image, title: "Computer"),
        Category(image: Asset.Assets.Main.Catalog.health.image, title: "Health"),
        Category(image: Asset.Assets.Main.Catalog.books.image, title: "Books"),
        Category(image: nil, title: "Travel"),
        Category(image: nil, title: "Home"),
        Category(image: nil, title: "Pet"),
        Category(image: nil, title: "Gym"),
        Category(image: nil, title: "Laptop")
    ]
    
    private let banners: [Banner] = [
        Banner(id: 0, imageURL: nil),
        Banner(id: 1, imageURL: nil),
        Banner(id: 2, imageURL: nil),
        Banner(id: 3, imageURL: nil),
        Banner(id: 4, imageURL: nil),
        Banner(id: 5, imageURL: nil)
    ]
    
    private let products: [Product] = [
        Product(id: 0, title: "iPhone", picture: nil),
        Product(id: 1, title: "iPhone", picture: nil),
        Product(id: 2, title: "iPhone", picture: nil),
        Product(id: 3, title: "iPhone", picture: nil),
        Product(id: 4, title: "iPhone", picture: nil),
        Product(id: 5, title: "iPhone", picture: nil)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        collectionView = createCollectionView()
        makeConstraints()
        applySnapshot(animatingDifferencies: false)
    }
    
    private func makeConstraints() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

//MARK: - DataSource configuration
extension MainCollectionView {
    
    func makeMainDataSource() -> MainDataSource {
        let dataSource = MainDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            print(indexPath)
            switch section {
            case .categoryHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = "Select category"
                return cell
            case .category:
                let cell = self.configureCategoryCell(forIndexPath: indexPath)
                return cell
            case .search:
                return collectionView.dequeueReusableCell(withReuseIdentifier: SearchMainCollectionView.identifier, for: indexPath) as? SearchMainCollectionView
            case .hotSalesHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = "Hot sales"
                return cell
            case .banner:
                return collectionView.dequeueReusableCell(withReuseIdentifier: BannerMainCollectionViewCell.identifier, for: indexPath) as? BannerMainCollectionViewCell
            case .bestSellerHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = "Best seller"
                return cell
            case .bestSeller:
                return collectionView.dequeueReusableCell(withReuseIdentifier: ProductMainCollectionViewCell.identifier, for: indexPath) as? ProductMainCollectionViewCell
            }
        })
        
        return dataSource
    }
    
    func applySnapshot(animatingDifferencies: Bool = true) {
        var snapshot = MainSnapshot()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems([MainCollectionItem(id: "catalogHeader")], toSection: .categoryHeader)
        snapshot.appendItems(categories, toSection: .category)
        snapshot.appendItems([SearchQuery(query: "")], toSection: .search)
        snapshot.appendItems([MainCollectionItem(id: "hotSalesHeader")], toSection: .hotSalesHeader)
        snapshot.appendItems(banners, toSection: .banner)
        snapshot.appendItems([MainCollectionItem(id: "bestSellerHeader")], toSection: .bestSellerHeader)
        snapshot.appendItems(products, toSection: .bestSeller)
        
        mainDataSource.apply(snapshot, animatingDifferences: animatingDifferencies)
    }
    
}

//MARK: - Cell Configuration

extension MainCollectionView {
    
    func configureCategoryCell(forIndexPath indexPath: IndexPath) -> CategoryMainCollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMainCollectionViewCell.identifier, for: indexPath) as? CategoryMainCollectionViewCell
        
        let index = indexPath.row
        cell?.title = categories[index].title
        cell?.icon = categories[index].image
        
        return cell
    }
    
}
