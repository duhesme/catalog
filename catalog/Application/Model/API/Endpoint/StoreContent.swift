//
//  Store.swift
//  catalog
//
//  Created by Никита Владимирович on 26.08.2022.
//

import Combine
import Foundation

extension API {
    
    static func storeContent() -> AnyPublisher<StoreContent, Error> {
        let request = URLRequest(url: base.appendingPathComponent("v3/654bd15e-b121-49ba-a588-960956b15175"))
        
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}

struct StoreContent: Decodable {
    let home_store: [HomeStoreItem]
    let best_seller: [BestSellerItem]
}

struct HomeStoreItem: Decodable {
    let id: Int
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let is_buy: Bool
}

struct BestSellerItem: Decodable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
}
