//  UIAlertController.swift
//  TakeHome

//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

//  MARK: - UIAlertController
extension UIViewController {
    
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay!", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
