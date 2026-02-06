//
//  FirstViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 06.02.2026.
//

import UIKit

final class FirstViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "Hello!"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var inputButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Ввод имени", for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.openSecondScreen()
            },
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private func openSecondScreen() {
        let controller = SecondViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
        ])

        view.addSubview(inputButton)
        NSLayoutConstraint.activate([
            inputButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            inputButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func setName(_ name: String) {
        titleLabel.text = "Hello, \(name)!"
    }
}
