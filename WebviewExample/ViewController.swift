//
//  ViewController.swift
//  WebviewExample
//
//  Created by Sun on 24/05/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebview()
    }
    
    private func setupWebview() {
        let config = getConfig()
        webview = WKWebView(frame: view.bounds, configuration: config)
        
        webview.navigationDelegate = self
        webview.backgroundColor = .green
        let request = getRequest()
        webview.load(request)
        let javaScript = "window.addEventListener('message', function(e){ webkit.messageHandlers.sumbitToiOS.postMessage(event.data); })"
        webview.evaluateJavaScript(javaScript)
        view.addSubview(webview)
    }
    
    private func getRequest() -> URLRequest {
        let urlString = "https://t1.mobio.vn/static/1b99bdcf-d582-4f49-9715-1b61dfff3924/upload/628c428a9e25658d6ab2a5a4.html"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            return request
        } else {
            let url = URL(string: "https://www.google.com/")!
            let request = URLRequest(url: url)
            return request
        }
    }
    
    private func getConfig() -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        contentController.add(self, name: "sumbitToiOS")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        return config
    }
}


extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        print("------------Start load")
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        print("-----------Finished navigating to url \(String(describing: webView.url))")
        webview.evaluateJavaScript("showPopup('\(123)')") { (any, error) in
            print("Error : \(String(describing: error))")
        }
    }
}

extension ViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("---------- debug -------- message =  ", message.body)
    }
}
