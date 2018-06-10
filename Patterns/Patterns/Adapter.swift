//
//  Adapter.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Adapter: NSObject {

	func makeTheBirdTest(_ bird: BirdProtocol) {
		bird.fly()
		bird.sing()
	}
}

protocol BirdProtocol {
	func fly()
	func sing()
}

class Bird: BirdProtocol {
	func fly() {
		print("Fly")
	}
	
	func sing() {
		print("Sing")
	}
}

class Raven: NSObject {
	func flySearchAndDestroy() {
		print("I am flying and seak for killing!")
	}
	
	func voice() {
		print("Kaaaar-kaaaaar-kaaaaaaar!")
	}
}

class RavenAdapter: BirdProtocol {
	var raven = Raven()
	
	func fly() {
		raven.flySearchAndDestroy()
	}
	
	func sing() {
		raven.voice()
	}
	
	func initWithRaven(_ adaptee: Raven) -> RavenAdapter {
		raven = adaptee
		return self
	}
}









