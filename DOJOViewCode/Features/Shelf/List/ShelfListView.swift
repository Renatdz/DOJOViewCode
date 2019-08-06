//
//  ShelfListView.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ShelfListView: UIView {
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellType: ShelfListCell.self)
        tableView.dataSource = listDataSource
        tableView.delegate = listDataSource
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset.top = 20
        return tableView
    }()
    
    // MARK: - Properties
    
    private var listDataSource: ShelfListDataSource
    
    
    // MARK: - Initialization
    
    init(dataSource: ShelfListDataSource = ShelfListDataSource(),
         frame: CGRect = .zero) {
        listDataSource = dataSource
        
        super.init(frame: frame)
        buildCodableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ listDataSourceDelegate: ShelfListDataSourceDelegate?) {
        listDataSource.set(listDataSourceDelegate)
    }
}

// MARK: - Binding

extension ShelfListView {
    
    func updateList(products: [Product]) {
        listDataSource.set(products)
        tableView.reloadData()
    }
}

// MARK: - CodableView

extension ShelfListView: CodableView{
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.insetConstraints(inSuperview: self)
    }
    
    func additionalSetup() {
        backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}
