//
//  SGObject.swift
//  StarGazr
//
//  Created by Oren Leavitt on 3/30/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import UIKit

//public protocol SGStarProtocol {
//    var id:Int { get }
//    var proper:String { get }
//    var ra:Double { get }
//    var dec:Double { get }
//    var dist:Double { get }
//    var mag:Double { get }
//    var absmag:Double { get }
//    var spect:String { get }
//    
//    func description() -> String
//}
//
//public class SGObject {
//
//}
//
//public class SGStar : SGObject, SGStarProtocol {
//    
//    public var id: Int = 0
//    public var proper: String = ""
//    public var ra: Double = 0.0
//    public var dec: Double = 0.0
//    public var dist:Double = 0.0
//    public var mag:Double = 0.0
//    public var absmag:Double = 0.0
//    public var spect:String = ""
//    
//    public init?(csvValues:[String]?) {
//    
//        guard let values = csvValues where csvValues?.count == kNumHYGFields else { return nil }
//        
//        if let n = NSNumberFormatter().numberFromString(values[0]) {
//            self.id = n.integerValue
//        }
//        self.proper = values[6]
//        if let n = NSNumberFormatter().numberFromString(values[7]) {
//            self.ra = n.doubleValue
//        }
//        if let n = NSNumberFormatter().numberFromString(values[8]) {
//            self.dec = n.doubleValue
//        }
//        if let n = NSNumberFormatter().numberFromString(values[9]) {
//            self.dist = n.doubleValue
//        }
//        if let n = NSNumberFormatter().numberFromString(values[13]) {
//            self.mag = n.doubleValue
//        }
//        if let n = NSNumberFormatter().numberFromString(values[14]) {
//            self.absmag = n.doubleValue
//        }
//        self.spect = values[15]
//    }
//}