//
//  day07.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d7() {
    runType = .real
    let ii2 = inputIntWords(sep: [" ", ":"])
    
    var a1 = 0
    var a2 = 0
    
    f: for (i, p) in ii2.enumerated() {
        print(i)
        var counter = Array(repeating: 0, count: p.count - 2)
        let pList = p.dropFirst(2).a.enumerated()
        repeat {
            var tot = p[1]
            for (i, v) in pList {
                op(&tot, v, counter[i])
            }
            if tot == p[0] {
                a1 += tot
                a2 += tot
                continue f
            } else if tot > p[0] {
                break
            }
        } while !advanceCounter(&counter, 2)
        counter = Array(repeating: 0, count: p.count - 2)
        repeat {
            var tot = p[1]
            for (i, v) in pList {
                op(&tot, v, counter[i])
            }
            if tot == p[0] {
                a2 += tot
                break
            }
        } while !advanceCounter(&counter, 3)
    }
    
    printAnswer(a1, test: 3749, real: 3598800864292)
    printAnswer(a2, test: 11387, real: 340362529351427)
    
    func op(_ lhs: inout Int, _ rhs: Int, _ t: Int) {
        if t == 0 {
            lhs *= rhs
        } else if t == 1 {
            lhs += rhs
        } else {
            var r = rhs
            while r >= 1 {
                lhs *= 10
                r /= 10
            }
            lhs += rhs
        }
    }
    
    func advanceCounter(_ counter: inout [Int], _ limit: Int) -> Bool {
        var pos = 0
        counter[0] += 1
        while counter[pos] == limit {
            counter[pos] = 0
            pos += 1
            if pos == counter.count { return true }
            counter[pos] += 1
        }
        return false
    }
}
