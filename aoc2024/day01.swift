//
//  day01.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d1() {
    runType = .all
    let input = inputIntWords().transpose().map { $0.sorted() }
    
    var a1 = 0
    var a2 = 0
    
    for l in input.transpose() {
        a1 += abs(l[1] - l[0])
    }
    
    for l in input[0] {
        a2 += l*input[1].count(where: { $0 == l })
    }
    
    printAnswer(a1, test: 11, real: 1765812)
    printAnswer(a2, test: 31, real: 20520794)
}
