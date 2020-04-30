//
//  Decorator.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 14.04.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

protocol AnyComponent {
    func operate() -> String
}

final class ConcreteComponent: AnyComponent {
    func operate() -> String {
        return "ConcreteComponent"
    }
}


final class Decorator: AnyComponent {

    private let component: AnyComponent

    init(component: AnyComponent) {
        self.component = component
    }

    func operate() -> String {
        return "Decorated" + component.operate()
    }

}

class DecoratorExample {
    static func example() {
        let component: AnyComponent = ConcreteComponent()
        let decorator: AnyComponent = Decorator(component: component)

        print(component.operate())
        print(decorator.operate())
    }
}
