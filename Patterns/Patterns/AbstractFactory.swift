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
	func getIphone() -> GenericIphone
	func getIpad() -> GenericIpad
}

class GenericIphone: NSObject {
	var osName : String?
	var productName : String?
}

class GenericIpad: NSObject {
	var osName : String?
	var productName : String?
	var screenSize : Int?
}


class AppleIphone: GenericIphone {
	override init() {
		super.init()
		self.osName = "ios11"
		self.productName = "Apple"
	}
}

class AppleIpad: GenericIpad {
	override init() {
		super.init()
		self.osName = "ios10"
		self.productName = "Apple"
		self.screenSize = 7
	}
}

class ChinaIphone: GenericIphone {
	override init() {
		super.init()
		self.osName = "Android"
		self.productName = "Chi Huan Hua Phone"
	}
}

class ChinaIpad: GenericIpad {
	override init() {
		super.init()
		self.osName = "Windows CE"
		self.productName = "Buan Que Ipado Killa"
		self.screenSize = 13
	}
}

class AppleFactory: PhoneFactory {
	func getIphone() -> GenericIphone {
		let iphone = AppleIphone()
		return iphone
	}
	
	func getIpad() -> GenericIpad {
		let ipad = AppleIpad()
		return ipad
	}
}

class ChinaFactory: PhoneFactory {
	func getIphone() -> GenericIphone {
		let chinaIphone = ChinaIphone()
		return chinaIphone
	}
	
	func getIpad() -> GenericIpad {
		let chinaIpad = ChinaIpad()
		return chinaIpad
	}
	
}
