//
//  Solution_Complex_Number_Multiplication.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/23.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_Complex_Number_Multiplication {
    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        //去掉最后一个字符...
        let aArr = a[..<a.index(before: a.endIndex)].split(separator: "+")
        let bArr = b[..<b.index(before: b.endIndex)].split(separator: "+")
        
        let a = aArr[0], b = aArr[1]
        let c = bArr[0], d = bArr[1]
        //按照复数乘法公式套进去就好了,公式我百度的.类似多项式相乘,注意 i^2=-1,这个是规定的
        return "\(Int(a)! * Int(c)! - Int(b)! * Int(d)!)+\(Int(a)! * Int(d)! + Int(c)! * Int(b)!)i"
    }
}

//let s = Solution()
//print(s.complexNumberMultiply("1+-1i","0+0i"))

