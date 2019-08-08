//
//  Product.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

struct Product {
    let name: String
    let type: String
    let rentability: String
    let tax: String
    let minimumValue: Double
    let maturityDate: String
    let liquidity: Int
    let maturityDateInDays: Int
    let iof: String
}

extension Product {
    static func empty() -> Product {
        return Product(name: "",
                       type: "",
                       rentability: "",
                       tax: "",
                       minimumValue: 0.0,
                       maturityDate: "",
                       liquidity: 0,
                       maturityDateInDays: 0,
                       iof: "")
    }
}

struct ProductGenerator {
    static func products() -> [Product] {
        return [
            Product(name: "Tesouro Direto",
                    type: "Selic 2025",
                    rentability: "SELIC + 0.02%",
                    tax: "22.5% a 15% de IR",
                    minimumValue: 102.18,
                    maturityDate: "01-03-2025",
                    liquidity: 1,
                    maturityDateInDays: 1560,
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "Prefixado C/ juros Semestral 2029",
                    rentability: "7.18% a.a.",
                    tax: "22.5% a 15% de IR",
                    minimumValue: 35.74,
                    maturityDate: "01-01-2029",
                    liquidity: 2,
                    maturityDateInDays: 1888,
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "Prefixado 2025",
                    rentability: "5.85% a.a.",
                    tax: "22.5% a 15% de IR",
                    minimumValue: 34.81,
                    maturityDate: "01-03-2022",
                    liquidity: 1,
                    maturityDateInDays: 1200,
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "IPCA+ 2050",
                    rentability: "IPCA + 3.66%",
                    tax: "22.5% a 15% de IR",
                    minimumValue: 46.92,
                    maturityDate: "01-03-2050",
                    liquidity: 3,
                    maturityDateInDays: 2000,
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "IPCA+ 2035",
                    rentability: "IPCA + 3.65%",
                    tax: "22.5% a 15% de IR",
                    minimumValue: 36.73,
                    maturityDate: "15/05/2035",
                    liquidity: 1,
                    maturityDateInDays: 1988,
                    iof: "Isento após 30 dias")
        ]
    }
}
