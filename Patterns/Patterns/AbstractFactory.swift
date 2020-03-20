//
//  AbstractFactory.swift
//  Patterns
//
//  Created by Вадим Чистяков on 09.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class AbstractFactory: NSObject {

	var isThirdWorld : Bool = false
	
	func getFactory() -> PhoneFactory {
		if isThirdWorld {
			return ChinaFactory()
		} else {
			return AppleFactory()
		}
	}
}

protocol PhoneFactory{
	func getIphone() -> Iphone
	func getIpad() -> Ipad
}

class Iphone {
	var osName : String?
	var productName : String?
}

class Ipad {
	var osName : String?
	var productName : String?
	var screenSize : Int?
}


class AppleIphone: Iphone {
	override init() {
		super.init()
		self.osName = "ios11"
		self.productName = "Apple"
	}
}

class AppleIpad: Ipad {
	override init() {
		super.init()
		self.osName = "ios10"
		self.productName = "Apple"
		self.screenSize = 7
	}
}

class ChinaIphone: Iphone {
	override init() {
		super.init()
		self.osName = "Android"
		self.productName = "Chi Huan Hua Phone"
	}
}

class ChinaIpad: Ipad {
	override init() {
		super.init()
		self.osName = "Windows CE"
		self.productName = "Buan Que Ipado Killa"
		self.screenSize = 13
	}
}

class AppleFactory: PhoneFactory {
	func getIphone() -> Iphone {
		let iphone = AppleIphone()
		return iphone
	}
	
	func getIpad() -> Ipad {
		let ipad = AppleIpad()
		return ipad
	}
}

class ChinaFactory: PhoneFactory {
	func getIphone() -> Iphone {
		let chinaIphone = ChinaIphone()
		return chinaIphone
	}
	
	func getIpad() -> Ipad {
		let chinaIpad = ChinaIpad()
		return chinaIpad
	}
	
}
