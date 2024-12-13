//
//  day13.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d13() {
    runType = .all
    let ii2 = inputIntWords(sep: ["\n", " ", "+", ",", "="], line: "\n\n")
    
    var a1 = 0
    var a2 = 0
    
    for l in ii2 {
        let a = l[0].d
        let b = l[2].d
        let c = l[1].d
        let d = l[3].d
        let x = l[4].d
        let y = l[5].d
        
        let f1 = (x - y*(b/d))/(a - c*(b/d))
        let s1 = (x - y*(a/c))/(b - d*(a/c))
        let f2 = (x + 10000000000000 - (y + 10000000000000)*(b/d))/(a - c*(b/d))
        let s2 = (x + 10000000000000 - (y + 10000000000000)*(a/c))/(b - d*(a/c))
        if f1.nearInt() && s1.nearInt() {
            a1 += (f1*3 + s1).nearest()
        }
        if f2.nearInt() && s2.nearInt() {
            a2 += (f2*3 + s2).nearest()
        }
    }
    
    printAnswer(a1, test: 480, real: 28262)
    printAnswer(a2, test: 875318608908, real: 101406661266314)
}
