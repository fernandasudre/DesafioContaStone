//
//  ViewController.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 11/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var factTableView: UITableView!
    let disposeBag = DisposeBag()
    private var viewModel: FactsListViewModel!
    
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
        navigationItem.title = viewModel.title
        viewModel.fetchFactViewModels().observeOn(MainScheduler.instance).bind(to: factTableView.rx.items(cellIdentifier: "cell")){
            index,viewModel,cell in
            cell.textLabel?.text = viewModel.factText
        }.disposed(by: disposeBag)
        
    }


}

