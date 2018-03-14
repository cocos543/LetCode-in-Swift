//
//  Solution_All_Paths_From_Source_to_Target.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/14.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_All_Paths_From_Source_to_Target {
    
    var allPaths = [[Int]]()
    var graphCount: Int = 0
    
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        graphCount = graph.count
        dfs(graph: graph, node: 0, path: [Int]())
        return allPaths
    }
    
    func dfs(graph: [[Int]], node: Int, path: [Int]) {
        var path = path
        
        //到达终点(n-1)时,结束递归
        if node == graphCount - 1 {
            path.append(node)
            allPaths.append(path)
            return
        }
        //依次访问和node节点相连通的节点
        for e in graph[node] {
            //图的深度搜索算法, 每一个节点依次递归寻找与其相连通的节点
            //递归之前先将当前节点放入path中,若在递归的最后一层发现可以到达终点(n-1),则将path加入allPaths中
            path.append(node)
            dfs(graph: graph, node: e, path: path)
            //这个地方说明一下,递归回退到这儿的时候,需要把上面加入path的节点去掉!
            //因为如果graph[node]还有其他边,那么for循环会继续并且回到上两行代码,node会重新加入path
            path.removeLast()
        }
    }
}

//let s = Solution()
//let paths = s.allPathsSourceTarget([[1,2,5], [3], [], [4], [6], [6,7], [], []])
//print(paths)
