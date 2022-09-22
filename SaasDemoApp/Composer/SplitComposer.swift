//
//  SplitComposer.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

final class SplitComposer {
    private init() {}

    static func composeWith(menuManager: HTTPManagerProtocol, detailManager: DetailFilterManagerProtocol) -> SplitViewController {
        let menuViewController =  MenuViewController(viewModel: MenuViewModel(networkManager: menuManager))
        let detailViewController = DetailViewController(viewModel: DetailViewModel(author: DummyAuthor(), networkManager: detailManager))
        menuViewController.delegate = detailViewController
        let splitViewController = SplitViewController(viewControllers: [UINavigationController(rootViewController: menuViewController), detailViewController])
        splitViewController.preferredDisplayMode = .automatic
        return splitViewController
    }
}
