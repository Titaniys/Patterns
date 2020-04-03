//
//  Prototype.swift
//  Patterns
//
//  Created by Вадим Чистяков on 09.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

final class Prototype {

	static func example() {
		
		let firstPerson = Programmer(name: "Vadim", surname: "Chistyakov", age: 26)
		print("firstPerson", firstPerson.name)
		
		let secondPerson = firstPerson.clone()
		print("secondPerson", secondPerson.name)

	}
	
}

enum Profession {
    case worker
    case designer
    case programmer
}

protocol Person: NSCopying {
    associatedtype T
    var name : String { get set }
    var surname : String { get set }
    var age : Int { get set }
    var profission: Profession { get }
	
	func clone() -> T
}

class Worker: Person {

    var name: String
    var surname: String
    var age: Int
    let profission: Profession = .worker

    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }

    func clone() -> Worker {
        return copy() as! Worker
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let copyWorker = self
        copyWorker.name = name + " clone of worker"
        return copyWorker
    }

}

class Programmer: Person {

    var name: String
    var surname: String
    var age: Int
    let profission: Profession = .programmer

    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }

    func clone() -> Programmer {
        return copy() as! Self
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let copyWorker = self
        copyWorker.name = name + " clone of programmer"
        return copyWorker
    }

}
