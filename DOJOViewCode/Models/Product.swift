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
    let minimumValue: String
    let maturityDate: String
    let liquidity: String
    let maturityDateInDays: String
    let iof: String
}

extension Product {
    static func empty() -> Product {
        return Product(name: "",
                       type: "",
                       rentability: "",
                       tax: "",
                       minimumValue: "",
                       maturityDate: "",
                       liquidity: "",
                       maturityDateInDays: "",
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
                    minimumValue: "R$ 102,18",
                    maturityDate: "01/03/2025",
                    liquidity: "D+1",
                    maturityDateInDays: "1988 dias",
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "Prefixado C/ juros Semestral 2029",
                    rentability: "7.18% a.a.",
                    tax: "22.5% a 15% de IR",
                    minimumValue: "R$ 35,74",
                    maturityDate: "01/01/2029",
                    liquidity: "D+1",
                    maturityDateInDays: "1988 dias",
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "Prefixado 2025",
                    rentability: "5.85% a.a.",
                    tax: "22.5% a 15% de IR",
                    minimumValue: "R$ 34,81",
                    maturityDate: "01/03/2022",
                    liquidity: "D+1",
                    maturityDateInDays: "1988 dias",
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "IPCA+ 2050",
                    rentability: "IPCA + 3.66%",
                    tax: "22.5% a 15% de IR",
                    minimumValue: "R$ 46,92",
                    maturityDate: "01/03/2050",
                    liquidity: "D+1",
                    maturityDateInDays: "1988 dias",
                    iof: "Isento após 30 dias"),
            Product(name: "Tesouro Direto",
                    type: "IPCA+ 2035",
                    rentability: "IPCA + 3.65%",
                    tax: "22.5% a 15% de IR",
                    minimumValue: "R$ 36,73",
                    maturityDate: "15/05/2035",
                    liquidity: "D+1",
                    maturityDateInDays: "1988 dias",
                    iof: "Isento após 30 dias")
        ]
    }
}
