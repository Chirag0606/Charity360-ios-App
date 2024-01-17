//
//  ViewController.swift
//  charity360
//
//  Created by user1 on 29/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var participatedSegmentView: UIView!
    
    @IBOutlet weak var completedSegmentView: UIView!
    
    @IBOutlet weak var yourEventsSegmentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.bringSubviewToFront(completedSegmentView)
    }
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(participatedSegmentView)
        case 1:
            self.view.bringSubviewToFront(completedSegmentView)
        case 2:
            self.view.bringSubviewToFront(yourEventsSegmentView)
        default:
            break
        }
    }
    
    
    
    
}






