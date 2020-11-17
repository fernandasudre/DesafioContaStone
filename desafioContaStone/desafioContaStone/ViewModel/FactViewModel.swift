//
//  FactViewModel.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation

struct FactViewModel{
    private let fact: Fact
    var factText: String{
        return fact.fact!
    }
    var categoryText: String{
        
        return fact.category.capitalized ?? "Uncategorized"
    }
    
    var id: String{
        
        return fact.id!
    }
    init(fact: Fact) {
        self.fact = fact
    }
}
