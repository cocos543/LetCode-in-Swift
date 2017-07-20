//
//  Solution_Add_Two_Numbers.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/20.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

class Solution_Add_Two_Numbers {
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
