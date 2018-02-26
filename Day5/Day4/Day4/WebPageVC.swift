//
//  WebPageVC.swift
//  Day4
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import WebKit
class WebPageVC: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadWebPage()
        loadManualPage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebPage() {
        let url = URL(string: "https://www.google.com");
        let requestObj = URLRequest(url: url!);
        myWebView.load(requestObj);
    }
    
    func loadManualPage() {
        let localfilepath = Bundle.main.url(forResource: "Pizza", withExtension: "html");
        let myRequest = URLRequest(url: localfilepath!);
        myWebView.load(myRequest);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
