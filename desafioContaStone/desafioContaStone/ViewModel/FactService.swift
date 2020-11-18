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
    

    ///Base URL
    var url = "https://api.chucknorris.io/jokes/search?query="
    
    static var shared = FactService()

    ///Function that fetchs facts and return and Observable of a fact.
    func fetchFacts(search term: String) -> Observable<[Fact]> {
        
        return Observable.create{ observer -> Disposable in

            self.factsArray.removeAll()
            //Starts a sessions with the url
            let task = URLSession.shared.dataTask(with: URL(string: "\(self.url)\(term)" )!) { [self]
                data, response,error in
                guard let data = data else{
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                do{
                  //Convert the JSON to NSDictionary
                   let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]

                    for fact in json["result"] as! NSMutableArray{
                        
                       //Atributes the fetched elements with the values
                        self.factText = (fact as AnyObject)["value"] as? String ?? ""
                        self.id = (fact as AnyObject)["id"] as? String ?? ""
                        let category = (fact as AnyObject)["categories"] as? NSArray

                        //Check the number of objects in the array of category
                        if category?.count == 0 {
                            self.category = "Uncategorized"
                        }else{
                            self.category = category?.object(at: 0) as! String
                        }
                        //Creates a fact and append it to the array of facts.
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
