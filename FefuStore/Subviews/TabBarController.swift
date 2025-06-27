//
//  TabBarController.swift
//  FefuStore
//
//  Created by Андрей Германович on 26.06.2025.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    private enum Tab: Int {
        case catalog = 0
        case basket = 1
    }

    //MARK: - UIElements
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow(offset: CGSize(width: 0, height: -3))
        return view
    }()

    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .white
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()

    private lazy var catalogButton: TabBarButton = {
        let btn = TabBarButton()
        btn.configure(with: Assets.Icons.catalogIcon, title: "Каталог")
        let action = UIAction { [weak self] _ in
            self?.selectTab(.catalog)
        }
        btn.addAction(action, for: .primaryActionTriggered)
        return btn
    }()

    private lazy var basketButton: TabBarButton = {
        let btn = TabBarButton()
        btn.configure(with: Assets.Icons.cartIcon, title: "Корзина")
        let action = UIAction { [weak self] _ in
            self?.selectTab(.basket)
        }
        btn.addAction(action, for: .primaryActionTriggered)
        return btn
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        selectTab(.catalog)
    }

    // MARK: - Methods

    private func selectTab(_ tab: Tab) {
        selectedIndex = tab.rawValue
        updateTabAppearance(catalogButton, isSelected: tab == .catalog)
        updateTabAppearance(basketButton, isSelected: tab == .basket)
    }

    private func updateTabAppearance(_ button: TabBarButton, isSelected: Bool) {
        button.alpha = isSelected ? Assets.Alpha.activeAlpha : Assets.Alpha.inactiveAlpha
        button.tintColor = isSelected ? Assets.Colors.textPrimaryColor : Assets.Colors.textDescriptionColor
    }
}

extension TabBarController {

    private func setupUI() {
        // set and configure VC
        tabBar.isHidden = true

        let catalogVC = UINavigationController(rootViewController: CatalogViewController())
        let basketVC = UINavigationController(rootViewController: CartViewController())

        setViewControllers([catalogVC, basketVC], animated: true)

        //add UIelements and constraints
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100 + view.safeAreaInsets.bottom)
        }

        contentView.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(view.safeAreaInsets.bottom + 40)
        }

        contentStack.addArrangedSubview(UIView())

        contentStack.addArrangedSubview(catalogButton)
        catalogButton.snp.makeConstraints { make in
            make.height.equalToSuperview()

        }
        contentStack.addArrangedSubview(basketButton)
        basketButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }

        contentStack.addArrangedSubview(UIView())
    }
}
