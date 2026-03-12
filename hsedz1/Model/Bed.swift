//
//  Bed.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 24.01.2026.
//

import UIKit

struct Bed {
    let title: String
    let image: ImageResource
}

extension Bed {
    static let beds: [Bed] = [
        .init(title: "Aurora Borealis", image: .auroraBorealis),
        .init(title: "Beach", image: .beach),
        .init(title: "City", image: .city),
        .init(title: "Garden", image: .garden),
        .init(title: "Gothic", image: .gothic),
        .init(title: "Library", image: .library),
        .init(title: "Rainforest", image: .rainforest),
        .init(title: "Zen", image: .zen),
    ]
}
