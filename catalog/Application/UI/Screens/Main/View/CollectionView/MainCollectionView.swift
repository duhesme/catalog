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
    
    private let mainModel: [MainModel] = [
        MainModel(title: "1"),
        MainModel(title: "2"),
        MainModel(title: "3"),
        MainModel(title: "4"),
        MainModel(title: "5")
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
        let dataSource = MainDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, product) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            print(indexPath)
            switch section {
            case .category:
                return collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMainCollectionViewCell.identifier, for: indexPath) as? CategoryMainCollectionViewCell
            }
        })
        
        return dataSource
    }
    
    func applySnapshot(animatingDifferencies: Bool = true) {
        var snapshot = MainSnapshot()
        snapshot.appendSections([
            Section.category
        ])
        snapshot.appendItems(mainModel, toSection: Section.category)
        
        mainDataSource.apply(snapshot, animatingDifferences: animatingDifferencies)
    }
    
}
