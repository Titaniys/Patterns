//
//  Singleton.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

final class Singleton {

    private static var sharedInstance: Singleton!

    private let name: String

    static func getSharedInstance() -> Singleton {
        guard sharedInstance == nil else {
            return sharedInstance
        }
        sharedInstance = Singleton()
        return sharedInstance
    }

    private init() {
        self.name = "singleton"
    }
    
}

