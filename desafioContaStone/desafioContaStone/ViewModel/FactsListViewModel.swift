//
//  FactsListViewModel.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation
import RxSwift

final class FactsListViewModel{
    ///Title of the view
    let title = "Chuck Norris Facts"
    
    ///Instance of Fact Service
    private let factService = FactService()
   
    

    ///Function that maps all of the elements of the search
    func  fetchFactViewModels(search term: String) -> Observable<[FactViewModel]>{
        factService.fetchFacts(search: term).map{ $0.map{
            FactViewModel(fact: $0)
        }}
    }

}
