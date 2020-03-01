//
//  LaunchInstructor.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure(isAuthorized: Bool = false, tutorialWasShown: Bool = false) -> LaunchInstructor {
        switch (tutorialWasShown, isAuthorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
    
}
