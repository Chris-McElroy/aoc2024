//
//  day17.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d17() {
    runType = .all
    let ii2 = inputIntWords(sep: [" ", ","])
    
    var A = ii2[0][0]
    var B = ii2[1][0]
    var C = ii2[2][0]
    var ins = ii2[4]
    var p = 0
    var out: [Int] = []
    
    while p.isin(0..<(ins.count - 1)) {
        let opcode = ins[p + 1]
        switch ins[p] {
        case 0:
            A = A/(1 << combo(opcode))
        case 1:
            B = B ^ opcode
        case 2:
            B = combo(opcode) % 8
        case 3:
            if A != 0 {
                p = opcode
                continue
            }
        case 4:
            B = B ^ C
        case 5:
            out.append(combo(opcode) % 8)
        case 6:
            B = A/(1 << combo(opcode))
        case 7:
            C = A/(1 << combo(opcode))
        default: break
        }
        p += 2
    }
    
    func combo(_ op: Int) -> Int {
        if op < 4 {
            return op
        }
        if op == 4 {
            return A
        } else if op == 5 {
            return B
        } else if op == 6 {
            return C
        }
        return 0
    }
    
    let a1 = out.map { String($0) }.joined(separator: ",")

    var possA: [Int] = [0]
    while !ins.isEmpty {
        var newPossA: [Int] = []
        for a in possA {
            for newA in 0..<8 {
                let b = newA ^ 1
                if ins.last! == ((b ^ (((a*8 + newA)/(1 << b)) % 8)) ^ 6) {
                    newPossA.append(a*8 + newA)
                }
            }
        }
        possA = newPossA
        ins.removeLast()
    }
    
    let a2 = possA.min() ?? 0
    
    // note that test cases for part 1 and 2 are different, and that i haven't set up for part 2 testing here
    printAnswer(a1, test: "4,6,3,5,6,3,5,2,1,0", real: "2,7,2,5,1,2,7,3,7")
    printAnswer(a2, test: nil, real: 247839002892474)
}
