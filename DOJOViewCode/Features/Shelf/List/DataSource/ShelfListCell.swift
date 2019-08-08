//
//  ShelfListCell.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ShelfListCell: UITableViewCell {
    
    // MARK: - Outlets
    
    private lazy var cardView = CardView(viewModel: viewModel)
    
    // MARK: - Outlets
    
    private var viewModel: ShelfListCellViewModel = ShelfListCellViewModel.empty()
}

// MARK: - Binding

extension ShelfListCell {
    
    func configure(with viewModel: ShelfListCellViewModel) {
        self.viewModel = viewModel
        
        buildCodableView()
    }
}

// MARK: - Reusable

extension ShelfListCell: Reusable {}

// MARK: - CodableView

extension ShelfListCell: CodableView {
    func buildHierarchy() {
        addSubview(cardView)
    }
    
    func buildConstraints() {
        cardView.insetConstraints(inSuperview: self)
    }
    
    func additionalSetup() {
        backgroundColor = .white
        selectionStyle = .none
    }
}

