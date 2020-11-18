//
//  FactViewModel.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation

struct FactViewModel{
    private let fact: Fact
    ///Set the text of the fact
    var factText: String{
        return fact.fact!
    }
    ///Set the category of the fact
    var categoryText: String{
        return fact.category.capitalized ?? "Uncategorized"
    }
    ///Set the id of the fact
    var id: String{
        return fact.id!
    }
    
    ///Initialize one fact
    init(fact: Fact) {
        self.fact = fact
    }
}
