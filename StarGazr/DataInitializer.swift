//
//  DataInitializer.swift
//  StarGazr
//
//  Created by Oren Leavitt on 3/28/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import Foundation
import UIKit


open class DataInitializer {
    
    static let DataUnpackedNotification:String = "SGDataInitializerDataUnpackedNotification"
    class func unpackTextDataFromBundle(_ name:String) {

        DispatchQueue.global().async {
            var csvDataString:String?
            if let asset = NSDataAsset(name: name) {
                let data = asset.data
                debugPrint("Data length: \(data.count)")
                csvDataString = String(data:data, encoding: String.Encoding.utf8)
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: DataUnpackedNotification), object: nil)
            
            if let validCSVDataString = csvDataString {
                SkyMapDataSource.createFromCSV(validCSVDataString)
            }
        }
    }
}
