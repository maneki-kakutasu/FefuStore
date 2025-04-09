//
//  ProductViewController.swift
//  FefuStore
//
//  Created by Андрей Германович on 01.04.2025.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {
    // MARK: - Private Properties
    
    private let sizes = ["XXS","XS", "S", "M", "L", "XL", "XXL", "XXXL"]
    private var selectedSize: String?
    
    // MARK: - UI Elements
    
    // Main Containers
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var screenScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var containerButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.textSecondaryColor
        view.dropShadow(offset: CGSizeMake(0, 2))
        return view
    }()
    
    // Product Info Section
    
    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Images.loafersImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var newTag: UIImageView = {
        let image = UIImageView()
        image.image = Assets.Icons.newTag
        return image
    }()
    
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Кожанные лоферы"
        label.textColor = Assets.Colors.textPrimaryColor
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var infoButton: InfoButton = {
        let but = InfoButton()
        let action = UIAction { action in
        debugPrint("кнопка информации нажата")}
        but.addAction(action, for: .primaryActionTriggered)
        return but
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Лоферы из натуральной кожи. Фигурная союзка с фактурным швом по контуру. Зауженный мыс. Кожаная стелька и подкладка. Прорезиненная подошва. В комплект входит пыльник."
        label.numberOfLines = 0
        label.textColor = Assets.Colors.textDescriptionColor
        return label
    }()
    
    // Size Selection Section
    
    private lazy var sizeScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.clipsToBounds = false
        return scroll
    }()
    
    private lazy var sizeContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.borderColor
        return view
    }()
    
    private lazy var buyButton: PrimaryButton = {
        let but = PrimaryButton()
        let action = UIAction { action in
        debugPrint("кнопка купить нажата")}
        but.addAction(action, for: .primaryActionTriggered)
        return but
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configure(sizes: sizes)
    }
    
    // MARK: - Methods
    
    func configure(sizes: [String], selectedSize: String? = nil) {
        sizeContentStack.subviews.forEach { $0.removeFromSuperview() }
        sizeContentStack.subviews.forEach { sizeContentStack.removeArrangedSubview($0) }
        
        for size in sizes {
            let view = SizeEntityView()
            view.configure(size: size, isSelected: selectedSize == size)
            view.delegate = self
            sizeContentStack.addArrangedSubview(view)
        }
    }
}

// MARK: - Common Init

extension ProductViewController {
    func commonInit() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        containerView.addSubview(containerButtonView)
        containerButtonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(126)
        }

        containerButtonView.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.height.equalTo(48)
        }
        
        containerButtonView.addSubview(borderView)
        borderView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
            make.bottom.equalTo(buyButton.snp.top).inset(-12)
        }

        containerButtonView.addSubview(sizeScrollView)
        sizeScrollView.snp.makeConstraints { make in
            make.height.equalTo(34)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(borderView.snp.top).inset(-12)
        }
        
        sizeScrollView.addSubview(sizeContentStack)
        sizeContentStack.snp.makeConstraints { make in
            make.edges.equalTo(sizeScrollView.contentLayoutGuide)
            make.height.equalTo(sizeScrollView.snp.height)
        }
    
        containerView.addSubview(screenScrollView)
        screenScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(containerButtonView.snp.top)
        }

        screenScrollView.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalTo(screenScrollView.contentLayoutGuide)
            make.width.equalTo(screenScrollView.snp.width)
        }

        contentStack.addArrangedSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.height.equalTo(250)
        }

        productImage.addSubview(newTag)
        newTag.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(44)
        }
        
        contentStack.addArrangedSubview(titleStack)
        titleStack.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        
        titleStack.addArrangedSubview(titleLabel)
        
        titleStack.addArrangedSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
        contentStack.addArrangedSubview(descriptionLabel)

        view.backgroundColor = .white
    }
}

// MARK: - Delegates

extension ProductViewController: SizeEntityViewDelegate {
    func didSelectSize(with size: String) {
        configure(sizes: sizes, selectedSize: size)
    }
}
