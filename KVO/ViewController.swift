//
//  ViewController.swift
//  KVO
//
//  Created by Brandon Aubrey on 2/1/17.
//  Copyright © 2017 Brandon Aubrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet var timeLabel: UILabel!
    
    //MARK: -
    
    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    //MARK: Actions
    
    @IBAction func updateConfiguration(_ sender: Any) {
        configurationManager.updateConfiguration()

    }

    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Key-Value Observing
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            
            //update time label
            
            timeLabel.text = configurationManager.updatedAt
        }
    }
    
    //MARK: Deinitialization

    deinit {
        
        removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    
    }
}

