//
//  ViewController.swift
//  ProjectSettingsSwift
//
//  Created by GK on 16/3/26.
//  Copyright © 2016年 GK. All rights reserved.
//

import UIKit

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

