//
//  ConfigurationManager.swift
//  KVO
//
//  Created by Brandon Aubrey on 2/1/17.
//  Copyright © 2017 Brandon Aubrey. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    
    //MARK: - Properties

    var configuration: Configuration
    
    //MARK: -
    
    lazy private var dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        
        return dateFormatter
    }()
    
    var createdAt: String {
        
        return dateFormatter.string(from: configuration.createdAt as Date)
    }
    
    var updatedAt: String {
        
        return dateFormatter.string(from: configuration.updatedAt as Date)
    }
    
    //MARK: Initializers
    
    init(withConfiguration configuration: Configuration) {
        
        self.configuration = configuration
        
        
        super.init()
        
    }
    
    //MARK: - Public Interface
    
    func updateConfiguration() {
        configuration.updatedAt = Date() as NSDate
    }
}
