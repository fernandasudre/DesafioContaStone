//
//  FactCell.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 14/11/20.
//

import UIKit

class FactCell: UITableViewCell {
    let viewController = ViewController()
    @IBOutlet weak var factText: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var category: UILabel!
    var id: String = ""
    var url = "https://api.chucknorris.io/jokes/search?query="
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func shareButton(_ sender: Any) {
//        let items = [URL(string: "\(url)\(id)")!]
//        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        viewController.present(ac, animated: true)
    }
}
