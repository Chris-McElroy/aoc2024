//
//  day19.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d19() {
    runType = .real
    let ins = inputStrings()
    let iw = inputWords(sep: "\n", line: "\n\n")
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
    
    let pat: [String] = iw[0][0].components(separatedBy: ", ")
    var ans: [S: I] = [:]
    
    var a = 0
    
    for (i, l) in iw[1].enumerated() {
//        var poss = false
//        bfs(startingWith: [[0, 0]], searchFor: { af, _, _ in
////            print(af)
//            if af[0] == l.count {
//                a += 1
//                print("got one!")
//                return true
//            }
//            return false
//        }, expandUsing: {
//            let rem = l.dropFirst($0[0])
//            var new: [[Int]] = []
//            for (i, p) in pat.enumerated() {
//                if rem.hasPrefix(p) {
//                    new.append([$0[0] + p.count, ($0[1]*pat.count + i) % 10000000000000])
//                }
//            }
//            return new
//        }, continueWhile: { _, _ in true })
        
//        a += poss.int
        a += nWays(l)
        print(a, Double(i)/Double(iw[1].count)*100)
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return } // not 976

    
    func nWays(_ s: String) -> Int {
        if let a = ans[s] { return a }
        var ways = 0
        for p in pat {
            if s.hasPrefix(p) {
                if s.count > p.count {
                    ways += nWays(String(s.dropFirst(p.count)))
                } else {
                    ways += 1
                }
            }
        }
        ans[s] = ways
        return ways
    }
}
