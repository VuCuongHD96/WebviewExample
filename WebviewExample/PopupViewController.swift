//
//  PopupViewController.swift
//  WebviewExample
//
//  Created by Sun on 27/05/2022.
//

import UIKit
import WebKit

class PopupViewController: UIViewController {

    var webview = WKWebView()
    let presentTransition = WebPresentTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webview.frame = view.bounds
        view.addSubview(webview)
    }
}

extension PopupViewController: UIViewControllerTransitioningDelegate {

    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentTransition
    }
}
