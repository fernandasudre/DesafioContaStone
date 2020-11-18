//
//  FactCell.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 14/11/20.
//

import UIKit


class FactCell: UITableViewCell {
    ///
    weak var viewController: ViewController?
    ///Fact Label
    @IBOutlet weak var factText: UILabel!
    ///Share Button
    @IBOutlet weak var button: UIButton!
    ///Category Label
    @IBOutlet weak var category: UILabel!
    /// String that will receive the id of the fact
    var id: String = ""
    ///Base url
    var url = "https://api.chucknorris.io/jokes/"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    ///Function that assembles the url that will be shared and present the view to share
    @IBAction func shareButton(_ sender: Any) {
        guard let data = URL(string: "\(url)\(id)") else { return }
        print(data)
        let ac = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true, completion: nil)
        

        
    }
}
