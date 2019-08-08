final class ShelfListRepository {
    
    private let request: String
    
    typealias successCompletion = ([Product]) -> Void
    typealias failureCompletion = (String) -> Void
    
    init(request: String = "") {
        self.request = request
    }
    
    func fetchProducts(success: successCompletion, failure: failureCompletion)  {
        if request.hasValues() {
            success(ProductGenerator.products())
        } else {
            failure("Erro")
        }
    }
}

private extension String {
    
    func hasValues() -> Bool {
        return !self.isEmpty
    }
}
