//
//  ViewController.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController{
    ///String that will receive the fact text
    var factText: String = ""
    ///String that will receive the category text
    var category: String = ""
    ///String that will receive the id text
    var id: String = ""
    ///Search text field
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    ///Facts table view
    @IBOutlet weak var factTableView: UITableView!
    ///
    let disposeBag = DisposeBag()
    private var viewModel: FactsListViewModel!
    let factService = FactService()
    /// Int to the number of characters that will change the value of the font size
    let characterLimit = 80
    /// Font size
    let smallerFont = 15
    /// Font size
    let biggerFont = 30
    
    
    
    ///Instantiate the view
    static func instantiate(viewModel:FactsListViewModel) -> ViewController{
        
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    /// When the view loads sets some caracterists of the table view. Hides elements that should not be shown and uses UserDefaults to verify if it's the first time the user acesses the app.
    override func viewDidLoad() {
        super.viewDidLoad()
        factTableView.tableFooterView = UIView()
        factTableView.allowsSelection = false
        navigationItem.title = viewModel.title
        self.hideKeyboardWhenTappedAround()
        
        //UserDefaults to verify if is the first time the app was build. Hides elements of the view that should not be seen
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            
            factTableView.isHidden = false
            searchTextField.isHidden = false
            searchButton.isHidden = false
            startButton.isHidden = true
            
        } else {
            factTableView.isHidden = true
            searchTextField.isHidden = true
            searchButton.isHidden = true
            startButton.isHidden = false
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
    }
    
/// Function that when the button is clicked shows the main view elements.
    @IBAction func startButton(_ sender: Any) {
        startButton.isHidden =  true
        factTableView.isHidden = false
        searchTextField.isHidden = false
        searchButton.isHidden = false
    }
    ///Function that sets the text that it's going to be searched and calls the function that fetch the facts
    @IBAction func searchButton(_ sender: Any) {
        
        if !self.searchTextField.text!.isEmpty{
            factService.search = searchTextField.text!
            getFacts()
        }
        
       
    }
    
    ///Function that sends the text to make the search. Bind the data fetched to table view cells.  Check amount of characters and sets the font size according to the size of the string.
    func getFacts(){
        factTableView.dataSource = nil
        factTableView.delegate = nil
        
        //Fetchs the facts and bind the information to the cell
        viewModel.fetchFactViewModels(search: searchTextField.text!).observeOn(MainScheduler.instance).bind(to: factTableView.rx.items(cellIdentifier: "factCell",cellType: FactCell.self)){
            index,viewModel,factCell in

            factCell.factText.text = viewModel.factText
            //Check the number of characters
            if viewModel.factText.count <= self.characterLimit {
                factCell.factText?.font = UIFont.systemFont(ofSize: CGFloat(self.biggerFont))
            }else{
                factCell.factText?.font = UIFont.systemFont(ofSize: CGFloat(self.smallerFont))
            }
            factCell.category.text = viewModel.categoryText
            factCell.id = viewModel.id
            
        }.disposed(by: disposeBag)
        factTableView.reloadData()
    }



    
}

