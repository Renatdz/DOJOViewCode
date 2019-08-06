//
//  SeparatorView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 24/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class SeparatorView: UIView {
    
    // MARK: - Outlets
    
    private let separator = UIView()
    
    // MARK: - Initialization
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        separator.backgroundColor = backgroundColor
        
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodableView

extension SeparatorView: CodableView {
    
    func buildHierarchy() {
        addSubview(separator)
    }
    
    func buildConstraints() {
        separator.insetConstraints(inSuperview: self)
        separator.heightConstraint(constant: 1)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
    }
}
