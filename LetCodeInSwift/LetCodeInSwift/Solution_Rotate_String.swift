//
//  Solution_Rotate_String.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/12.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation


class Solution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else {
            return false
        }
        //A字符在匹配B的过程中会不停把第一个字母移动到最右边,一直调换下去,调换(字符串长度)次之后,就回到最初的状态
        //因此如果这个调换的过程中能够出现B字符串的子串时,那么将两个A合在一起之后,必定可以在新的字符串中找到B对应的子串
        let s = A + A
        return s.contains(B)
    }
}


//let s = Solution()
//print(s.rotateString("abcde", "cdeab"))
