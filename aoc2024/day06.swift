//
//  day06.swift
//  aoc2024
//
//  Created by 4 on '24.11.30.
//

import Foundation

func d6() {
    runType = .real
    var ins = inputStrings().reversed().a
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
    var spos: C2 = .zero
    
    for p in ins.points() {
        if ins[p] != "#" && ins[p] != "." {
            spos = p
        }
    }
    
//    var loc: Set<[C2]> = []
//    var loc2: Set<C2> = []
//    var pos: C2 = spos
//    var dir: C2 = C2(0, 1)
    
    
    var line = 0
    let oldIns = ins
    
    // TODO i should have a wayyyy better way of dealing with all of the memory things for this
    // TODO old code at the bottom should work
    for p in ins.points() where ins[p] == "." {
        ins = oldIns
        ins[p.y][p.x] = "#"
        if p.y != line {
            
            line = p.y
            print(line)
        }
        var out = false
        
        
        var loc: Set<[C2]> = []
        var pos: C2 = spos
        var dir: C2 = C2(0, 1)
        
        while !loc.contains([pos, dir]) {
            let new = pos + dir
            if !new.inBounds(of: ins) {
                out = true
                break
            }
            
            if ins[new] == "#" {
                loc.insert([pos, dir])
                dir.rotateRight()
            } else {
                loc.insert([pos, dir])
                pos = new
            }
        }
        if !out { a += 1 }
    }

    printAnswer(a, test: nil, real: nil)
    copy(a)

    if ins.isEmpty || ii.isEmpty || ii2.isEmpty || iw.isEmpty || ic.isEmpty || ica.isEmpty { return }
}
// 468 no

/*
 
 
 var loc: Set<[C2]> = []
 var loc2: Set<C2> = []
 var pos: C2 = spos
 var dir: C2 = C2(0, 1)
 
 f: while !loc.contains([pos, dir]) {
     let new = pos + dir
     if !new.inBounds(of: ins) {
         break
     }
     
     if ins[new] == "#" {
         loc.insert([pos, dir])
         dir.rotateRight()
     } else {
         loc.insert([pos, dir])
         pos = new
         
         dir.rotateRight()
         let ndir = dir
         dir.rotateLeft()
         
         if !(pos + dir).inBounds(of: ins) { continue }
         if ins[pos + dir] == "^" || ins[pos + dir] == "#" { continue }
         for q in pos.toOutOfBounds(of: ins, by: ndir) {
             if ins[q] == "#" { break }
             if loc.contains([q, ndir]) {
                 loc2.insert(pos + dir)
                 break
             }
         }
     }
 }
 */
