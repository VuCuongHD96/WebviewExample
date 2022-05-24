//
//  ViewController.swift
//  WebviewExample
//
//  Created by Sun on 24/05/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webManager = WebviewManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webManager.setupWebview()
    }
}
