//
//  day14.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d14() {
    runType = .real
    let ins = inputStrings()
    let iw = inputWords()
    let ii = inputInts()
    var ii2 = inputIntWords(sep: [" ", "+", ",", "="], line: "\n")
    let ic = inputCharacters()[0]
    let ica = inputCharacters()
   //    print(ins)
   //    print(iw)
   //    print(ii)
//       print(ii2)
   //    print(ic)
   //    print(ica)
   //    print(ins)
    
//    let arr = Array(repeating: Array(repeating: false, count: 101), count: 103)
    
    var a = 0
    var newi: [[Int]] = []
    var cs = setc2()
    var quads = [0, 0, 0, 0]
    var x = 101
    var y = 103
//    let x = 11
//    let y = 7
    
    f: for i in 0..<100000 {
//        print(i, ii2.count)
        for pv in ii2 {
            var p = C2(pv[0], pv[1])
            let v = C2(pv[2], pv[3])
            p = (p + v)
            newi += [[(p.x + 2*x) % x, (p.y + 2*y) % y, v.x, v.y]]
        }
        ii2 = newi
        cs = Set(ii2.map({ C2($0[0], $0[1])}))
        if cs.count == ii2.count { print("hi!", i)
            
            for yi in 0..<y {
                var s = ""
                for xi in 0..<x {
                    let c = ii2.count(where: { $0[0] == xi && $0[1] == yi })
                    if c == 0 {
                        s += "."
                        
                    } else {
                        s += String(c)
                    }
                }
                print(s)
            }
            
        }
        newi = []
    }
    
    for aj in ii2 {
        if aj[0] < x/2 {
            if aj[1] < y/2 {
                quads[0] += 1
            } else if aj[1] > y/2 {
                quads[1] += 1
            }
        } else if aj[0] > x/2 {
            if aj[1] < y/2 {
                quads[2] += 1
            } else if aj[1] > y/2 {
                quads[3] += 1
            }
        }
    }
    
    
    a = quads.product()
//    print(quads)
    
    printAnswer(a, test: nil, real: nil)
//    copy(a)
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return } // not 219014400 or 52634856
}
