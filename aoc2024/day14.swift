//
//  day14.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d14() {
    runType = .real
    // TODO make a smart input function
    var ii2 = inputIntWords(sep: [" ", "+", ",", "="], line: "\n").map { [C2($0[0], $0[1]), C2($0[2], $0[3])] }
    
    var a1 = 0
    var a2 = 0
    var x = (runNumber == 1 && runType != .real) ? 11 : 101
    var y = (runNumber == 1 && runType != .real) ? 7 : 103
    
    f: for i in 0..<100000 {
        for (j, pv) in ii2.enumerated() {
            ii2[j][0] = (pv[0] + pv[1])
            // TODO here i want to have a way to wrap c2 by an array, by another c2, and by two numbers given separately
            // i made int mod() function
            // maybe make it for double
        }
        
        if ii2.map({ $0 } ).allUnique() {
            print("hi!", i)
// this is where a2 is assigned, break
        }
    }
    
    var quads = [0, 0, 0, 0]
    
    // TODO find a way to do negative math better
//    for aj in ii2 {
//        if aj[0] < x/2 {
//            if aj[1] < y/2 {
//                quads[0] += 1
//            } else if aj[1] > y/2 {
//                quads[1] += 1
//            }
//        } else if aj[0] > x/2 {
//            if aj[1] < y/2 {
//                quads[2] += 1
//            } else if aj[1] > y/2 {
//                quads[3] += 1
//            }
//        }
//    }
    
    
    a1 = quads.product()
    
    printAnswer(a1, test: nil, real: nil)
    printAnswer(a2, test: nil, real: 6446) // not sure what test should be lol
}
