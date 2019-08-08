//
//  ProductDetailView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ProductDetailView: UIView {
    
    // MARK: - Outlets
    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var headerView = HeaderRelevantInfoView(text: viewModel.productType,
                                                         relevantText: viewModel.productRentability)
    
    private lazy var infoListView = InfoListView(infoValues: infoListValues)
    
    private lazy var questionAnswerView = QuestionAnswerView(question: Constants.howMuchIRQuestion,
                                                             answer: Constants.howMuchIRAnswer)
    
    private lazy var infoIRListView = InfoListView(infoValues: infoIRListValues)
    
    // MARK: - Properties
    
    private let viewModel: ProductDetailViewModel
    
    private lazy var infoListValues = [
        (info: "Investimento mínimo", value: viewModel.productMinimumValue),
        (info: "Rentabilidade", value: viewModel.productRentability),
        (info: "Data de vencimento", value: viewModel.productMaturityDate),
        (info: "Vencimento em dias", value: viewModel.productMaturityDateInDays),
        (info: "Pagamento de juros", value: "-"),
        (info: "IR sobre o rendimento", value: viewModel.productTax),
        (info: "IOF sobre o rendimento", value: viewModel.productIof),
        (info: "Resgate", value: viewModel.productLiquidity)
    ]
    
    private let infoIRListValues = [
        (info: "Até 6 meses", value: "22,5%"),
        (info: "Até 1 ano", value: "20%"),
        (info: "Até 2 anos", value: "17,5%"),
        (info: "Acima de 2 anos", value: "15%")
    ]
    
    // MARK: - Initialization
    
    init(viewModel: ProductDetailViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        buildCodableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodableView

extension ProductDetailView: CodableView {
    
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(infoListView)
        stackView.addArrangedSubview(questionAnswerView)
        stackView.addArrangedSubview(infoIRListView)
    }
    
    func buildConstraints() {
        scrollView.safeAreaTop(safeAreaView: self)
        scrollView.leftConstraint(parentView: self)
        scrollView.rightConstraint(parentView: self)
        scrollView.bottomConstraint(parentView: self)
        
        stackView.insetConstraints(inSuperview: scrollView)
        stackView.widthConstraintEqualTo(parentView: scrollView)
    }
    
    func additionalSetup() {
        backgroundColor = .white
        headerView.backgroundColor = .white
        scrollView.backgroundColor = .groupTableViewBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
