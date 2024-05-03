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
    
    /// Constructor of Frame class which takes inputStream as input and reads the frame
    /// - Parameter name: Name of the frame
    public init(name: String){
        self.name = name
    }
    
    /// Adds a new lexical unit to the current frame
    /// - Parameter lexicalUnit: Lexical unit to be added
    public func addLexicalUnit(lexicalUnit: String){
        self.lexicalUnits.append(lexicalUnit)
    }
    
    /// Adds a new frame element to the current frame
    /// - Parameter frameElement: Frame element to be added
    public func addFrameElement(frameElement: String){
        self.frameElements.append(frameElement)
    }

    /// Checks if the given lexical unit exists in the current frame
    /// - Parameter synSetId: Lexical unit to be searched.
    /// - Returns: True if the lexical unit exists, false otherwise.
    public func lexicalUnitExists(synSetId: String)->Bool{
        return self.lexicalUnits.contains(synSetId)
    }
    
    /// Accessor for a given index in the lexicalUnit array.
    /// - Parameter index: Index of the lexical unit
    /// - Returns: The lexical unit at position index in the lexicalUnit array
    public func getLexicalUnit(index: Int)->String{
        return self.lexicalUnits[index]
    }
    
    /// Accessor for a given index in the frameElements array.
    /// - Parameter index: Index of the frame element
    /// - Returns: The frame element at position index in the frameElements array
    public func getFrameElement(index: Int)->String{
        return self.frameElements[index]
    }
    
    /// Returns number of lexical units in the current frame
    /// - Returns: Number of lexical units in the current frame
    public func lexicalUnitSize()->Int{
        return self.lexicalUnits.count
    }
    
    /// Returns number of frame elements in the current frame
    /// - Returns: Number of frame elements in the current frame
    public func frameElementSize()->Int{
        return self.frameElements.count
    }
    
    /// Accessor for the name of the frame
    /// - Returns: Name of the frame
    public func getName()->String{
        return self.name
    }
}
