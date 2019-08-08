//
//  CardView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 24/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class CardView: UIView {
    
    // MARK: - Outlets
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 3.0
        view.layer.masksToBounds = true
        return view
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var productInfo = TwoTextView(texts: (viewModel.productName, viewModel.productRentability),
                                               style: .bold)
    
    private lazy var typeInfo = TwoTextView(texts: (viewModel.productType, viewModel.productTax))
    
    private let separator = SeparatorView(backgroundColor: .lightGray)
    
    private lazy var valueInfo = TwoTextView(texts: ("Valor mínimo", viewModel.productMinimumValue),
                                             style: .rightBold,
                                             align: .borderLeft)
    
    private lazy var dateInfo = TwoTextView(texts: ("Vence em", viewModel.productMaturityDate),
                                            style: .rightBold,
                                            align: .borderLeft)
    
    // MARK - Properties
    
    private let viewModel: ShelfListCellViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ShelfListCellViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodableView

extension CardView: CodableView {
    
    func buildHierarchy() {
        addSubview(containerView)
        containerStackView.addArrangedSubview(productInfo)
        containerStackView.addArrangedSubview(typeInfo)
        containerStackView.addArrangedSubview(separator)
        containerStackView.addArrangedSubview(valueInfo)
        containerStackView.addArrangedSubview(dateInfo)
        containerView.addSubview(containerStackView)
    }
    
    func buildConstraints() {
        let containerInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        containerView.insetConstraints(inSuperview: self, withInset: containerInset)
        
        let containerStackViewInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        containerStackView.insetConstraints(inSuperview: containerView,
                                            withInset: containerStackViewInset)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
