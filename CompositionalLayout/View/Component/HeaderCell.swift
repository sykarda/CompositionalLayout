//
//  HeaderCell.swift
//  CompositionalLayout
//
//  Created by Arda Ilgili on 19.10.2023.
//

import UIKit

class HeaderCell: UICollectionReusableView {

    static let identifier = "HeaderCell"

    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Vertical Section"
        return temp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("Not exist")
    }

    private func configure() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
