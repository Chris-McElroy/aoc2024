//
//  day16.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d16() {
//    runType = .all
//    let ins = inputStrings()
//    
//    var a = Int.max
////    var cur: [(p: C2, d: C2, s: Int, t: PS)] = []
//    let parse = parseMap(ins)
//    let paths = traverse(map: parse, from: parse["S"]!.first!, to: parse["E"]!.first!, nWays: 10, pruneScore: {
//        
//    })
//    
//    for path in paths {
//        var dir: P = P(dir: "E")
//        var score = path.count - 1
//        for pair in path.pairs() {
//            if dir != pair[1] - pair[0] {
//                dir = pair[1] - pair[0]
//                score += 1000
//            }
//        }
//        
//        if score < a {
//            a = score
//        }
//    }
////
////    f: for l in ins.points() {
////        if ins[l] == "S" {
////            cur.append((l, C2(1, 0), 0, []))
////            break
////        }
////    }
////    
////    for _ in 0..<3000 {
////        let mina = cur.filter{ ins[$0.p] == "E" }.map { $0.s }.min()
//////        a = min(a, mina ?? Int.max)
////        if (mina ?? Int.max) < a { a = mina ?? Int.max; print(a) }
////        if a == 7036 { break }
//////        print("step", cur.count, cur.count(where: { ins[$0.key[0]] == "E" }), cur.filter{ ins[$0.key[0]] == "E" }.map { $0.value.0 })
////        var newCur: [(p: C2, d: C2, s: Int, t: PS)] = []
////        for boi in cur {
////            if ins[boi.p] == "E" {
////                newCur.append(boi)
////                continue
////            }
////            for adj in boi.p.adjacents where !boi.t.contains(adj) {
////                if ins[adj] != "#" {
////                    if boi.d != adj - boi.p {
////                        let newd = adj - boi.p
//////                        if (newd - boi.key[1]).vectorLength() == 2 { continue }
////                        newCur.append((boi.p, newd, boi.s + 1000, boi.t))
////                    } else {
////                        var newvisit = boi.t
////                        newvisit.insert(boi.p)
////                        newCur.append((adj, boi.d, boi.s + 1, newvisit))
////                    }
////                }
////            }
////        }
////        cur = newCur
////    }
//    
//    
////    a = cur.filter { ins[$0.key[0]] == "E" }.min(by: { $0.value.0 < $1.value.0 })!.value.0
//    
//    printAnswer(a, test: nil, real: nil)
//    copy(a)
//    // not 156504
}
