//
//  Builder.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Builder: NSObject {

	func example() {
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

class AndroidPhone: NSObject {
	
	var osVersion, name, cpuCodeName, launcher : String?
	var osVersionCode, RAMsize : Int?
	
}

protocol AndroidPhoneBuilderProtocol {
	func getPhone() -> AndroidPhone
	func setOsVersion()
	func setOsVersionCode()
	func setName()
	func setCpuCodeName()
	func setLauncher()
	func setRAMsize()
	
	var phone : AndroidPhone {get}
	
}

class LowPricePhoneBuilder: AndroidPhoneBuilderProtocol  {
	
	let phone = AndroidPhone()
	
	func getPhone() -> AndroidPhone {
		return self.phone
	}
	
	func setOsVersion() {
		self.phone.osVersion = "Android4.4"
	}
	
	func setOsVersionCode() {
		self.phone.osVersionCode = 4
	}
	
	func setName() {
		self.phone.name = "Low price phone"
	}
	
	func setCpuCodeName() {
		self.phone.cpuCodeName = "Some shitty CPU"
	}
	
	func setLauncher() {
		self.phone.launcher = "Hia Tsung!"
	}
	
	func setRAMsize() {
		self.phone.RAMsize = 32
	}
}

class HighPricePhoneBuilder: AndroidPhoneBuilderProtocol  {
	
	let phone = AndroidPhone()
	
	func getPhone() -> AndroidPhone {
		return self.phone
	}
	
	func setOsVersion() {
		self.phone.osVersion = "Android8.8"
	}
	
	func setOsVersionCode() {
		self.phone.osVersionCode = 8
	}
	
	func setName() {
		self.phone.name = "High price phone"
	}
	
	func setCpuCodeName() {
		self.phone.cpuCodeName = "Some the best CPU"
	}
	
	func setLauncher() {
		self.phone.launcher = "Stive Jobs"
	}
	
	func setRAMsize() {
		self.phone.RAMsize = 256
	}
}

class FactorySalerMan: NSObject {
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














