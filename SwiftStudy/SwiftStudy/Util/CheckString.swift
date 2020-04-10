//
//  CheckString.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/10.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit


extension String {
    //检测当前字符串是否包含某个字符串
    func contanins(find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

class CheckString: NSObject {

}
