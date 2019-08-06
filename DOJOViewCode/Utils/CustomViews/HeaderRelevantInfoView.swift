//
//  HeaderRelevantInfoView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 25/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class HeaderRelevantInfoView: UIView {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let relevantTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    // MARK: - Initialization
    
    init(text: String,
         textColor: UIColor = .black,
         relevantText: String,
         relevantTextColor: UIColor = .black) {
        super.init(frame: .zero)
        
        setup(with: text,
              textColor: textColor,
              relevantText: relevantText,
              relevantTextColor: relevantTextColor)
        
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension HeaderRelevantInfoView {
    
    func setup(with text: String,
               textColor: UIColor,
               relevantText: String,
               relevantTextColor: UIColor) {
        
        textLabel.text = text
        textLabel.textColor = textColor
        relevantTextLabel.text = relevantText
        relevantTextLabel.textColor = relevantTextColor
    }
}

// MARK: - CodableView

extension HeaderRelevantInfoView: CodableView {
    
    func buildHierarchy() {
        addSubview(textLabel)
        addSubview(relevantTextLabel)
    }
    
    func buildConstraints() {
        textLabel.topConstraint(parentView: self, constant: 16)
        textLabel.centerXConstraint(parentView: self)
        
        relevantTextLabel.overConstraint(topItem: textLabel, constant: 20)
        relevantTextLabel.centerXConstraint(parentView: self)
        relevantTextLabel.bottomConstraint(parentView: self, constant: 16)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        relevantTextLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
