//
//  UIApplication+Ext.swift
//  StarGazr
//
//  Created by Oren Leavitt on 3/28/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func appVersion() -> String {
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            return version
        }
        return ""
    }
    
    class func appBuild() -> String {
        if let build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String {
            return build
        }
        return ""
    }
}
