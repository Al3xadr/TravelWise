//
//  AlertHelper.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

import UIKit

class AlertHelper {
    static func showAlert(in viewController: UIViewController, withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
