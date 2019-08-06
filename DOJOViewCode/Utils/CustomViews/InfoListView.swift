//
//  InfoListView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 25/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class InfoListView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Initialization
    
    init(infoValues: [(info: String, value: String)]) {
        super.init(frame: .zero)
        
        setup(with: infoValues)
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension InfoListView {
    
    func setup(with infoValues: [(info: String, value: String)]) {
        
        infoValues.forEach {
            let twoTextView = TwoTextView(texts: ($0.info, $0.value), style: .rightBold)
            stackView.addArrangedSubview(twoTextView)
        }
    }
}

// MARK: - CodableView

extension InfoListView: CodableView {
    
    func buildHierarchy() {
        addSubview(stackView)
    }
    
    func buildConstraints() {
        stackView.topConstraint(parentView: self, constant: 16)
        stackView.leftConstraint(parentView: self, constant: 24)
        stackView.rightConstraint(parentView: self, constant: 24)
        stackView.bottomConstraint(parentView: self, constant: 16)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
