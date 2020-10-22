//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 22.10.2020.
//

import Foundation

public class Frame{
    
    private var name: String = ""
    private var lexicalUnits: [LexicalUnit] = []
    
    public init(name: String){
        self.name = name
    }
    
    public func addLexicalUnit(lexicalUnit: LexicalUnit){
        self.lexicalUnits.append(lexicalUnit)
    }
    
    public func getLexicalUnit(index: Int)->LexicalUnit{
        return self.lexicalUnits[index]
    }
    
    public func size()->Int{
        return self.lexicalUnits.count
    }
    
    public func getName()->String{
        return self.name
    }
}
