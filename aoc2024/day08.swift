//
//  day08.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d8() {
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
    var an = setc2()
    var pd: [Character: [C2]] = [:]
    
    f: for p in ins.points() where ins[p] != "." {
        pd[ins[p], default: []].append(p)
    }
    
    for p in pd.values {
//        print(p)
        for pair in p.uniqueCombinations(of: 2) {
//            print(pair, (2*pair[0] - (pair[1])))
            var off = pair[0] - pair[1]
            var po = pair[0]
            while po.inBounds(of: ins) {
                an.insert(po)
                po += off
            }
            off = .zero - off
            po = pair[1]
            while po.inBounds(of: ins) {
                an.insert(po)
                po += off
            }
        }
    }
    
    a = an.count
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
    // not 954

}
