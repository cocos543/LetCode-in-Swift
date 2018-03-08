//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0, y = 0
        for c in moves {
            switch c {
                case "U":
                y += 1
                case "D":
                y -= 1
                case "L":
                x -= 1
                case "R":
                x += 1
                default:break
            }
        }
        return x == 0 && y == 0
    }
}

print(Solution().judgeCircle("LL"))


