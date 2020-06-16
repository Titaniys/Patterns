//
//  Iterator.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 16.06.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

class Tree<T> {

	var value: T
	var left: Tree<T>?
	var right: Tree<T>?

	typealias Block = (T) -> ()

	init(_ value: T) {
		self.value = value
	}

	enum IteratorType {
		case inOrder
		case preOrder
		case postOrder
	}

	func iterate(_ iteratorType: IteratorType) -> AnyIterator<T> {
		var items = [T]()
		switch iteratorType {
		case .inOrder:
			inOrder { items.append($0) }
		case .preOrder:
			preOrder { items.append($0) }
		case .postOrder:
			postOrder { items.append($0) }
		}
		return AnyIterator(items.makeIterator())
	}

	private func inOrder(_ body: Block) {
        left?.inOrder(body)
        body(value)
        right?.inOrder(body)
    }

	private func preOrder(_ body: Block) {
        body(value)
        left?.inOrder(body)
        right?.inOrder(body)
    }

	private func postOrder(_ body: Block) {
        left?.inOrder(body)
        right?.inOrder(body)
        body(value)
    }

}


class TestIterator {
	
	static func test() {
		let tree = Tree(5)
		tree.left = Tree(3)
		tree.right = Tree(34)

		print("inOrder")
		TestIterator.clientCode(iterator: tree.iterate(.inOrder))
		print("preOrder")
		TestIterator.clientCode(iterator: tree.iterate(.preOrder))
		print("postOrder")
		TestIterator.clientCode(iterator: tree.iterate(.postOrder))
	}

	static func clientCode<T>(iterator: AnyIterator<T>) {
        while case let item? = iterator.next() {
            print(item)
        }
    }

}
