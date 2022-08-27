//
//  MainModel.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import Foundation
import UIKit

struct MainCollectionItem: Hashable {
    let id: String
}

struct Category: Hashable {
    let image: UIImage?
    let title: String
    var isSelected: Bool
}

struct SearchQuery: Hashable {
    let query: String
}
