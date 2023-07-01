//
//  PaddingView.swift
//  uitableview_uicollectionview
//
//  Created by 佐々木一樹 on 2023/07/01.
//

import UIKit

class PaddingView: UIView {
    private let padding: CGFloat

    init(padding: CGFloat) {
        self.padding = padding
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        padding = 0
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }

    func addPaddedSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)

        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ])
    }
}
