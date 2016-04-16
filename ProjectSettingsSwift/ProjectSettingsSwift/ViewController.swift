//
//  ViewController.swift
//  ProjectSettingsSwift
//
//  Created by GK on 16/3/26.
//  Copyright © 2016年 GK. All rights reserved.
//

import UIKit
import Crashlytics
import Optimizely

internal var messageKey =
    OptimizelyVariableKey.optimizelyKeyWithKey("message", defaultNSString: "Hello World!")

internal var reportTimeBlocksKey =
    OptimizelyCodeBlocksKey("reportTimeBlocks", blockNames: ["alert", "button"])

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gregorianCal =  NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)!
        
        
        let date1 = gregorianCal.dateWithEra(1, year: 2014, month:  9, day: 28, hour:  5, minute:  9, second: 0, nanosecond: 0)!
        let date2 = gregorianCal.dateWithEra(1, year: 2015, month: 10, day: 21, hour: 12, minute:  7, second: 0, nanosecond: 0)!
        let date3 = gregorianCal.dateWithEra(1, year: 2015, month: 11, day:  3, hour: 12, minute: 38, second: 0, nanosecond: 0)!
        let date4 = gregorianCal.dateWithEra(1, year: 2015, month: 11, day:  4, hour: 14, minute: 41, second: 0, nanosecond: 0)!
        let date5 = gregorianCal.dateWithEra(1, year: 2015, month: 11, day:  4, hour: 15, minute: 08, second: 0, nanosecond: 0)!
        
        
        let timeOffset1 = date1.relativeTime // "1 year ago"
        let timeOffset2 = date2.relativeTime // "2 weeks ago"
        let timeOffset3 = date3.relativeTime // "Yesterday"
        let timeOffset4 = date4.relativeTime // "27 minutes ago"
        let timeOffset5 = date5.relativeTime // "Just now"
        
        print(timeOffset1)
        print(timeOffset2)
        print(timeOffset3)
        print(timeOffset4)
        print(timeOffset5)

        print(SERVER_URL)
        
        let button = UIButton(type: UIButtonType.RoundedRect)
        button.frame = CGRectMake(20, 50, 100, 30)
        button.setTitle("Crash", forState: UIControlState.Normal)
        button.addTarget(self, action:#selector(ViewController.crashButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)

        Crashlytics.sharedInstance().setObjectValue("Test value", forKey: "Crash")
        
        
        let messageButton1 = UIButton(type: UIButtonType.System)
        messageButton1.setTitle("Show Message", forState: UIControlState.Normal)
        messageButton1.addTarget(self, action: #selector(ViewController.showMessage(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        messageButton1.frame = CGRectMake(25, 60, 200, 50)
        view.addSubview(messageButton1)

        
        let messageButton = UIButton(type: UIButtonType.System)
        messageButton.setTitle("Report Time", forState: UIControlState.Normal)
        messageButton.addTarget(self, action: #selector(ViewController.reportTime(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        messageButton.frame = CGRectMake(25, 400, 300, 50)
        view.addSubview(messageButton)

    }
   
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
    }
    func crashButtonTapped(sender : AnyObject){
        
        Answers.logCustomEventWithName("View controller did load", customAttributes: [
            "Poem" : "Poem Event",
            "Them" : "Them",
            "Length" : "1209",
            "Picture" : "Picture"
            ])

        Crashlytics.sharedInstance().crash()
    }
    @IBAction func showMessage(sender: AnyObject) {
        let alert = UIAlertController(title: "Live Variable",
                                      message: Optimizely.stringForKey(messageKey),
                                      preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: nil))
        presentViewController(alert, animated: true) {}
    }

    @IBAction func reportTime(sender: AnyObject) {
        let message = NSString(format: "It is %@", NSDate()) as String;
        Optimizely.codeBlocksWithKey(reportTimeBlocksKey,
                                     blockOne: {
                                        let alert = UIAlertController(title: "Live Variable",
                                            message: message,
                                            preferredStyle: UIAlertControllerStyle.Alert)
                                        alert.addAction(UIAlertAction(title: "OK",
                                            style: UIAlertActionStyle.Default,
                                            handler: { (action) -> Void in }))
                                        self.presentViewController(alert, animated: true) {}
            },
                                     blockTwo: {
                                        sender.setTitle(message, forState: UIControlState.Normal)
            },
                                     defaultBlock: {
                                        print(message)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

