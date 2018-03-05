//
//  Solution_Reverse_Integer.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/5.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_Reverse_Integer {
    func reverse(_ x: Int) -> Int {
        var revX = 0
        var vX: Int
        if x > 0 {
            vX = x
            while vX > 0 {
                if revX != 0 {
                    revX *= 10
                }
                revX += vX % 10
                vX /= 10
            }
        }else if x < 0 {
            vX = -x
            while vX > 0 {
                if revX != 0 {
                    revX *= 10
                }
                revX += vX % 10
                vX /= 10
            }
            revX = -revX
        }
        
        if revX > Int32.max || revX < Int32.min {
            return 0
        }else {
            return revX
        }
    }
}

//let s = Solution()
//print(s.reverse(-1534236469))
//print(s.reverse(1534))
//print(s.reverse(0))

