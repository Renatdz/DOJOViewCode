//
//  TwoTextCustomView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 24/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//
import UIKit

enum TwoTextViewStyle {
    case light
    case bold
    case leftBold
    case rightBold
}

enum TwoTextViewAlign {
    case borders
    case borderLeft
}

final class TwoTextView: UIView {
    
    // MARK: - Outlets
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    
    init(texts: (left: String?, right: String?),
         textColors: (left: UIColor, right: UIColor) = (.black, .black),
         style: TwoTextViewStyle = .light,
         align: TwoTextViewAlign = .borders) {
        
        super.init(frame: .zero)

        setup(with: texts, textColors: textColors, style: style, align: align)
        buildCodableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups

private extension TwoTextView {
    
    func setup(with texts: (left: String?, right: String?),
               textColors: (left: UIColor, right: UIColor),
               style: TwoTextViewStyle,
               align: TwoTextViewAlign) {
        
        leftLabel.text = texts.left
        leftLabel.textColor = textColors.left
        
        rightLabel.text = texts.right
        rightLabel.textColor = textColors.right
        
        setupStyle(style)
        setupAlign(align)
    }
    
    func setupStyle(_ style: TwoTextViewStyle) {
        switch style {
        case .light:
            leftLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            rightLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        case .bold:
            leftLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            rightLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        case .leftBold:
            leftLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            rightLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        case .rightBold:
            leftLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            rightLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    func setupAlign(_ align: TwoTextViewAlign) {
        switch align {
        case .borders:
            leftLabel.textAlignment = .left
            rightLabel.textAlignment = .right
        case .borderLeft:
            leftLabel.setContentHuggingPriority(.required, for: .horizontal)
            leftLabel.textAlignment = .left
            rightLabel.textAlignment = .left
        }
    }
}

// MARK: - CodableView

extension TwoTextView: CodableView {
    func buildHierarchy() {
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        addSubview(stackView)
    }
    
    func buildConstraints() {
        stackView.insetConstraints(inSuperview: self)
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
