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
    var factText: String = ""
    var category: String = ""
    var id: String = ""
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var factTableView: UITableView!
    let disposeBag = DisposeBag()
    private var viewModel: FactsListViewModel!
    let factService = FactService()
    
    static func instantiate(viewModel:FactsListViewModel) -> ViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        factTableView.tableFooterView = UIView()
        factTableView.allowsSelection = false
        navigationItem.title = viewModel.title

        
    }

    @IBAction func searchButton(_ sender: Any) {
        factService.search = searchTextField.text!
        getFacts()
       
    }
    ///Function that sends the text to make the search.
    func getFacts(){
        factTableView.dataSource = nil
        factTableView.delegate = nil
        viewModel.fetchFactViewModels(search: searchTextField.text!).observeOn(MainScheduler.instance).bind(to: factTableView.rx.items(cellIdentifier: "cell",cellType: FactCell.self)){
            index,viewModel,cell in
            cell.factText.text = viewModel.factText
            if self.factText.count <= 80 {
                cell.factText?.font = UIFont.systemFont(ofSize: 30)
            }else{
                cell.factText?.font = UIFont.systemFont(ofSize: 15)
            }
            cell.category.text = viewModel.categoryText
            cell.id = viewModel.id
        
        }.disposed(by: disposeBag)
    }



    
}

