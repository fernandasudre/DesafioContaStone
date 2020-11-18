//
//  ViewController+KeyboardUtils.swift
//  desafioContaStone
//
//  Created by Fernanda Sudré on 17/11/20.
//

import Foundation
import UIKit
extension UIViewController {
    ///Function that will make the keyboard be dismissed when the view is touched
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    ///Function to dismiss the keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
