//
//  day15.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d15() {
    runType = .all
    let iw = inputWords(sep: "\n", line: "\n\n")
    
    var a1 = 0
    var a2 = 0
    var box1: PAS = []
    var box2: PAS = []
    var wall1: PS = []
    var wall2: PS = []
    var lf1 = C2.zero
    var lf2 = C2.zero
    
    let area = iw[0].dropFirst().dropLast().map { String($0.dropFirst().dropLast()) }.a
    let bigArea = iw[0].dropFirst().dropLast().map { String($0.dropFirst().dropLast().flatMap { [$0, $0] }) }.a
    
    for p in area.points() {
        let bigP1 = C2(p.x*2, p.y)
        let bigP2 = C2(p.x*2 + 1, p.y)
        if area[p] == "O" {
            box1.insert([p])
            box2.insert([bigP1, bigP2])
        } else if area[p] == "@" {
            lf1 = p
            lf2 = bigP1
        } else if area[p] == "#" {
            wall1.insert(p)
            wall2.insert(bigP1)
            wall2.insert(bigP2)
        }
    }
    
    doAllMoves(area: area, box: &box1, wall: wall1, lf: &lf1)
    doAllMoves(area: bigArea, box: &box2, wall: wall2, lf: &lf2)
    
    for b in box1 {
        a1 += b[0].x + 1 + (b[0].y + 1)*100
    }
    
    for b in box2 {
        a2 += b[0].x + 2 + (b[0].y + 1)*100
    }
    
    printAnswer(a1, test: 10092, real: 1514333)
    printAnswer(a2, test: 9021, real: 1528453)
    
    func doAllMoves(area: [String], box: inout PAS, wall: PS, lf: inout P) {
        for move in iw[1].joined() {
            let dir = C2(dir: move)
            var tomove: [[C2]] = []
            var top: [C2] = [lf + dir]
            var free = false
            
            movin: while top.first!.inBounds(of: area) {
                var newTop: [C2] = []
                for p in top {
                    if wall.contains(p) {
                        break movin
                    } else if let b = box.first(where: { $0.contains(p) }) {
                        tomove.append(b)
                        if dir.y != 0 {
                            newTop.append(b.first! + dir)
                            newTop.append(b.last! + dir)
                        } else if dir.x == -1 {
                            newTop.append(b.first! + dir)
                        } else {
                            newTop.append(b.last! + dir)
                        }
                    } else {
                        
                    }
                }
                if newTop != [] {
                    top = newTop
                } else {
                    free = true
                    break
                }
            }
            
            if free {
                lf += dir
                if !tomove.isEmpty {
                    for b in tomove.reversed() {
                        box.remove(b)
                        box.insert(b.map{ $0 + dir })
                    }
                }
            }
        }
    }
}


// part 1 answer
/*
 runType = .all
 let ins = inputStrings()
 let iw = inputWords(sep: "\n", line: "\n\n")
 let ii = inputInts()
 let ii2 = inputIntWords()
 let ic = inputCharacters()[0]
 let ica = inputCharacters()
//    print(ins)
//       print(iw)
//    print(ii)
//    print(ii2)
//    print(ic)
//    print(ica)
//    print(ins)
 
 var a = 0
 var box = setc2()
 var wall = setc2()
 var lf = C2.zero
 
 let area = iw[0].dropFirst().dropLast().map { String($0.dropFirst().dropLast()) }.a
 
 for p in area.points() {
     if area[p] == "O" {
         box.insert(p)
     } else if area[p] == "@" {
         lf = p
     } else if area[p] == "#" {
         wall.insert(p)
     }
 }
 
//    print("finished")
 for move in iw[1].joined() {
     let dir = C2(dir: move)
     var tomove: [C2] = []
     var free = false
     
//        print("starting", move, dir, tomove, lf, area.count)
     
     for p in lf.toOutOfBounds(of: area, by: dir) {
         if wall.contains(p) {
             break
         } else if box.contains(p) {
             tomove.append(p)
         } else {
             free = true
             break
         }
     }
     
     if free {
         lf += dir
         if !tomove.isEmpty {
             box.remove(tomove.first!)
             box.insert(tomove.last! + dir)
         }
     }
//        print("finished move")
 }
 
 for b in box {
     a += b.x + 1 + (b.y + 1)*100
 }
 
//    print("finished all")
 
 printAnswer(a, test: nil, real: nil)
 copy(a)
 
 if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
 */
