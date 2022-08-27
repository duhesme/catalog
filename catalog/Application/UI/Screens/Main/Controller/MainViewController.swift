//
//  MainViewController.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//
import UIKit
import Combine

final class MainViewController<View: MainView>: BaseViewController<View> {
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStoreContent()
        
        rootView.events.sink { [weak self] in
            self?.onViewEvents($0)
        }.store(in: &cancellables)
    }
    
    private func loadStoreContent() {
        API.storeContent()
            .print()
            .sink(receiveCompletion: { (completion) in
                    switch completion {
                    case let .failure(error):
                        print("Couldn't get store content: \(error)")
                    case .finished: break
                    }
                }) { [unowned self] storeContent in
                    onAPIUpdate(storeContent: storeContent)
                }.store(in: &cancellables)
    }
    
    private func onAPIUpdate(storeContent: StoreContent) {
        rootView.updateStoreContent(content: storeContent)
    }
    
    private func onViewEvents(_ event: MainViewEvent) {
        switch event {
        case .pullToRefresh:
            loadStoreContent()
        }
    }
    
}
