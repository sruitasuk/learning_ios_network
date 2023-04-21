//
//  ViewController.swift
//  SampleNetwork1
//
//  Created by Sruit Angkavanitsuk on 21/4/2566 BE.
//

// sample how to connect website via webview

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var wv: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bConnect(_ sender: Any) {
        wv.load(URLRequest(url: URL(string:  "https://www.bluewindsolution.com/en/")!))
    }
    
}

