//
//  day09.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d9() {
    runType = .real
    let ins = inputStrings()
    
    var a1 = 0
    var s1: [Int] = []
    var free: [I] = []
    var f2: [I: I] = [:]
    var real = true
    var n = 0
    
    for c in ins[0] {
        if real {
            s1 += Array(repeating: n, count: Int(c)!)
            n += 1
        } else {
            free.append(contentsOf: s1.count..<(s1.count + Int(c)!))
            f2[s1.count] = Int(c)!
            s1 += Array(repeating: -1, count: Int(c)!)
            
        }
        real.toggle()
    }
    
    var s2 = s1
    var a2 = 0
    
    // part 1
    var f = 0
    var i = s1.count - 1
    
    while s1[i] == -1 {
        i -= 1
    }
    while free[f] < i {
        s1[free[f]] = s1[i]
        i -= 1
        f += 1
        while s1[i] == -1 {
            i -= 1
        }
    }
    
    for (i, v) in s1.first(i + 1).enumerated() {
        a1 += i*v
    }
    
    // part 2 TODO make this faster, i think i can store f2 in a smarter way
    for b in (0...s2.max()!).reversed() {
        let bi = s2.firstIndex(of: b)!
        let bc = s2.lastIndex(of: b)! - bi + 1
        print(b, bi, bc)
//        print(s2)
//        print(f2)
//        print()
        if let ni = f2.filter({ $0.value >= bc && $0.key < bi }).min(by: { $0.key < $1.key }) {
            for c in 0..<bc {
                s2[c + ni.key] = b
                s2[c + bi] = -1
            }
            f2[ni.key] = nil
            if ni.value > bc {
                f2[ni.key + bc] = ni.value - bc
            }
        }
    }
    
//    print(s2)
    
    for (i, v) in s2.enumerated() {
        if v != -1 {
            a2 += i*v
        }
    }
    
    printAnswer(a1, test: 1928, real: 6323641412437)
    printAnswer(a2, test: 2858, real: 6351801932670)
    copy(a2)
}
