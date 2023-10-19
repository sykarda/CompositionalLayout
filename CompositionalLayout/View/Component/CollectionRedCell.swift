//
//  CollectionCell.swift
//  CompositionalLayout
//
//  Created by Arda Ilgili on 18.10.2023.
//

import UIKit

class CollectionRedCell: UICollectionViewCell {
    static let identifier = "CollectionRedCell"

    func configure() {
        contentView.backgroundColor = .red
    }
}
