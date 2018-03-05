//
//  ContactVC.swift
//  Day9CollectionTabBar
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import MessageUI
import CallKit

class ContactVC: UIViewController,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnMsg: UIButton!
    @IBOutlet weak var btnMail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionCall(_ sender: UIButton) {
        print("calling....")
        let url = URL(string: "tel://+11231231231")
        
        if UIApplication.shared.canOpenURL(url!){
            if #available(iOS 10, *) {
                    UIApplication.shared.canOpenURL(url!)
            }
            else {
                UIApplication.shared.canOpenURL(url!)
            }
        }
            
    }
    
    @IBAction func btnTextAction(_ sender: UIButton) {
        print("Messaging...")
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hello, How are you?"
            messageVC.recipients = ["+11231231231"]
            messageVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            self.present(messageVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnActionMail(_ sender: UIButton) {
        print("sending Mail....")

        if MFMailComposeViewController.canSendMail() {
            let EmailPicker = MFMailComposeViewController()

            EmailPicker.mailComposeDelegate = self
            EmailPicker.setSubject("Test Mail")
            EmailPicker.setMessageBody("Hello", isHTML: true)
            self.present(EmailPicker, animated: true, completion: nil)
        }
            
        else {
            print("cant send mail")
        }
    }
    
    func mailCompassController(controller: MFMailComposeViewController,didFinishWithResult:MFMailComposeViewController, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
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
