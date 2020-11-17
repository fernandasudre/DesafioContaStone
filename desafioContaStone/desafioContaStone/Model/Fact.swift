//
//  Fact.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation

struct Fact: Decodable{
    let fact: String?
    let category: Category?
    let id: String?
}
struct FactId:Decodable {
    let text: String
}

enum Category: String, Decodable{
    case animal
    case carrer
    case celebrity
    case dev
    case explicit
    case fashion
    case food
    case history
    case money
    case movie
    case music
    case political
    case religion
    case science
    case sport
    case travel
    case `nil`
    
}
