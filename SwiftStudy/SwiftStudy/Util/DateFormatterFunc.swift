//
//  DateFormatterFunc.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/14.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

public let kDefaultDateFormat: String = "yyy-MM-dd HH:mm:ss"

//获取当前时间
func getCurrentTime() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = kDefaultDateFormat
    let dateStr = dateFormatter.string(from: Date())
    return dateStr
}

//根据时间格式获取当前时间
func getCurrentTimeWithDateFoematter(dateFormat: String) -> String  {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat.validString() == true ? kDefaultDateFormat : dateFormat
    let dateStr = dateFormatter.string(from: Date())
    return dateStr
}


/**
*  根据输入的时间格式及时间字符串获取日期date
*
*  @param dateStr 时间字符串
*  @param format  输入的时间格式
*
*  @return 日期
*/
func getDateFormDateStr(dateStr: String, format: String) -> Date {
    var format_new: String = format
    if format_new.validString() == true {
        format_new = kDefaultDateFormat
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format_new
    let resultDate = dateFormatter.date(from: dateStr) ?? Date()
    return resultDate
}

//根据传入的时间字符串和格式,返回时间字符串
func getDateSringWithDateFoematter(dateFormat: String, dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat.validString() == true ? kDefaultDateFormat : dateFormat
    let date = getDateFormDateStr(dateStr: dateString, format: "yyyyMMddHHmmss")
    let dateStr = dateFormatter.string(from: date)
    return dateStr
}

class DateFormatFunc: NSObject {

     
}
