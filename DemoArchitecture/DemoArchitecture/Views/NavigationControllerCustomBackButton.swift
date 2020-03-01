//
//  NavigationControllerCustomBackButton.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import UIKit

class NavigationControllerCustomBackButton: UIButton {
    
    static func initCustomBackButton(_ backButtonImage: UIImage? = nil, _ backButtonTitle: String? = nil, _ backButtonFont: UIFont? = nil, _ backButtonTitleColor: UIColor? = nil) -> UIButton {
        let button = UIButton(type: .system)
        
        if let backButtonImage = backButtonImage {
            button.setImage(backButtonImage, for: .normal)
        }
        if let backButtonTitle = backButtonTitle {
            button.setTitle(backButtonTitle, for: .normal)
        }
        if let backButtonFont = backButtonFont {
            button.titleLabel?.font = backButtonFont
        }
        if let backButtonTitleColor = backButtonTitleColor {
            button.setTitleColor(backButtonTitleColor, for: .normal)
        }
        
        button.centerTextAndImage(spacing: 8)
        
        return button
    }
    
}
