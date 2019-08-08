//
//  ShelfListViewModel.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 06/08/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

final class ShelfListViewModel {
    
    private let repository: ShelfListRepository
    
    init(repository: ShelfListRepository) {
        self.repository = repository
    }
    
    func fetchProducts(success: ([ShelfListCellViewModel]) -> Void, failure: (String) -> Void) {
        repository.fetchProducts(success: { products in
            
            let cellViewModels = products.map {
                ShelfListCellViewModel(product: $0)
            }
            
            success(cellViewModels)
            
        }, failure: { errorMessage in
            failure(errorMessage)
        })
    }
}
