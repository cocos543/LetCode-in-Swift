//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var p1 = l1, p2 = l2
        //carry
        var p = head, c = 0;
        
        while p1 != nil || p2 != nil || c != 0 {
            let add1 = p1 == nil ? 0: p1!.val
            let add2 = p2 == nil ? 0: p2!.val
            let s = add1 + add2 + c
            p.next = ListNode(s % 10)
            p = p.next!
            c = s / 10
           
            if p1 != nil {
                p1 = p1!.next
            }
            
            if p2 != nil {
                p2 = p2!.next
            }
        }
        return head.next;
    }
}

let node1 = ListNode(3)
let node2 = ListNode(5)
let node3 = ListNode(3)

node1.next = node2
node2.next = node3

let node11 = ListNode(7)
let node22 = ListNode(1)
let node33 = ListNode(1)

node11.next = node22
node22.next = node33

let solution = Solution()
print(solution.addTwoNumbers(node1, node11) ?? "无数据")


