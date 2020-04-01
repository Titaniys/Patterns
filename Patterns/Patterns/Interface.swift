//
//  Interface.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 20.03.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

protocol Interface {
    func method()
}

extension Interface {
    func method() {
        print("method")
    }
}

protocol Interface1 {
    func method1()
}

extension Interface1 {
    func method1() {
        print("method1")
    }
}

class InterfaceExample: Interface, Interface1 {
    func method() {
        print("sdfsd")
    }
}
