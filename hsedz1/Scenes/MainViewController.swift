//
//  MainViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 24.01.2026.
//

import UIKit

class MainViewController: UIViewController {
    private let beds: [Bed] = Bed.beds

    private var currentBedIndex: Int = 0

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "which bed are you sleeping the hardest?"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2

        return label
    }()

    private let bedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .auroraBorealis)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let bedTitle: UILabel = {
        let label = UILabel()

        label.text = "Aurora Borealis"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.setNextBedImage()
            }, for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.setPreviousBedImage()
            }, for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private func setPreviousBedImage() {
        currentBedIndex -= 1
        if currentBedIndex < 0 {
            currentBedIndex = beds.count - 1
        }
        updateBed()
    }

    private func setNextBedImage() {
        currentBedIndex += 1
        if currentBedIndex > beds.count - 1 {
            currentBedIndex = 0
        }
        updateBed()
    }

    private func updateBed() {
        bedTitle.text = beds[currentBedIndex].title
        bedImage.image = UIImage(resource: beds[currentBedIndex].image)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])

        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        view.addSubview(bedImage)
        NSLayoutConstraint.activate([
            bedImage.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
            bedImage.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -20),
            bedImage.heightAnchor.constraint(equalToConstant: 300),
            bedImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        view.addSubview(bedTitle)
        NSLayoutConstraint.activate([
            bedTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bedTitle.bottomAnchor.constraint(equalTo: bedImage.topAnchor, constant: -20),
        ])
    }
}
