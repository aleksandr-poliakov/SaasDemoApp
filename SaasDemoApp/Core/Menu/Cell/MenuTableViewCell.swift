//
//  MenuTableViewCell.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: .add)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
  
    private let hashLabel = UILabel()
    private let subjectLabel = UILabel()
    private lazy var contentHorizontalStackView: UIStackView = {
        $0.alignment = .fill
        $0.spacing = 4
        $0.distribution = .fill
        $0.axis = .horizontal
        return $0
    }(UIStackView(arrangedSubviews: [hashLabel, subjectLabel]))
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [avatarImageView, nameLabel, contentHorizontalStackView, dateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            contentHorizontalStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 6),
            contentHorizontalStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            contentHorizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            
        ])
    }
    
    func configureCell(author: Commit) {
        nameLabel.text = author.name
        dateLabel.text = author.date.formatted()
        hashLabel.text = author.commitHash
        subjectLabel.text = author.subject
    }
}
