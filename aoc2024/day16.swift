//
//  day16.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d16() {
    runType = .all
    let ins = inputStrings()
    
    var a = Int.max
    var b: PS = []
//    var cur: [(p: C2, d: C2, s: Int, t: PS)] = []
    let parse = parseMap(ins)
    var paths = traverse(map: parse, from: parse["S"]!.first!, to: parse["E"]!.first!, nWays: nil, updateScore: {
        let c = $0.p.count // assuming at least 2
        if c == 2 {
            if $0.p[1] - $0.p[0] == C2(dir: "E") {
                return 1
            } else {
                return 1001
            }
        } else {
            let oldDir = $0.p[c - 2] - $0.p[c - 3]
            let newDir = $0.p[c - 1] - $0.p[c - 2]
            if oldDir == newDir {
                return $0.s + 1
            } else {
                return $0.s + 1001
            }
        }
    })
    
    for path in paths {
        var dir: P = P(dir: "E")
        var score = path.count - 1
        for pair in path.pairs() {
            if dir != pair[1] - pair[0] {
                dir = pair[1] - pair[0]
                score += 1000
            }
        }
        
        if score > 134588 {
            paths.remove(path)
        }
    }
    
    print(paths.count)
    
    for path in paths {
        for p in path {
            b.insert(p)
        }
    }
    
    a = b.count
    
    printAnswer(a, test: nil, real: 134588)
    copy(a)
}
