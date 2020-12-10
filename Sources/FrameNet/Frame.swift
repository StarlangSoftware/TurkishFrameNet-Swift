//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 22.10.2020.
//

import Foundation

public class Frame{
    
    private var name: String = ""
    private var lexicalUnits: [String] = []
    private var frameElements: [String] = []

    public init(name: String){
        self.name = name
    }
    
    public func addLexicalUnit(lexicalUnit: String){
        self.lexicalUnits.append(lexicalUnit)
    }

    public func addFrameElement(frameElement: String){
        self.frameElements.append(frameElement)
    }

    public func lexicalUnitExists(synSetId: String)->Bool{
        return self.lexicalUnits.contains(synSetId)
    }
    
    public func getLexicalUnit(index: Int)->String{
        return self.lexicalUnits[index]
    }

    public func getFrameElement(index: Int)->String{
        return self.frameElements[index]
    }

    public func lexicalUnitSize()->Int{
        return self.lexicalUnits.count
    }

    public func frameElementSize()->Int{
        return self.frameElements.count
    }

    public func getName()->String{
        return self.name
    }
}
