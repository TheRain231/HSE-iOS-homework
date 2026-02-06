//
//  SecondViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 06.02.2026.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func setName(_ name: String)
}

final class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?

    private let textField: UITextField = {
        let textField = UITextField()

        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Готово", for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.sendName()
            },
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private func sendName() {
        guard let text = textField.text else { return }
        delegate?.setName(text)
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 220),
        ])

        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
