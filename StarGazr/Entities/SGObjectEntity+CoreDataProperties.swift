//
//  SGObjectEntity+CoreDataProperties.swift
//  StarGazr
//
//  Created by Oren Leavitt on 4/19/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SGObjectEntity {

    @NSManaged var id: NSNumber?
    @NSManaged var proper: String?
    @NSManaged var ra: NSNumber?
    @NSManaged var dec: NSNumber?
    @NSManaged var dist: NSNumber?
    @NSManaged var mag: NSNumber?
    @NSManaged var absmag: NSNumber?
    @NSManaged var spect: String?

}
