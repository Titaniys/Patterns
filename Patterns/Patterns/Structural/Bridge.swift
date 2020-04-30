//
//  Bridge.swift
//  Patterns
//
//  Created by Вадим Чистяков on 11.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Bridge {

	static func example() {
		
		let chinaHeadphone = ChinaHeadphone()
		let expensiveHeadphone = ExpensiveHeadphone()
		
        let musicPlayerForBeach = MusicPlayer(headphones: chinaHeadphone)
		musicPlayerForBeach.play()

        let musicPlayerForRich = MusicPlayer(headphones: expensiveHeadphone)
		musicPlayerForRich.play()
		
	}
}

protocol Headphones {
	func playSimpleSound()
	func playBassSound()
    func stopSound()
}

final class ChinaHeadphone: Headphones {
	func playBassSound() {
		print("beep-beep-pffff")
	}
	
	func playSimpleSound() {
		print("bbf-bff-bbbppp")
	}

    func stopSound() {
        print("bam")
    }
}

final class ExpensiveHeadphone: Headphones {
	func playBassSound() {
		print("beep-beep-tapam-pam-pam")
	}
	
	func playSimpleSound() {
		print("BAM-BAM-BAM")
	}

    func stopSound() {
        print("Silence")
    }
}

protocol MusicPlayerProtocol {
    var headphones: Headphones { get }

    func play()
    func stop()
}

final class MusicPlayer: MusicPlayerProtocol {
	
	var headphones: Headphones

    init(headphones: Headphones) {
        self.headphones = headphones
    }
	
	func play() {
		headphones.playSimpleSound()
		headphones.playBassSound()
		headphones.playSimpleSound()
		headphones.playBassSound()
	}

    func stop() {
        headphones.stopSound()
    }
}






