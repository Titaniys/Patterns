//
//  TemplateCollectionViewController.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 07.04.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import UIKit

protocol SectionViewModel {
    associatedtype CellModels: CollectionViewModels
    var sections: [CellModels] { get }
}

protocol CollectionViewModels {
    var viewModels: [AnyObject] { get }
}

class TemplateCollectionViewController<ViewModel, CellModels: CollectionViewModels>: UIViewController, SectionViewModel {

    var viewModel: ViewModel!
    var sections: [CellModels]!

//
//    init<ViewModelType: SectionViewModel>(_ viewModel: ViewModelType) where ViewModelType.ViewModel == ViewModel,
//        ViewModelType.Section == Section {
//            box = ViewModelBox(viewModel)
//            super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


}

protocol TestProtocol {
    func test()
}

class NewTemp: TemplateCollectionViewController<TestProtocol, BaseSection> {

    var sections: [BaseSection]!
    
    func vaddr() -> [BaseSection] {
        viewModel.test()
        return []
    }
}

enum BaseSection: CollectionViewModels {
    case test

    var viewModels: [AnyObject] {
        switch self {
        case .test:
            return []
        }
    }
}

class BaseViewModel: SectionViewModel, TestProtocol {

    func test() {

    }

    func getSections() -> [BaseSection] {
        return []
    }

}

//class AnyViewModelBox<ViewModel, Section>: SectionViewModel {
//    func getSections(for viewModel: ViewModel) -> [Section] {
//        fatalError("This method is abstract")
//    }
//}
//
//class ViewModelBox<Base: SectionViewModel>: AnyViewModelBox<Base.ViewModel, Base.Section> {
//    private let base: Base
//
//    init(_ base: Base) {
//        self.base = base
//    }
//
//    override func getSections(for viewModel: ViewModel) -> [Section] {
//        base.getSections(for: viewModel)
//    }
//}
//
//class CopyViewModelBox<Base: SectionViewModel>: AnyViewModelBox<Base.ViewModel, Base.Section> {
//    private let base: Base
//
//    init(_ base: Base) {
//        self.base = base
//    }
//
//    override func getSections(for viewModel: ViewModel) -> [Section] {
//        base.getSections(for: viewModel)
//    }
//}
