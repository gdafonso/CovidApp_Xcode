//
//  WebViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 30/01/2021.
//

import Foundation
import UIKit
import WebKit

class WebViewController2: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView = WKWebView(frame: CGRect.zero)
                webView.navigationDelegate = self
                webView.uiDelegate = self
                
                webViewContainer.addSubview(webView)
                
                activityIndicator = UIActivityIndicatorView()
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
                activityIndicator.style = UIActivityIndicatorView.Style.medium
                webViewContainer.addSubview(activityIndicator)
                
        webView.load(URLRequest(url: (URL(string: "https://www.google.es") ?? URL(string: "https://www.google.es"))!))
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
        
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
