//
//  CollectionViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 10.03.2026.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    // MARK: Properties

    private let beds: [Bed] = Bed.beds

    // MARK: Subviews

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        beds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        return cell
    }
}
