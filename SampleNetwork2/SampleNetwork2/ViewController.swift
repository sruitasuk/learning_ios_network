//
//  ViewController.swift
//  SampleNetwork2
//
//  Created by Sruit Angkavanitsuk on 21/4/2566 BE.
//

// sample how to connect to POST API

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bConnect(_ sender: Any) {
        
            
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                let url_request = "https://www.bluewindsolution.com/bu/getData.php"
                let request:NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url_request)!)
                request.httpMethod = "POST"
                // ------------------------
                // if send other than this value, will give other result
                
                // case: correct
                request.httpBody = "u=student&p=student".data(using: .utf8)
                
                // case: incorrect
                //request.httpBody = "u=student&p=1234".data(using: .utf8)
                // ------------------------
                
                let session = URLSession.shared
                let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                    
                    if error != nil {
                        DispatchQueue.main.async(execute: { () -> Void in
                            self.tv.text = "error: \(error)"
                        })
                        return
                    }
                    
                    let rawresult = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                    
                     DispatchQueue.main.async(execute: { () -> Void in
                         self.tv.text = "result: \(rawresult)"
                     })
                }
                task.resume()
            })
    }
    
}

