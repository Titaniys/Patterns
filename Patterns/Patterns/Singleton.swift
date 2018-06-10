//
//  Singleton.swift
//  Patterns
//
//  Created by Вадим Чистяков on 10.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Singleton: NSObject {

	static let singleton = Singleton()
	
	var name : String?
}

