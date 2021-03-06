//
//  Coordinator.swift
//
//  Created by Pavle Pesic on 1/10/20.
//  Copyright © 2020 Pavle Pesic. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
