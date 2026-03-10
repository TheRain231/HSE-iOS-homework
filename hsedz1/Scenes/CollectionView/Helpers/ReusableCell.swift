//
//  ReusableCell.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 10.03.2026.
//

protocol ReusableCell: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
