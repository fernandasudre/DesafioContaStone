//
//  desafioContaStoneTests.swift
//  desafioContaStoneTests
//
//  Created by Fernanda Sudré on 11/11/20.
//

import XCTest
@testable import desafioContaStone

class desafioContaStoneTests: XCTestCase {
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
   
    func testNumberOfCharacters(){
        var string = ""
        let characterLimit = 80
        let biggerFont = 30
        let smallerFont = 15
        var label = UILabel()
        
        if string.count <= characterLimit {
            label.font = UIFont.systemFont(ofSize: CGFloat(biggerFont))
        }else{
            label.font = UIFont.systemFont(ofSize: CGFloat(smallerFont))
        }
    }
    

    func testCategories(){
        var categoryText = ""
        let category: NSMutableArray = []

        if category.count == 0 {
            categoryText = "Uncategorized"
        }else{
            categoryText = category.object(at: 0) as! String
        }
  
    }
        

}
