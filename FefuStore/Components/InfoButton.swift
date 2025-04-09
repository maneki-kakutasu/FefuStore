//
//  InfoButton.swift
//  FefuStore
//
//  Created by Андрей Германович on 05.04.2025.
//

import UIKit

class InfoButton: UIButton {
    
    // MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = Assets.Icons.infoButton
        return image
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
        addSubview(image)
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
