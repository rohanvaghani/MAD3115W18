//
//  ViewController.swift
//  Day6_2
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStepperValue: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moodsSegment: UISegmentedControl!
    @IBOutlet weak var imgMood: UIImageView!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var lblSliderValue: UILabel!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var lblProgress: UILabel!
    //var moodImages : [UIImage]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myProgressView.progress = 0.0
        lblProgress.text = "\(Int(self.myProgressView.progress * 100))%"
        //self.myProgressTimer = Timer.scheduledTimer(timeInterval: 0.2,                target: self, selector: #selector(self.), userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnStartAction(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func btnStopAction(_ sender: UIButton) {
        activityIndicator.stopAnimating()
    }
    @IBAction func btnStartProgressAction(_ sender: UIButton) {
        self.myProgressView.progress += 0.01
        self.lblProgress.text = "\(Int(self.myProgressView.progress * 100))%"
        
        if self.myProgressView.progress >= 1 {
            //self.progressTimer.invalidate()
        }
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        print("selected: \(moodsSegment.selectedSegmentIndex)")
        //imgMood.image = moodImages[moodsSegment.selectedSegmentIndex]
    }
    @IBAction func myStepperAction(_ sender: UIStepper) {
        lblStepperValue.text = String(myStepper.value)
    }
    
    @IBAction func mySliderAction(_ sender: UISlider) {
        lblSliderValue.text = String(mySlider.value)
    }
}

