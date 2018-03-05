//
//  Solution_Longest_Palindromic_Substring.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/8/3.
//  Copyright © 2017年 Cocos. All rights reserved.
//


import Foundation

/*
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example:
 
 Input: "babad"
 
 Output: "bab"
 
 Note: "aba" is also a valid answer.
 Example:
 
 Input: "cbbd"
 
 Output: "bb"
 
 */

//
//class Solution {
//    //用来存放奇数回文的中间元素
//    var oddEle : String?
//
//    var palindrome : String = ""
//    var stack    : [String] = []
//    var sTop = -1
//
//    func longestPalindrome(_ s: String) -> String {
//
//
//        //处理特殊情况
//        if s.characters.count == 1 {
//            return s
//        }
//
//        var i = 0
//        var tOddEle : String?
//        var tPalindrome = ""
//        var isFirstMatch = true
//        while i != s.characters.count {
//            // 依次取得元素
//            let ele = String(s[s.index(s.startIndex, offsetBy: i)])
//
//            if self.stack.count == 0 {
//                self.sTop = 0
//                self.stack.append(ele)
//            }else {
//                //与栈比较,若与栈顶相同,或者首次匹配与栈顶-1位置相同,则视为回文开始
//                if self.sTop >= 0 && ele == self.stack[self.sTop] || isFirstMatch == true && self.sTop > 0 && ele == self.stack[self.sTop - 1] {
//                    if isFirstMatch == true && self.sTop > 0 && ele == self.stack[self.sTop - 1] {
//                        tOddEle = self.stack[self.sTop]
//                        self.sTop = self.sTop - 2
//                    }else {
//                        self.sTop = self.sTop - 1
//                    }
//                    tPalindrome.append(ele)
//                    isFirstMatch = false
//                }else {
//                    if tPalindrome == "" {
//                        self.sTop = self.sTop + 1
//                        self.stack.append(ele)
//                    }else {
//                        let arr: [String] = Array(tPalindrome.characters).map{ String($0) }
//                        self.stack.append(contentsOf: arr)
//                        self.sTop = self.stack.count - 1
//
//                        //一个回文串结束之后,与现有回文串比较,只保留最长的回文串, 同时将字符串并入stack中
//                        if let middle = tOddEle {
//                            tPalindrome = "\(String(tPalindrome.characters.reversed()))\(middle)\(tPalindrome)"
//                        }else {
//                            tPalindrome = "\(String(tPalindrome.characters.reversed()))\(tPalindrome)"
//                        }
//
//                        if self.palindrome.characters.count < tPalindrome.characters.count {
//                            self.palindrome = tPalindrome
//                        }
//
//
//                        tOddEle = nil
//                        tPalindrome = ""
//
//                        //此时需要注意,当前位置的字符也有可能是另一个回文串的开始位置,所以需要再次检查
//                        isFirstMatch = true
//                        if self.sTop >= 0 && ele == self.stack[self.sTop] || isFirstMatch == true && self.sTop > 0 && ele == self.stack[self.sTop - 1] {
//                            if isFirstMatch == true && self.sTop > 0 && ele == self.stack[self.sTop - 1] {
//                                tOddEle = self.stack[self.sTop]
//                                self.sTop = self.sTop - 2
//                            }else {
//                                self.sTop = self.sTop - 1
//                            }
//                            tPalindrome.append(ele)
//                            isFirstMatch = false
//                        }else {
//                            self.stack.append(ele)
//                            self.sTop = self.sTop + 1
//                        }
//                    }
//                }
//            }
//            i = i + 1
//        }
//
//        if let middle = tOddEle {
//            tPalindrome = "\(String(tPalindrome.characters.reversed()))\(middle)\(tPalindrome)"
//        }else {
//            tPalindrome = "\(String(tPalindrome.characters.reversed()))\(tPalindrome)"
//        }
//
//        if self.palindrome.characters.count < tPalindrome.characters.count {
//            self.palindrome = tPalindrome
//        }
//
//        return self.palindrome
//    }
//}

/*
let s = Solution()
print(s.longestPalindrome("baaaaa"))
//存在一个BUG, 无法同时满足奇数个重复串和偶数重复串

//adffddffda
//cdebbcaacbbedc

*/
