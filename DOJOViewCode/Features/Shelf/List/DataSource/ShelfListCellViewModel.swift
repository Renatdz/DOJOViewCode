struct ShelfListCellViewModel {
    
    let product: Product
    let productName: String
    let productRentability: String
    let productType: String
    let productTax: String
    let productMinimumValue: String
    let productMaturityDate: String
    
    init(product: Product) {
        self.product = product
        productName = product.name
        productRentability = product.rentability
        productType = product.type
        productTax = product.tax
        productMinimumValue = "R$ \(product.minimumValue)"
        productMaturityDate = product.maturityDate.replacingOccurrences(of: "-", with: "/")
    }
}

extension ShelfListCellViewModel {
    
    static func empty() -> ShelfListCellViewModel {
        return ShelfListCellViewModel(product: Product.empty())
    }
}

