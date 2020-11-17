//
//  FactService.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation
import  RxSwift

protocol FactServiceProtocol{
    func fetchFacts(search term: String) -> Observable<[Fact]>
}
class FactService: FactServiceProtocol{
    var factText: String = ""
    var category: String = ""
    var id: String = ""
    var fact: Fact?
    var search: String = ""
    var factsArray: [Fact] = []
    

    var url = "https://api.chucknorris.io/jokes/search?query="
    
    static var shared = FactService()
    
///Function that
    func fetchFacts(search term: String) -> Observable<[Fact]> {
        url = "\(self.url)\(term)"
        return Observable.create{ observer -> Disposable in

            let task = URLSession.shared.dataTask(with: URL(string: self.url )!) { [self]
                data, response,error in

                guard let data = data else{
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                do{
                  
                   let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]

                    for fact in json["result"] as! NSMutableArray{
                        
                       
                        self.factText = (fact as AnyObject)["value"] as? String ?? ""
                        self.id = (fact as AnyObject)["id"] as? String ?? ""
                        let category = (fact as AnyObject)["categories"] as? NSArray

                        
                        if category?.count == 0 {
                            self.category = "Uncategorized"
                        }else{
                            self.category = category?.object(at: 0) as! String
                        }
                        let fact = Fact(fact:self.factText, category:  self.category, id: self.id)
        
                        factsArray.append(fact)
                    
                    }
                    
                    observer.onNext(factsArray)
                }catch{
                    observer.onError(error)
                }
            }

            task.resume()
            return Disposables.create {
                task.cancel()
            }
            
            
        }
    }
}
