//
//  ErrorViewController.swift
//  FefuStore
//
//  Created by Андрей Германович on 11.04.2025.
//

import UIKit
import SnapKit

class ErrorViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let errorImage: UIImageView = {
        let errorImage = UIImageView()
        errorImage.image = Assets.Images.errorSneakers
        errorImage.contentMode = .scaleAspectFit
        return errorImage
    }()
}

extension ErrorViewController {
    func commonInit() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(errorImage)
        errorImage.snp.makeConstraints {make in
            make.left.equalTo(view.snp.left).offset(50)
            make.centerY.equalTo(self.view)
            make.width.height.equalTo(100)
        }
    }
}
