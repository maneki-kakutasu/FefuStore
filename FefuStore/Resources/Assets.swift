//
//  Assets.swift
//  FefuStore
//
//  Created by Андрей Германович on 05.04.2025.
//

import Foundation
import UIKit

struct Assets {
    
    // MARK: - Colors
    struct Colors {
        static let borderColor = UIColor(named: "BorderColor")
        
        // Text colors
        static let textDescriptionColor = UIColor(named: "TextDescriptionColor")
        static let textPrimaryColor = UIColor(named: "TextPrimaryColor")
        static let textSecondaryColor = UIColor(named: "TextSecondaryColor")
        
        // Button colors
        static let buttonColor = UIColor(named: "ButtonColor")
        static let buttonSelectedColor = UIColor(named: "ButtonSelectedColor")
        static let priceTagColor = UIColor(named: "PriceTagColor")
        static let priceTextColor = UIColor(named: "PriceTextColor")
        
        // Background colors
        static let primaryBackgroundColor = UIColor(named: "PrimaryBackgroundColor")
    }
    
    // MARK: - Images
    struct Images {
        static let blazerImage = UIImage(named: "BlazerImage")
        static let jeansImage = UIImage(named: "JeansImage")
        static let loafersImage = UIImage(named: "LoafersImage")
        static let trousersImage = UIImage(named: "TrousersImage")
        static let tshirtImage = UIImage(named: "TshirtImage")
        static let errorSneakers = UIImage(named: "ErrorSneakers")
    }
    
    // MARK: - Icons
    struct Icons {
        static let newTag = UIImage(named: "NewTagIcon")
        static let infoButton = UIImage(named: "InfoButtonIcon")
        static let catalogIcon = UIImage(named: "CatalogIcon")
        static let cartIcon = UIImage(named: "CartIcon")
    }
    
    // MARK: - Fonts
    struct Fonts {}
    
    struct Alpha {
        static let activeAlpha: CGFloat = 1.0
        static let inactiveAlpha: CGFloat = 0.5
    }
}
