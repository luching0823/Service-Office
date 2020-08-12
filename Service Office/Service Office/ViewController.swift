//
//  ViewController.swift
//  Service Office
//
//  Created by 廖昱晴 on 2020/7/21.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WKUIDelegate{
    @IBOutlet weak var webView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.webView.uiDelegate = self
    }


}

