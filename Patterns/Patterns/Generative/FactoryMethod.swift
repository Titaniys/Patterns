//
//  FactoryMethod.swift
//  Patterns
//
//  Created by Вадим Чистяков on 09.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

protocol Loggistic {
    func sendMail() -> Transport
    func startLoggistic()
}

extension Loggistic {
    func startLoggistic() {
        let transport = sendMail()
        transport.move()
    }
}

class PlaneLoggistic: Loggistic {
    func sendMail() -> Transport {
        return Plane()
    }
}

class TruckLoggistic: Loggistic {
    func sendMail() -> Transport {
        return Truck()
    }
}

protocol Transport {
    func move()
}

class Plane: Transport {
    func move() {
        print("fly")
    }
}

class Truck: Transport {
    func move() {
        print("go!")
    }
}



class LoggisticApp {

    var loggistic: Loggistic?
    // if distance < 1000 -> Truck else Plane
    func example(distance: Int) {

        if distance < 1000 {
            loggistic = TruckLoggistic()
        } else {
            loggistic = PlaneLoggistic()
        }

        loggistic?.startLoggistic()
    }
}
