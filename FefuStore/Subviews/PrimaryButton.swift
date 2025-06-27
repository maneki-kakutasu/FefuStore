//
//  ToCartButton.swift
//  FefuStore
//
//  Created by Андрей Германович on 03.04.2025.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    
    // MARK: - UI Elements
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "В корзину 14990 Р"
        label.textAlignment = .center
        label.textColor = Assets.Colors.textSecondaryColor
        label.font = UIFont(name: "SFProText-Semibold", size: 15)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Common Init
    
    private func commonInit() {
        backgroundColor = Assets.Colors.buttonColor
        layer.cornerRadius = 10
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
