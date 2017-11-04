//
//  SGObjectEntity.swift
//  StarGazr
//
//  Created by Oren Leavitt on 4/19/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import Foundation
import CoreData

let kNumHYGFields = 37

class SGObjectEntity: NSManagedObject {

    func populateFromCSV(_ csvValues:[String]?) {
        
        guard let values = csvValues, csvValues?.count == kNumHYGFields else { return }
        
        self.id = NumberFormatter().number(from: values[0])
        self.proper = values[6]
        self.ra = NumberFormatter().number(from: values[7])
        self.dec = NumberFormatter().number(from: values[8])
        self.dist = NumberFormatter().number(from: values[9])
        self.mag = NumberFormatter().number(from: values[13])
        self.absmag = NumberFormatter().number(from: values[14])
        self.spect = values[15]
    }

    func shortDescription() -> String {
        let id = self.id ?? -1
        let name = self.proper ?? ""
        let ra = self.ra ?? 0.0
        let dec = self.dec ?? 0.0
        let mag = self.mag ?? 0.0
        let dist = self.dist ?? 0.0
        
        return "\(id) \(name) ra/dec: \(ra) \(dec) mag: \(mag) dist: \(dist)"
    }
}
