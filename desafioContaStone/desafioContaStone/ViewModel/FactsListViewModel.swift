//
//  FactsListViewModel.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation
import RxSwift

final class FactsListViewModel{
    let title = "Chuck Norris Facts"
    
    private let factService = FactService()
    private let baseURL = "https://api.chucknorris.io/jokes/random"
    
//    init(factService: factservice) {
//        self.factService = factService
//    }
    
    func  fetchFactViewModels() -> Observable<[FactViewModel]>{
        factService.fetchFacts().map{ $0.map{
            FactViewModel(fact: $0)
        }}
    }
//    func getFacts() -> Observable<[Fact]>{
//        return factService.execute(url: URL(string: baseURL)!)
//    }
    
}
