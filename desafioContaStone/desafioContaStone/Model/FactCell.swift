//
//  FactCell.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 14/11/20.
//

import UIKit

protocol ShareProtocol {
    func shareButton(_ sender: Any)
}
class FactCell: UITableViewCell {
    weak var viewController: ViewController?
    @IBOutlet weak var factText: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var category: UILabel!
    var id: String = ""
    var url = "https://api.chucknorris.io/jokes/"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func shareButton(_ sender: Any) {
        guard let data = URL(string: "\(url)\(id)") else { return }
        print(data)
        let ac = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true, completion: nil)
        

        
    }
}
