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
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private var url: URL?
    
    class func create(withUrl url: String) -> PaymentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController
        vc?.url = URL(string: url)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = url else {
            return
        }
        webView.alpha = 0
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
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
