//
//  FactService.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import Foundation
import  RxSwift

protocol FactServiceProtocol{
    func fetchFacts() -> Observable<[Fact]>
}
class FactService{
    var fact: String = ""
    var category: String = ""
    var id: String = ""
//    func execute<T: Decodable>(url: URL) -> Observable<T>{
//
//        return Observable.create{ observer -> Disposable in
//            let task = URLSession.shared.dataTask(with: url) { data,_,_ in
//                guard let data = data, let decoded = try? JSONDecoder().decode(T.self, from: data) else { return }
//                observer.onNext(decoded)
//                observer.onCompleted()
//            }
//            task.resume()
//            return Disposables.create {
//                task.cancel()
//            }
//        }
//    }
    
    func fetchFacts() -> Observable<[Fact]> {
        let url = "https://api.chucknorris.io/jokes/random?category=dev"
        return Observable.create{ observer -> Disposable in

            let task = URLSession.shared.dataTask(with: URL(string: url)!) {
                data, response,error in

                guard let data = data else{
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return //Disposables.create { }
                }
                print(data)

                var json: Any!
                do{
                  
                    json = try JSONSerialization.jsonObject(with: data, options: [])
              
                    if let facts = json as? [String:Any]{
                        self.fact = facts["value"] as? String ?? ""
                        self.category = facts["category"] as? String ?? "Uncategorized"
                        self.id = facts["id"] as? String ?? ""

                    }
//                    observer.onNext(facts)
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
