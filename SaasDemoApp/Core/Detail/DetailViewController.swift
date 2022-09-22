//
//  DetailViewController.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

protocol AuthorObjectSelectedDelegate: AnyObject {
    func authorObjectSelected(author: Commit)
}

final class DetailViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        return tableView
    }()
    
    private let headerView = DetailViewHeader()
    
    private var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    // MARK: - Bind ViewModel with Observer
    
    private func bind() {
        viewModel.dataIsLoaded = { [weak self] loaded in
            guard self != nil else { return }
            
            if loaded {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Configure Layouts
    
    private func setupUI() {
        view.backgroundColor = .white
        [headerView, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource
 
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(content: viewModel.indexPerRow(indexPath: indexPath))
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DetailTableViewHeaderView(index: section, delegate: self)
        header.configureView(entry: viewModel.indexPerSection(index: section))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - DetailTableViewHeaderDelegate

extension DetailViewController: DetailTableViewHeaderDelegate {
    func expandCell(index: Int) {
        viewModel.fetchData(index: index, id: viewModel.getFileId(index: index)) { [weak self] result in
            switch result {
            case .success:
                self?.viewModel.expandOrCollapseEntry(index: index)
                UIView.performWithoutAnimation {
                    self?.tableView.reloadSections([index], with: .fade)
                }
            case .failure:
                break
            }
        }
    }
}

// MARK: - AuthorObjectSelectedDelegate

extension DetailViewController: AuthorObjectSelectedDelegate {
    func authorObjectSelected(author: Commit) {
        headerView.author = author
        
        let diffs = author.entries.map { $0.diff }
        let detailFilterManager = DetailManager(timeInterval: author.timeInterval, diffs: diffs)
        viewModel = DetailViewModel(author: author, networkManager: detailFilterManager)
        tableView.reloadData()
    }
}

