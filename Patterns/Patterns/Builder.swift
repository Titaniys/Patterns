//
//  Builder.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

final class BuilderExample {

	static func example() {
		let cheapPhoneBuilder = LowPricePhoneBuilder()
		let expensive = HighPricePhoneBuilder()
		
		let salerMan = FactorySalerMan()
		salerMan.setPhoneBuilder(cheapPhoneBuilder)
		salerMan.constructorPhone()
		
		let probablyLowPhone = salerMan.getPhone()
		if let phone = probablyLowPhone {
			print("Probably low phone", phone.name!, phone.cpuCodeName!, phone.launcher!, phone.osVersionCode!, phone.osVersion!)
		}
		
		salerMan.setPhoneBuilder(expensive)
		salerMan.constructorPhone()
		
		let probablyHighPhone = salerMan.getPhone()
		if let phone = probablyHighPhone {
			print("Probably high phone", phone.name!, phone.cpuCodeName!, phone.launcher!, phone.osVersionCode!, phone.osVersion!)
		}
	}

}

final class AndroidPhone {
	var osVersion, name, cpuCodeName, launcher : String?
	var osVersionCode, RAMsize : Int?
}

protocol AndroidPhoneBuilderProtocol {
    var phone: AndroidPhone { get }

	func getPhone() -> AndroidPhone
	func setOsVersion()
	func setOsVersionCode()
	func setName()
	func setCpuCodeName()
	func setLauncher()
	func setRAMsize()
}

final class LowPricePhoneBuilder: AndroidPhoneBuilderProtocol  {
	
	let phone = AndroidPhone()
	
	func getPhone() -> AndroidPhone {
		return phone
	}
	
	func setOsVersion() {
		phone.osVersion = "Android4.4"
	}
	
	func setOsVersionCode() {
		phone.osVersionCode = 4
	}
	
	func setName() {
		phone.name = "Low price phone"
	}
	
	func setCpuCodeName() {
		phone.cpuCodeName = "Some shitty CPU"
	}
	
	func setLauncher() {
		phone.launcher = "Hia Tsung!"
	}
	
	func setRAMsize() {
		phone.RAMsize = 32
	}
}

final class HighPricePhoneBuilder: AndroidPhoneBuilderProtocol  {
	
	let phone = AndroidPhone()
	
	func getPhone() -> AndroidPhone {
		return phone
	}
	
	func setOsVersion() {
		phone.osVersion = "Android8.8"
	}
	
	func setOsVersionCode() {
		phone.osVersionCode = 8
	}
	
	func setName() {
		phone.name = "High price phone"
	}
	
	func setCpuCodeName() {
		phone.cpuCodeName = "Some the best CPU"
	}
	
	func setLauncher() {
		phone.launcher = "Stive Jobs"
	}
	
	func setRAMsize() {
		phone.RAMsize = 256
	}
}

final class FactorySalerMan {
	var phoneBuilder : AndroidPhoneBuilderProtocol?
	
	func setPhoneBuilder(_ builder: AndroidPhoneBuilderProtocol) {
		self.phoneBuilder = builder
	}
	
	func getPhone() -> AndroidPhone? {
		if let builder = phoneBuilder {
			return builder.getPhone()
		}
		return nil
	}
	
	func constructorPhone() {
		if let builder = phoneBuilder {
			builder.setCpuCodeName()
			builder.setName()
			builder.setRAMsize()
			builder.setLauncher()
			builder.setOsVersion()
			builder.setOsVersionCode()
		}
	}
}














