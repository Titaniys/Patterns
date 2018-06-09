//
//  Prototype.swift
//  Patterns
//
//  Created by Вадим Чистяков on 09.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Prototype: NSObject {

	func prototypeExample() {
		
		let firstPerson = Person()
		firstPerson.name = "Vadim"
		firstPerson.surname = "Chistyakov"
		firstPerson.age = 13
		print("firstPerson", firstPerson.name!, firstPerson.surname!)
		
		let secondPerson = firstPerson.copy() as! Person
		secondPerson.name = "Petyh"
		secondPerson.surname = "Petyhov"
		secondPerson.age = 45
		
		print("secondPerson", secondPerson.name!, secondPerson.surname!)
		print("firstPerson", firstPerson.name!, firstPerson.surname!)
		
	}
	
}

class Person: NSObject, NSCopying {
	
	var name : String?
	var surname : String?
	var age : Int?
	
	func copy(with zone: NSZone? = nil) -> Any {
		let copyPerson = Person()
		copyPerson.name = name
		copyPerson.surname = surname
		copyPerson.age = age
		return copyPerson
	}
	
}
