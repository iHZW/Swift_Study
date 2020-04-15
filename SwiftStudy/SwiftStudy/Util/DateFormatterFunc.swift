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

//根据传入的时间字符串和格式,返回时间字符串(默认格式)
func getDateSringWithDateFormatter(dateFormat: String, dateString: String) -> String {
    return getDateSringDateFormatterAndReturnDateFormat(dateFormat: dateFormat, dateString: dateString, returnDateFormat: kDefaultDateFormat)
}

//根据传入的时间字符串,格式和返回时间格式, 返回时间字符串
func getDateSringDateFormatterAndReturnDateFormat(dateFormat: String, dateString: String, returnDateFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = returnDateFormat
    let date = getDateFormDateStr(dateStr: dateString, format: dateFormat)
    let dateStr = dateFormatter.string(from: date)
    return dateStr
}


//特殊处理返回时间字符串,业务需求(1:当年的不显示年 2:当天的不显示年月 3:返回默认的时间格式)
func getInfoFormatterDateStringWithDateString(dateFormat: String, dateString: String) -> String {
   
    let dateFormatter = DateFormatter()
    let date = getDateFormDateStr(dateStr: dateString, format: dateFormat)
    
    dateFormatter.dateFormat = "yyyy"
    let currentTimeYear: String = dateFormatter.string(from: Date())
    let newTimeYear: String = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentTimeyMd: String = dateFormatter.string(from: Date())
    let newTimeyMd: String = dateFormatter.string(from: date)
    
    var resultFormat = kDefaultDateFormat
    if currentTimeyMd == newTimeyMd {
        resultFormat = "HH:mm"
    }else if currentTimeYear == newTimeYear {
        resultFormat = "MM-dd HH:mm"
    }
    
    dateFormatter.dateFormat = resultFormat
    let dateStr = dateFormatter.string(from: date)
    return dateStr
    
}


class DateFormatFunc: NSObject {

     
}
