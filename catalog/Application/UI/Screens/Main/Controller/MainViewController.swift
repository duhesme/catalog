//
//  MainViewController.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//
import UIKit
import Combine

final class MainViewController<View: MainView>: BaseViewController<View> {
    
    private var storeContent: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeContent?.cancel()
        storeContent = API.storeContent()
            .print()
            .sink(receiveCompletion: { (completion) in
                    switch completion {
                    case let .failure(error):
                        print("Couldn't get store content: \(error)")
                    case .finished: break
                    }
                }) { [unowned self] storeContent in
                    onAPIUpdate(storeContent: storeContent)
                }
    }
    
    private func onAPIUpdate(storeContent: StoreContent) {
        rootView.updateStoreContent(content: storeContent)
    }
    
}
