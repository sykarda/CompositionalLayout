//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Arda Ilgili on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }

    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.register(CollectionRedCell.self, forCellWithReuseIdentifier: CollectionRedCell.identifier)
        collectionView.register(CollectionBlueCell.self, forCellWithReuseIdentifier: CollectionBlueCell.identifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: HeaderCell.identifier, withReuseIdentifier: HeaderCell.identifier)

        let layout = UICollectionViewCompositionalLayout { index, _ in
            switch index {
            case 0:
                return self.topHorizontalSection()
            case 1:
                return self.verticalSection()
            case 2:
                return self.bottomHorizontalSection()
            default:
                return nil
            }
        }

        collectionView.collectionViewLayout = layout
    }

    private func topHorizontalSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets.leading = 16.0
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 30.0
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    private func verticalSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let groupItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [groupItem])
        group.contentInsets.top = 10
        group.contentInsets.leading = 16.0
        group.contentInsets.trailing = 16.0
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 30.0
        let supplementaryItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(20.0))

        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: supplementaryItemSize,
                elementKind: HeaderCell.identifier,
                alignment: .topLeading,
                absoluteOffset: CGPoint(x: 16, y: 0)
            )
        ]
        return section
    }

    private func bottomHorizontalSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets.leading = 16.0
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 30.0
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionRedCell.identifier, for: indexPath) as? CollectionRedCell else { return UICollectionViewCell() }

            cell.configure()
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionBlueCell.identifier, for: indexPath) as? CollectionBlueCell else { return UICollectionViewCell() }

            cell.configure()
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionRedCell.identifier, for: indexPath) as? CollectionRedCell else { return UICollectionViewCell() }

            cell.configure()
            return cell
        default:
            return UICollectionViewCell()
        }

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderCell.identifier, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return UICollectionReusableView() }
        return cell
    }
}

