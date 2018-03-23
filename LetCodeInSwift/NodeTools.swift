//
//  NodeTools.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/20.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class NodeTools {
    func findPreOne( _ head: ListNode, _ n: ListNode) -> ListNode? {
        guard head != n else {
            return nil
        }
        
        var posNode = head;
        while posNode.next != n {
            //n 不为空, head.next 也不为空
            posNode = posNode.next!
        }
        return posNode;
    }
    
    func findAfterOne(_ head: ListNode, _ n:ListNode) -> ListNode? {
        var posNode = head;
        
        while posNode != n {
            //n 不为空, head.next 也不为空
            posNode = posNode.next!
        }
        return posNode.next;
    }
    
}
