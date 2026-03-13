//
//  GeoViewController.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 13.03.2026.
//

import UIKit

final class GeoViewController: UIViewController {
    var geoInfo: Geo = .init()
    let client: NetworkClient = .init()

    private let geotitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()

        Task {
            await fetchGeoInfo()
        }
    }

    private func setupUI() {
        view.addSubview(geotitle)

        NSLayoutConstraint.activate([
            geotitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geotitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            geotitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            geotitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    @MainActor
    private func fetchGeoInfo() async {
        do {
            geoInfo = try await client.request(.geo)
            print(geoInfo)
            geotitle.text = "\(geoInfo.ip) \(geoInfo.city)"
        } catch {
            print("didn't fetch geo info: \(error)")
        }
    }
}
