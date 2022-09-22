//
//  SplitCoordinator.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

final class SplitCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let menuHttpManager = HTTPManager(timeInterval: 0.3, mock: AuthorCommitDataMock())
        let detailHttpManager = DetailManager(timeInterval: 0, mock: DummyMock())
        let splitViewController = SplitComposer.composeWith(menuManager: menuHttpManager, detailManager: detailHttpManager)
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}
