//
//  ViewController.swift
//  AdvancedJsonParsing
//
//  Created by Ilya Cherkasov on 15.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.downloadList()
    }
}

