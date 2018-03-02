//
//  SecondViewController.swift
//  Day9
//
//  Created by MacStudent on 2018-03-02.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import AVKit

class SecondViewController: UIViewController {

    var video = AVPlayer()
    var videoPlayer = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayAction(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "Toronto", ofType: "mp4") {
            self.video = AVPlayer(url: URL(fileURLWithPath: path))
            self.videoPlayer = AVPlayerViewController()
            self.videoPlayer.player = video
            
            self.present(self.videoPlayer, animated: true, completion: {self.video.play()})
        }
    }
    
}

