//
//  Proxy.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 30.04.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

protocol Storage {
    func read()
    func write()
}

final class StorageImpl: Storage {

    func read() {
        print("read from db")
    }

    func write() {
        print("write to db")
    }

}

final class Logger {
    func log() {
        print("log")
    }
}

final class Cacher {
    func getFromCache() {
        print("get from cache something")
    }
}

final class StorageProxy: Storage {

    private let logger = Logger()
    private let cacher: Cacher? = Cacher()
    private let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    func read() {
        if cacher != nil {
            cacher?.getFromCache()
        } else {
            storage.read()
        }
    }

    func write() {
        logger.log()
        storage.write()
    }

}
