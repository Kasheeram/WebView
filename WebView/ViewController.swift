//
//  ViewController.swift
//  WebView
//
//  Created by Apogee on 7/3/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        let url = URL (string: "http://usa.asystguard.com:81/excel/")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("kashee 123")
        if navigationType == .other  {
            let url = request.url
            
            let fileData = NSData(contentsOf: url!)
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let documentsDirectory = paths[0]
            fileData?.write(toFile: "\(documentsDirectory)/\(String(describing: url?.lastPathComponent))", atomically: true)
        }
        
        return true
    }
    



}

