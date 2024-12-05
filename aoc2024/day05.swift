//
//  day05.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d5() {
    runType = .all
    let iw = inputWords(sep: "\n", line: "\n\n")
    
    let rules: [[String]] = iw[0].map{ $0.split(separator: "|").map { String($0) } }
    let upd: [[String]] = iw[1].map { $0.split(separator: "," ).map { String($0) } }
    
    var a = 0
    
    f: for u in upd {
        var valid = true
        for r in rules {
            if u.contains(r[0]) && u.contains(r[1]) {
                if u.firstIndex(of: r[0])! > u.firstIndex(of: r[1])! {
                    valid = false
                }
            }
        }
        if valid {  }
        else {
            var fu: [String: [String]] = [:]
            for n in u {
                for r in rules where r[0] == n && u.contains(r[1]) {
                    fu[n, default: []].append(r[1])
                }
            }
            a += Int(fu.first(where: { $0.value.count == (u.count/2) })!.key)!
        }
    }
    
    printAnswer(a, test: 123, real: 5346)
}

/*
 
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
//    print(ins)
 
 var a = 0
 
 f: for p in ins.points() {
     
 }
 
 printAnswer(a, test: nil, real: nil)
 copy(a)
 
 if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
 */
