//
//  BedDetailViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 12.03.2026.
//

import UIKit

final class BedDetailViewController: UIViewController {
    let bed: Bed

    init(bed: Bed) {
        self.bed = bed
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var textView: UILabel = {
        let textView = UILabel()
        textView.text = "\(bed.title)"

        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 100),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

#Preview {
    BedDetailViewController(bed: Bed.beds.first!)
}
