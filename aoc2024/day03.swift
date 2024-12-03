//
//  day03.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d3() {
    runType = .real
    let ins = inputStrings(sep: "")
    let iw = inputWords()
    let ii = inputInts()
    let ii2 = inputIntWords()
    let ic = inputCharacters()[0]
    let ica = inputCharacters()
//    print(ins)
//    print(iw)
//    print(ii)
//    print(ii2)
    print(ic)
//    print(ica)
    
    var a = 0
    
    var prev = ""
    var n1 = 0
    var n2 = 0
    var en = true
    
    f: for (i, l) in ic.enumerated() {
        if prev == "" {
            if l == "m" {
                prev += "m"
            } else { prev = ""; n1 = 0; n2 = 0 }
        } else if prev == "m" {
            if l == "u" {
                prev += String(l)
            } else { prev = ""; n1 = 0; n2 = 0 }
        } else if prev == "mu" {
            if l == "l" {
                prev += String(l)
            } else { prev = ""; n1 = 0; n2 = 0 }
        } else if prev == "mul" {
            if l == "(" {
                prev += String(l)
            } else { prev = ""; n1 = 0; n2 = 0 }
        } else if prev == "mul(" {
            if l.isNumber {
                n1.append(l)
            } else if l == "," {
                prev += ","
            } else { prev = ""; n1 = 0; n2 = 0 }
        } else if prev == "mul(," {
            if l.isNumber {
                n2.append(l)
            } else if l == ")" {
                if en { a += n1*n2 }
                n1 = 0
                n2 = 0
                prev = ""
            } else { prev = ""; n1 = 0; n2 = 0 }
        }
        if ic.dropFirst(i).starts(with: "do()") { en = true }
        if ic.dropFirst(i).starts(with: "don't()") { en = false }
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
