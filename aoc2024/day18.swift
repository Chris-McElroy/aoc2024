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
        a += 1
    }
    
    printAnswer(a, test: nil, real: nil)
    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
