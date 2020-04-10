//
//  Composite.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 10.04.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

protocol Component {
    var parent: Component? { get set }

    var isLeaf: Bool { get }

    func add(_ component: Component)
    func removeLast() -> Component?
    func estimate() -> Int
}

extension Component {
    func add(_ component: Component) { }
    func removeLast() -> Component? {
        return nil
    }
}

final class Leaf: Component {
    var parent: Component?
    var isLeaf: Bool = true
    func estimate() -> Int {
        return 5
    }
}

final class Composite: Component {
    var parent: Component?
    var isLeaf: Bool = false
    private var children: [Component] = []

    func add(_ component: Component) {
        var item = component
        item.parent = self
        children.append(item)
    }

    func removeLast() -> Component? {
        children.removeLast()
    }

    func estimate() -> Int {
        children.reduce(into: 0) { result, component in
            result += component.estimate()
        }
    }
}


class CompositeExample {
    static func example() {
        let tree = Composite()
        tree.add(Leaf())
        tree.add(Leaf())
        tree.add(Leaf())

        let branch = Composite()
        branch.add(Leaf())
        branch.add(Leaf())
        branch.add(Leaf())

        tree.add(branch)

        print(tree.estimate())
    }
}
