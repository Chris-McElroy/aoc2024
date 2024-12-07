//
//  day07.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d7() {
    runType = .real
    let ins = inputStrings()
    let iw = inputWords()
    let ii = inputInts()
    let ii2 = inputIntWords(sep: [" ", ":"])
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
    
    f: for p in ii2 {
        print(p)
        let ans = p.first!
        for n in 0..<(3**(p.count-2)) {
            var an2 = p[1]
            for pos in 2..<p.count {
//                print(pos, n, p)
                if (n/(3**(pos - 2)) % 3) == 1 { //  (n >> (pos - 2)) & 1 == 1
                    an2 *= p[pos]
                } else if (n/(3**(pos - 2)) % 3) == 0 {
                    an2 += p[pos]
                } else {
                    an2 = Int(String(an2) + String(p[pos]))!
                }
            }
            if an2 == ans {
                a += ans
                break
            }
        }
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
