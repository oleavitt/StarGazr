//
//  SkyMapDataSource.swift
//  StarGazr
//
//  Created by Oren Leavitt on 3/30/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import UIKit

open class SkyMapDataSource {
    
    static let CreatedNotification:String = "SGSkyMapDataSourceCreatedNotification"

    var objects:[SGObjectEntity] = []
    
    // Init/deinit
    init() {
        self.objects = []
    }
    
    public convenience init(csvText:String) {
        self.init()
        if SGCoreDataStack.sharedInstance.countOfAllSGObjects() < 1 {
            debugPrint("Building the initial database...")
            var csvTextLines = csvText.components(separatedBy: "\n")
            if csvTextLines.count > 0 {
                let first = csvTextLines.removeFirst() // strip the header names
                debugPrint(first)
                for line in csvTextLines {
                    let csvValues = line.components(separatedBy: ",")
                    let _ = SGCoreDataStack.sharedInstance.newSGObjectEntityFromCSV(csvValues)
                }
                SGCoreDataStack.sharedInstance.saveContext()
            }
            debugPrint("Building the initial database...done!")
        }
        self.objects = SGCoreDataStack.sharedInstance.fetchAllSGObjects()
    }
    
    deinit {
        
    }
    
    // the singleton
    
    static var sharedInstance = SkyMapDataSource()
    
    class func createFromCSV(_ csvText:String) {
        sharedInstance = SkyMapDataSource(csvText: csvText)
        NotificationCenter.default.post(name: Notification.Name(rawValue: CreatedNotification), object: nil)
    }
}
