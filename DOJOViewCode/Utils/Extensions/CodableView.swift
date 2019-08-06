protocol CodableView: AnyObject {
    func buildHierarchy()
    func buildConstraints()
    func additionalSetup()
    func buildCodableView()
}

extension CodableView {
    func buildCodableView() {
        buildHierarchy()
        buildConstraints()
        additionalSetup()
    }
    
    func additionalSetup() { }
}
