//
//  BedCollectionViewCell.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 10.03.2026.
//

import UIKit

final class BedCollectionViewCell: UICollectionViewCell, ReusableCell {
    static let reuseIdentifier: String = "BedCollectionViewCell"

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupAppearance()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }

    func configure(with image: UIImage) {
        imageView.image = image
    }

    private func setupAppearance() {
        contentView.backgroundColor = .secondarySystemBackground
    }
}
