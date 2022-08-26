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
        Category(image: Asset.Assets.Main.Category.phone.image, title: "Phone", isSelected: true),
        Category(image: Asset.Assets.Main.Category.computer.image, title: "Computer", isSelected: false),
        Category(image: Asset.Assets.Main.Category.health.image, title: "Health", isSelected: false),
        Category(image: Asset.Assets.Main.Category.books.image, title: "Books", isSelected: false),
        Category(image: nil, title: "Travel", isSelected: false),
        Category(image: nil, title: "Home", isSelected: false),
        Category(image: nil, title: "Pet", isSelected: false),
        Category(image: nil, title: "Gym", isSelected: false),
        Category(image: nil, title: "Laptop", isSelected: false)
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
    
    private var hotSales: [HomeStoreItem] = []
    private var bestSellers: [BestSellerItem] = []
    
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
        configureAppereance()
        applySnapshot(animatingDifferencies: false)
    }
    
    private func configureAppereance() {
        collectionView.backgroundColor = Asset.Colors.background.color
    }
    
    private func makeConstraints() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateStoreContent(content: StoreContent) {
        hotSales = content.home_store
        bestSellers = content.best_seller
        applySnapshot()
    }
    
}

//MARK: - DataSource configuration
extension MainCollectionView {
    
    func makeMainDataSource() -> MainDataSource {
        let dataSource = MainDataSource(collectionView: collectionView, cellProvider: { [unowned self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            print(indexPath)
            switch section {
            case .categoryHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = Strings.Main.Section.Category.title
                return cell
            case .category:
                let cell = configureCategoryCell(forIndexPath: indexPath)
                return cell
            case .search:
                return collectionView.dequeueReusableCell(withReuseIdentifier: SearchMainCollectionView.identifier, for: indexPath) as? SearchMainCollectionView
            case .hotSalesHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = Strings.Main.Section.HotSales.title
                return cell
            case .banner:
                return configureBannerCell(forIndexPath: indexPath)
            case .bestSellerHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderMainCollectionViewCell.identifier, for: indexPath) as? SectionHeaderMainCollectionViewCell
                cell?.title = Strings.Main.Section.BestSeller.title
                return cell
            case .bestSeller:
                return configureBestSellerCell(forIndexPath: indexPath)
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
        snapshot.appendItems(hotSales, toSection: .banner)
        snapshot.appendItems([MainCollectionItem(id: "bestSellerHeader")], toSection: .bestSellerHeader)
        snapshot.appendItems(bestSellers, toSection: .bestSeller)
        
        mainDataSource.apply(snapshot, animatingDifferences: animatingDifferencies)
    }
    
}

//MARK: - Cell Configuration

extension MainCollectionView {
    
    func configureCategoryCell(forIndexPath indexPath: IndexPath) -> CategoryMainCollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMainCollectionViewCell.identifier, for: indexPath) as? CategoryMainCollectionViewCell
        let index = indexPath.row
        print("Category: \(index)")
        cell?.title = categories[index].title
        cell?.icon = categories[index].image
        cell?.isSelected = categories[index].isSelected
        
        return cell
    }
    
    func configureBannerCell(forIndexPath indexPath: IndexPath) -> BannerMainCollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerMainCollectionViewCell.identifier, for: indexPath) as? BannerMainCollectionViewCell
        cell?.setImage(fromStringURL: hotSales[indexPath.row].picture)
        
        return cell
    }
    
    func configureBestSellerCell(forIndexPath indexPath: IndexPath) -> ProductMainCollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductMainCollectionViewCell.identifier, for: indexPath) as? ProductMainCollectionViewCell
        cell?.setImage(fromStringURL: bestSellers[indexPath.row].picture)
        
        return cell
    }
    
}
