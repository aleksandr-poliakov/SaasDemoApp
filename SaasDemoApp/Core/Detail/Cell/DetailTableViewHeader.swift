//
//  DetailTableViewHeader.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

protocol DetailTableViewHeaderDelegate: AnyObject {
    func expandCell(index: Int)
}

final class DetailTableViewHeaderView: UIView {
    
    private let statusLabel = UILabel()
    private let fileNameLabel = UILabel()
    private lazy var arrowImageView: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "right_chevron_icon.png"), for: .normal)
        button.tintColor = .blue
        return button
    }()
    private let index: Int
    private weak var delegate: DetailTableViewHeaderDelegate?
    
    private var isExpand: Bool = false {
        didSet {
            if isExpand {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                }
            }
        }
    }
    
    init(index: Int, delegate: DetailTableViewHeaderDelegate?) {
        self.index = index
        self.delegate = delegate
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        statusLabel.textColor = .gray
        [arrowImageView, statusLabel, fileNameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            arrowImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            arrowImageView.heightAnchor.constraint(equalToConstant: 10),
            arrowImageView.widthAnchor.constraint(equalToConstant: 10),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: 12),
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            fileNameLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 6),
            fileNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            fileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
    }
    
    func configureView(entry: ChangesetEntry) {
        statusLabel.text = "\(entry.status):"
        fileNameLabel.text = entry.fileName
        isExpand = entry.isExpand
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.expandCell(index: index)
    }
}
