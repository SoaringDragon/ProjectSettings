//
//  DateExtension.swift
//  ProjectSettingsSwift
//
//  Created by GK on 16/3/27.
//  Copyright © 2016年 GK. All rights reserved.
//

import Foundation

extension NSDate {
    
    //所传入的日期距 当前日期 多少年
    func yearsFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: NSCalendarOptions()).year
        
    }
    //所传入的日期距 当前日期 多少月
    func monthsFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: NSCalendarOptions()).month
    }
    
    //所传入的日期距 当前日期 多少周
    func weeksFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: NSCalendarOptions()).weekOfYear
    }
    
    //所传入的日期距 当前日期 多少日
    func daysFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: NSCalendarOptions()).day
    }
    
    //所传入的日期距 当前日期 多少小时
    func hoursFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: NSCalendarOptions()).hour
    }
    
    //所传入的日期距 当前日期 多少分钟
    func minutesFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: NSCalendarOptions()).minute
    }
    
    //所传入的日期距 当前日期 多少秒
    func secondsFrom(date: NSDate) -> Int {
        
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: NSCalendarOptions()).second
    }

   
    var relativeTime: String {
        
        let now = NSDate()
        
        if now.yearsFrom(self) > 0 {
            
            return now.yearsFrom(self).description + "year" + { return now.yearsFrom(self) > 1 ? "s" : ""}() + "ago"
            
        }
        
        if now.monthsFrom(self) > 0 {
            
            return now.monthsFrom(self).description + "month" + {return now.monthsFrom(self) > 1 ? "s" : ""}() + "ago"
        }
        
        if now.weeksFrom(self) > 0 {
            
            return now.weeksFrom(self).description + "week" + { return now.weeksFrom(self) > 1 ? "s" : ""}() + "ago"
            
        }
        
        if now.daysFrom(self) > 0 {
            
            if now.daysFrom(self) == 1 { return "Yesterday"}
            
            return now.daysFrom(self).description + "days ago"
        }
        
        if now.hoursFrom(self) > 0 {
            
            return "\(now.hoursFrom(self)) hour" + { return now.hoursFrom(self) > 1 ? "s" : ""}() + "ago"
            
        }
        
        if now.minutesFrom(self) > 0 {
            
            return "\(now.minutesFrom(self)) minute" + { return now.minutesFrom(self) > 1 ? "s" : ""}() + "ago"
        }
        if now.secondsFrom(self) > 0 {
            
            if now.secondsFrom(self) < 15 {return "Just now"}
            
            return "\(now.secondsFrom(self)) minute" + { return now.secondsFrom(self) > 1 ? "s" : ""}() + "ago"
        }

        
        return ""

    }
    
    
    
    
}