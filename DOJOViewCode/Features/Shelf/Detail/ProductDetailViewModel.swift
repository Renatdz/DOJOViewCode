struct ProductDetailViewModel {
    
    let productName: String
    let productRentability: String
    let productType: String
    let productTax: String
    let productMinimumValue: String
    let productMaturityDate: String
    let productLiquidity: String
    let productMaturityDateInDays: String
    let productIof: String
    
    init(product: Product) {
        productName = product.name
        productRentability = product.rentability
        productType = product.type
        productTax = product.tax
        productMinimumValue = "R$ \(product.minimumValue)"
        productMaturityDate = product.maturityDate.replacingOccurrences(of: "-", with: "/")
        productLiquidity = "D+\(product.liquidity)"
        productMaturityDateInDays = "\(product.maturityDateInDays) dias"
        productIof = product.iof
    }
}
