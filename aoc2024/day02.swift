//
//  day02.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d2() {
    runType = .real
    let ins = inputStrings()
    let iw = inputWords()
    let ii = inputInts()
    let ii2 = inputIntWords()
    let ic = inputCharacters()[0]
    let ica = inputCharacters()
//    print(ins)
//    print(iw)
//    print(ii)
//    print(ii2)
//    print(ic)
//    print(ica)
    
    var a = 0
    
    f: for var l in ii2 {
        var anyTrue = false
        let oldL = l
        for j in 0..<l.count {
            l = oldL
            l.remove(at: j)
            
            
            var inc = true
            var dec = true
            var dif = true
            var p = l.first!
            for i in l.dropFirst() {
                if i >= p { dec = false }
                if i <= p { inc = false }
                if !abs(i-p).isin(1..<4) { dif = false }
                p = i
            }
            if dif && (inc || dec) {
                anyTrue = true
            }
        }
        l = oldL
        
        var inc = true
        var dec = true
        var dif = true
        var p = l.first!
        for i in l.dropFirst() {
            if i >= p { dec = false }
            if i <= p { inc = false }
            if !abs(i-p).isin(1..<4) { dif = false }
            p = i
        }
        if dif && (inc || dec) {
            anyTrue = true
        }
        if anyTrue { a += 1}
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
