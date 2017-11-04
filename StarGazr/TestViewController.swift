//
//  TestViewController.swift
//  StarGazr
//
//  Created by Oren Leavitt on 3/28/16.
//  Copyright © 2016 Oren Leavitt. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet fileprivate weak var busyIndicatorView: UIView!
    @IBOutlet fileprivate weak var busyLabel: UILabel!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet fileprivate weak var versionLabel: UILabel!
    @IBOutlet fileprivate weak var outputLabel: UILabel!
    
    fileprivate var appName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appInfo = Bundle.main.infoDictionary! as Dictionary<String,AnyObject>
        appName = appInfo["CFBundleName"] as! String
        versionLabel.text = appVersionString()
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataCreated), name: NSNotification.Name(rawValue: SkyMapDataSource.CreatedNotification), object: nil)
        
        outputLabel.text = ""
        showBusy()
        DataInitializer.unpackTextDataFromBundle("HYGData")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func appVersionString() -> String {
        let shortVersionString = UIApplication.appVersion()
        let build = UIApplication.appBuild()
        return NSLocalizedString("\(appName) v\(shortVersionString).\(build)", comment: "App version info format")
    }
    
    func dataCreated() {
        debugPrint("dataCreated")
        DispatchQueue.main.async { [weak self] in
            if SkyMapDataSource.sharedInstance.objects.count > 0 {
                var text = "\(SkyMapDataSource.sharedInstance.objects.count) objects in database."
                for (index, obj) in SkyMapDataSource.sharedInstance.objects.enumerated() {
                    text += "\n\(obj.shortDescription())"
                    if index == 40 {
                        break
                    }
                }
                self?.outputLabel.text = text
            } else {
                self?.outputLabel.text = "No data!"
            }
            self?.hideBusy()
        }
    }
    
    func showBusy() {
        outputLabel.isHidden = true
        busyIndicatorView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideBusy() {
        activityIndicator.stopAnimating()
        busyIndicatorView.isHidden = true
        outputLabel.isHidden = false
    }
}
