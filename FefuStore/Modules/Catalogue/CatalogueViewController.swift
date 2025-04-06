//
//  ViewController.swift
//  FefuStore
//
//  Created by Андрей Германович on 06.04.2025.
//

import UIKit
import SnapKit

class CatalogueViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var button: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Нажми"
        configuration.baseBackgroundColor = Assets.Colors.buttonColor
        configuration.cornerStyle = .fixed
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    // MARK: - Methods
    
    @objc private func buttonTapped() {
        let viewController = ProductViewController()
        viewController.modalPresentationStyle = .pageSheet
        present(viewController, animated: true)
    }
    
    // MARK: - Common Init
    
    private func commonInit() {
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20) // Прижимаем к низу с отступом
            make.height.equalTo(50)
        }
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}
