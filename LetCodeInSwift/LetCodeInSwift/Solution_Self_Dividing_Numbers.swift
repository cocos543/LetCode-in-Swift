//
//  Solution_Self_Dividing_Numbers.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/9.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_Self_Dividing_Numbers {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        //先把数组列出来
        let arr = [Int](left...right)
        var sdArr = [Int]()
        for n in arr {
            var m = n
            while m > 0 {
                let r = m % 10
                // 被除数不能包含0
                guard r != 0 && n % r == 0 else {
                    break
                }
                m = m / 10
            }
            if m == 0 {
                sdArr.append(n)
            }
        }
        
        return sdArr
    }
}

//let arr = Solution().selfDividingNumbers(1, 50)
//print(arr)

