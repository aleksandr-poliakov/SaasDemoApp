//
//  ViewController.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

class MenuViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        return tableView
    }()
    
    private let viewModel: MenuViewModel
    weak var delegate: AuthorObjectSelectedDelegate?
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadItems()
        bind()
    }

    // MARK: - Configure Layout
    
    private func setupUI() {
        title = "Menu"
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Load items from API
    
    private func loadItems() {
        viewModel.fetchData()
    }
    
    // MARK: - Bind ViewModel with Observer
    
    private func bind() {
        viewModel.dataIsLoaded = { [weak self] loaded in
            guard self != nil else { return }
            
            if loaded {
                self?.tableView.reloadData()
                if let object = self?.viewModel.indexPerItem(index: 0) {
                    self?.delegate?.authorObjectSelected(author: object)
                }
            }
        }
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(author: viewModel.indexPerItem(index: indexPath.row))
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.authorObjectSelected(author: viewModel.indexPerItem(index: indexPath.row))
    }
}
