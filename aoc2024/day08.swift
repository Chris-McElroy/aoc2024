//
//  day08.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d8() {
    runType = .all
    let ins = inputStrings()
    
    var a1 = 0
    var a2 = 0
    
    var an1 = PS()
    var an2 = PS()
    
    var pd: [Character: [C2]] = [:]
    
    f: for p in ins.points() where ins[p] != "." {
        pd[ins[p], default: []].append(p)
    }
    
    for p in pd.values {
        for pair in p.uniqueCombinations(of: 2) {
            var off = pair[0] - pair[1]
            var po = pair[0]
            var one = true
            while po.inBounds(of: ins) {
                if one && !p.contains(po) {
                    one = false
                    an1.insert(po)
                }
                an2.insert(po)
                po += off
            }
            off = .zero - off
            po = pair[1]
            one = true
            while po.inBounds(of: ins) {
                if one && !p.contains(po) {
                    one = false
                    an1.insert(po)
                }
                an2.insert(po)
                po += off
            }
        }
    }
    
    a1 = an1.count
    a2 = an2.count
    
    printAnswer(a1, test: 14, real: 313)
    printAnswer(a2, test: 34, real: 1064)
}
