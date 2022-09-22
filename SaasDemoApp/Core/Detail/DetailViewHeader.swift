//
//  DetailViewHeader.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

final class DetailViewHeader: UIView {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: .add)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
  
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let hashLabel = UILabel()
    private lazy var contentVerticalStackView: UIStackView = {
        $0.alignment = .fill
        $0.spacing = 4
        $0.distribution = .fill
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [nameLabel, dateLabel, hashLabel]))
    
    private let subjectLabel = UILabel()
    
    private var subjectContainerView = UIView()
    
    var author: Author? {
        didSet {
            configureAuthor(author: author)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let topLineView = UIView()
        let bottomLineView = UIView()
        
        [topLineView, bottomLineView].forEach {
            $0.backgroundColor = .black
        }
        
        [topLineView, bottomLineView, subjectLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            subjectContainerView.addSubview($0)
        }
        
        [avatarImageView, contentVerticalStackView, subjectContainerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            contentVerticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            contentVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            contentVerticalStackView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            subjectContainerView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            subjectContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subjectContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subjectContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topLineView.topAnchor.constraint(equalTo: subjectContainerView.topAnchor),
            topLineView.heightAnchor.constraint(equalToConstant: 1),
            bottomLineView.bottomAnchor.constraint(equalTo: subjectContainerView.bottomAnchor),
            bottomLineView.heightAnchor.constraint(equalTo: topLineView.heightAnchor),
            topLineView.leadingAnchor.constraint(equalTo: subjectContainerView.leadingAnchor),
            topLineView.trailingAnchor.constraint(equalTo: subjectContainerView.trailingAnchor),
            bottomLineView.leadingAnchor.constraint(equalTo: subjectContainerView.leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: subjectContainerView.trailingAnchor),
            
            subjectLabel.leadingAnchor.constraint(equalTo: subjectContainerView.leadingAnchor, constant: 6),
            subjectLabel.topAnchor.constraint(equalTo: subjectContainerView.topAnchor, constant: 12),
            subjectLabel.trailingAnchor.constraint(equalTo: subjectContainerView.trailingAnchor, constant: -6),
            subjectLabel.bottomAnchor.constraint(equalTo: subjectContainerView.bottomAnchor, constant: -12)
        ])
    }
    
    private func configureAuthor(author: Author?) {
        guard let author = author else { return }
        
        nameLabel.text = "Author: \(author.name)"
        dateLabel.text = "Author Date: \(author.date.formatted())"
        hashLabel.text = "Commit Hash: \(author.commitHash)"
        subjectLabel.text = "\(author.subject)"
    }
}
