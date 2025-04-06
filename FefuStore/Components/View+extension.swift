//
//  View+extension.swift
//  FefuStore
//
//  Created by Андрей Германович on 05.04.2025.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor = .black,
                    opacity: Float = 0.5,
                    radius: CGFloat = 8,
                    offset: CGSize = CGSize(width: 0, height: 0)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
}
