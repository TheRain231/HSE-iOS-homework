//
//  CollectionViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 10.03.2026.
//

import Foundation
import UIKit

final class CollectionViewController: UIViewController {
    // MARK: Properties

    private let beds: [Bed] = Bed.beds

    // MARK: Subviews

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(BedCollectionViewCell.self, forCellWithReuseIdentifier: BedCollectionViewCell.reuseIdentifier)
        return collectionView
    }()

    // MARK: Methods

    private func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        beds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BedCollectionViewCell.reuseIdentifier, for: indexPath) as! BedCollectionViewCell

        let image = UIImage(resource: beds[indexPath.item].image)
        cell.configure(with: image)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: width)
    }
}
