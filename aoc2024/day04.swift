//
//  day04.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d4() {
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
    print(ins)
    
    var a = 0
    
    f: for p in ins.points() {
        if ins[p] != "A" { continue }
        var bois = 0
        for q in p.neighborsInBounds(of: ins) {
            if q.crowDistance(to: p) == 1 { continue }
            if ins[q] != "M" { continue }
            let r = p + (p - q)
            if !r.inBounds(of: ins) { continue }
            if ins[r] == "S" { bois += 1 }
        }
        if bois == 2 { a += 1 }
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}

/*
 f: for p in ins.points() {
     if ins[p] != "X" { continue }
     for q in p.neighborsInBounds(of: ins) {
         if ins[q] != "M" { continue }
         let r = q + (q - p)
         let s = r + (q - p)
         if !r.inBounds(of: ins) || !s.inBounds(of: ins) { continue }
         if ins[r] == "A" && ins[s] == "S" { a += 1; print(p, q, r, s) }
     }
 }
 
 */
