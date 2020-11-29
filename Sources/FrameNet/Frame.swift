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
    
    public func lexicalUnitExists(synSetId: String)->Bool{
        for lexicalUnit in self.lexicalUnits{
            if lexicalUnit.getSynSetId() == synSetId{
                return true
            }
        }
        return false
    }
    
    public func getLexicalUnitWithId(synSetId: String)->LexicalUnit!{
        for lexicalUnit in self.lexicalUnits{
            if lexicalUnit.getSynSetId() == synSetId{
                return lexicalUnit
            }
        }
        return nil
    }

    public func removeLexicalUnit(toBeRemoved: LexicalUnit){
        for i in 0..<lexicalUnits.count{
            if lexicalUnits[i].getSynSetId() == toBeRemoved.getSynSetId(){
                self.lexicalUnits.remove(at: i)
            }
        }
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
