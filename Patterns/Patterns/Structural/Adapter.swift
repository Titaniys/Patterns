//
//  Adapter.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

protocol BirdProtocol {
	func fly()
	func sing()
}

final class Bird: BirdProtocol {
	func fly() {
		print("Fly")
	}
	
	func sing() {
		print("Sing")
	}
}

protocol Hunter {
    func kill()
    func shout()
}

final class Raven: Hunter {
	func kill() {
		print("I am flying and seak for killing!")
	}
	
	func shout() {
		print("Kaaaar-kaaaaar-kaaaaaaar!")
	}
}

class HunterAdapter: BirdProtocol {

    private let hunter: Hunter

    init(_ adaptee: Hunter) {
        hunter = adaptee
    }

	func fly() {
		hunter.kill()
	}
	
	func sing() {
		hunter.shout()
	}

}

extension Raven: BirdProtocol {
    func fly() {
        kill()
    }

    func sing() {
        shout()
    }
}







