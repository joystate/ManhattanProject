//
//  PaymentViewController.swift
//  ManhattanProject
//
//  Created by Nadia on 4/8/18.
//  Copyright © 2018 Nadia. All rights reserved.
//

import UIKit
import WebKit

class PaymentViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var webView: WKWebView!
    
    private var url: URL?
    
    class func create(withUrl url: String) -> PaymentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController
        vc?.url = URL(string: url)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let url = url else {
            return
        }
        print("called")
        if webView == nil {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: webViewContainer.frame, configuration: webConfiguration)
            webViewContainer.addSubview(webView!)
            webView.alpha = 0
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.3, animations: {
            self.webView.alpha = 1
        }) { _ in
            self.spinner.stopAnimating()
        }
    }

    @IBAction func didTapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
