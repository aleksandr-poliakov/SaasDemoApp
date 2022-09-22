//
//  LoaderView.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 22.09.2022.
//

import UIKit

final class LoaderActivityIndicatorView: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading(view: UIView) {
        frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self)
        
        startAnimating()
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func stopLoading() {
        stopAnimating()
        removeFromSuperview()
    }
}
