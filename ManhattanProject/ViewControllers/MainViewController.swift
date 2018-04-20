//
//  ViewController.swift
//  ManhattanProject
//
//  Created by Nadia on 4/8/18.
//  Copyright © 2018 Nadia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let oneTimeDonationUrl = "https://horatio.herokuapp.com/forms/67"
    private let monthlyDonationUrl = "https://horatio.herokuapp.com/forms/68"
    // Used for testing
    private let thankYouForm = "https://horatio.herokuapp.com/agreements/rENZyGEKqjCBDO5pkXbfTQ/thank_you"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func loadPaymentVC(withUrl url: String) -> PaymentViewController? {
        return PaymentViewController.create(withUrl: url)
    }
    
    @IBAction func didTapOneTimeButton(_ sender: Any) {
        if let vc = loadPaymentVC(withUrl: oneTimeDonationUrl) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapMonthlyButton(_ sender: Any) {
        if let vc = loadPaymentVC(withUrl: monthlyDonationUrl) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

