//
//  SizesEntityVIew.swift
//  FefuStore
//
//  Created by Андрей Германович on 04.04.2025.
//

import UIKit

protocol SizeEntityViewDelegate: AnyObject {
    func didSelectSize(with size: String)
}

class SizeEntityView: UIView {
    // MARK: - Private Properties
    
    weak var delegate: SizeEntityViewDelegate?
    private var size: String?
    
    // MARK: - UIElements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
    
    func commonInit() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(34)
        }
        
        containerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview().inset(8.5)
        }
    }
    
    // MARK: - Methods
    
    func configure(size: String, isSelected: Bool) {
        label.text = size
        self.size = size
        
        containerView.backgroundColor = isSelected
            ? Assets.Colors.buttonSelectedColor
            : Assets.Colors.primaryBackgroundColor
        
        label.textColor = isSelected
            ? Assets.Colors.textSecondaryColor
            : Assets.Colors.textPrimaryColor
    }
    
    // MARK: - Actions
    
    @objc private func didTap() {
        guard let size else { return }
        delegate?.didSelectSize(with: size)
    }
}
