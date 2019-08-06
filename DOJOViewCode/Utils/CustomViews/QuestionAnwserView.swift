//
//  QuestionanswerView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 25/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class QuestionAnswerView: UIView {
    
    // MARK: - Outlets
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initialization
    
    init(question: String, answer: String) {
        super.init(frame: .zero)
        
        setup(with: question, answer: answer)
        
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension QuestionAnswerView {
    
    func setup(with question: String, answer: String) {
        questionLabel.text = question
        answerLabel.text = answer
    }
}

// MARK: - CodableView

extension QuestionAnswerView: CodableView {
    
    func buildHierarchy() {
        addSubview(questionLabel)
        addSubview(answerLabel)
    }
    
    func buildConstraints() {
        questionLabel.topConstraint(parentView: self, constant: 16)
        questionLabel.leftConstraint(parentView: self, constant: 16)
        questionLabel.rightConstraint(parentView: self, constant: 16)
        
        answerLabel.overConstraint(topItem: questionLabel, constant: 8)
        answerLabel.leftConstraint(parentView: self, constant: 16)
        answerLabel.rightConstraint(parentView: self, constant: 16)
        answerLabel.bottomConstraint(parentView: self, constant: 16)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
