//
//  FactRepository.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 15/11/20.
//

import Foundation
import RxSwift
class FactRepository {
    private let factService = FactService()
    private let baseURL = "https://api.chucknorris.io/jokes/search?query="
    func getRepos() -> Observable<[Fact]>{
        return factService.execute(url: URL(string: baseURL+"dev")!)
    }
//    func getFacts(fact: String, category: String, id:String) -> Observable<[FactId]>{
////        return factService.execute(url: URL(string: "\(baseURL)\(id)")!)
//        
//    }
}
