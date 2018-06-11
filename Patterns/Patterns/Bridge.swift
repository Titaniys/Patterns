//
//  Bridge.swift
//  Patterns
//
//  Created by Вадим Чистяков on 11.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Bridge: NSObject {

	static func example() {
		
		let chinaHeadphone = ChinaHeadphone()
		let expensiveHeadphone = ExpensiveHeadphone()
		
		let musicPlayer = MusicPlayer()
		musicPlayer.headphone = chinaHeadphone
		musicPlayer.play()
		
		musicPlayer.headphone = expensiveHeadphone
		musicPlayer.play()
		
	}
}

protocol BaseHeadphone {
	func playSimpleSound()
	func playBassSound()
}

class ChinaHeadphone: BaseHeadphone {
	func playBassSound() {
		print("beep-beep-pffff")
	}
	
	func playSimpleSound() {
		print("bbf-bff-bbbppp")
	}
}

class ExpensiveHeadphone: BaseHeadphone {
	func playBassSound() {
		print("beep-beep-tapam-pam-pam")
	}
	
	func playSimpleSound() {
		print("BAM-BAM-BAM")
	}
}

class MusicPlayer: NSObject {
	
	var headphone : BaseHeadphone?
	
	func play() {
		headphone?.playSimpleSound()
		headphone?.playBassSound()
		headphone?.playSimpleSound()
		headphone?.playBassSound()
	}
}






