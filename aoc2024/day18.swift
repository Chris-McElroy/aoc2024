//
//  day18.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d18() {
    runType = .real
    let ins = inputStrings()
    let iw = inputWords()
    let ii = inputInts()
    var ii2 = inputIntWords(sep: [",", " ", ":", "+"])
    let ic = inputCharacters()[0]
    let ica = inputCharacters()
   //    print(ins)
   //    print(iw)
   //    print(ii)
//       print(ii2)
   //    print(ic)
   //    print(ica)
   //    print(ins)
    
    var a = 0
    
    var parse: [C: PS] = [:]
    
    for x in 0...70 {
        for y in 0...70 {
            parse[".", default: []].insert(C2(x, y))
        }
    }
    
    var p = [0, 0]
    
    while connected() {
        print("inserted", ii2.count)
        p = ii2.removeFirst()
        parse["#", default: []].insert(C2(p[0], p[1]))
        parse[".", default: []].insert(C2(p[0], p[1]))
    }
    
    func connected() -> Bool {
        var hi = false
        bfs(startingWith: [P(0, 0)], searchFor: { p, s, f in
            if p == P(70, 70) {
                hi = true
                return true
            }
            return false }, expandUsing: { p in
            let poss = p.adjacents
                return poss.filter({ !parse["#", default: []].contains($0) && parse["."]!.contains($0) })
        }, continueWhile: { _,_ in true })
        return hi
    }
    
//    let paths = traverse(map: parse, from: P(0, 0), to: P(70, 70), nWays: 1)
    
//    a = p
    
    printAnswer(p, test: nil, real: nil)
    copy(p.map { S($0) }.joined(separator: ","))
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
