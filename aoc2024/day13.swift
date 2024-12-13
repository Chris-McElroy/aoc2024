//
//  day13.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d13() {
    runType = .all
    let ins = inputStrings()
    let iw = inputWords()
    let ii = inputInts()
    let ii2 = inputIntWords(sep: ["\n", " ", "+", ",", "="], line: "\n\n")
    let ic = inputCharacters()[0]
    let ica = inputCharacters()
   //    print(ins)
   //    print(iw)
   //    print(ii)
//       print(ii2)
   //    print(ic)
   //    print(ica)
   //    print(ins)
    
    var a1 = 0
    
//    f: for l in ii2 where l.count == 6 {
//        let a = Double(l[0])
//        let b = Double(l[2])
//        let c = Double(l[1])
//        let d = Double(l[3])
//        let x = Double(l[4])
//        let y = Double(l[5])
//        
//        let f = (x - y*(b/d))/(a - c*(b/d))
//        let s = (x - y*(a/c))/(b - d*(a/c))
//        if ((a/b) - (c/d)).abs < 0.1 { print("hi")}
//        if abs(f.truncatingRemainder(dividingBy: 1)) < 0.01 && abs(s.truncatingRemainder(dividingBy: 1)) < 0.01 {
//            if f > 100 || s > 100 { print("huh"); continue }
//            a1 += Int(f*3 + s)
////            print(a1)
//        }
//    }
    
    var counted: [Int] = []
    
    for (p, l) in ii2.enumerated() where !counted.contains(p) {
        let a = l[0]
        let b = l[2]
        let c = l[1]
        let d = l[3]
        let x = l[4] + 10000000000000
        let y = l[5] + 10000000000000
        
//        var wouldBe = 0
        
        let f = (x.d - y.d*(b.d/d.d))/(a.d - c.d*(b.d/d.d))
        let s = (x.d - y.d*(a.d/c.d))/(b.d - d.d*(a.d/c.d))
//        if ((a/b) - (c/d)).abs < 0.1 { print("hi")}
        if abs(f.rounded(.toNearestOrEven) - f) < 0.01 && abs(s.rounded(.toNearestOrEven) - s) < 0.01 {
//            if f > 100 || s > 100 { print("huh"); continue }
            a1 += Int((f*3 + s).rounded(.toNearestOrEven))
        }
        
//        fj: for i in 0...100 {
//            for j in 0...100 {
//                
//                if (a*i + b*j == x) && (c*i + d*j == y) {
//                    a1 += 3*i + j
//                    if wouldBe != 3*i + j {
//                        print("error!!!", a, b, c, d, x, y, f, s, wouldBe, 3*i + j)
//                    }
//                    break fj
//                }
//            }
//            
//        }
    }
    
    printAnswer(a1, test: 480, real: 28262)
    copy(a1)// not 18534 or 21777
    
    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
