//
//  day02.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d2() {
    runType = .all
    let input = inputIntWords()
    var a1 = 0
    var a2 = 0
    
    for l in input {
        a1 += safeReport(l).int
        a2 += l.removeNElements(1).any(where: { safeReport($0) }).int
    }
    
    func safeReport(_ report: [Int]) -> Bool {
        let dif = report.allPairs(satisfy: { ($0 - $1).abs.isin(1...3) })
        let ord = report.sorted().isin(report, report.r)
        return dif && ord
    }
    
    printAnswer(a1, test: 2, real: 598)
    printAnswer(a2, test: 4, real: 634)
}
