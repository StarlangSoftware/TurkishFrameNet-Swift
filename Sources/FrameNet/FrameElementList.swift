//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 11.02.2025.
//

import Foundation

public class FrameElementList{
    
    private var frameElements: [FrameElement] = []
    
    /// Constructor of frame element list from a string. The frame elements for a word is a concatenated list of
    /// frame element separated via '#' character.
    /// - Parameter frameElementList: String consisting of frame elements separated with '#' character.
    public init(frameElementList: String) {
        let items = frameElementList.components(separatedBy: "#");
        for item in items{
            frameElements.append(FrameElement(frameElement: item))
        }
    }
    
    /// Overloaded toString method to convert a frame element list to a string. Concatenates the string forms of all
    /// frame element with '#' character.
    /// - Returns: String form of the frame element list.
    public func description()->String{
        if frameElements.isEmpty{
            return "NONE"
        } else {
            var result = frameElements[0].description()
            for i in 1...frameElements.count{
                result = result + "#" + frameElements[i].description()
            }
            return result
        }
    }
    
    /// Replaces id's of predicates, which have previousId as synset id, with currentId.
    /// - Parameters:
    ///   - previousId: Previous id of the synset.
    ///   - currentId: Replacement id.
    public func updateConnectedId(previousId: String, currentId: String){
        for frameElement in frameElements {
            if frameElement.getId() == previousId{
                frameElement.setId(id: currentId)
            }
        }
    }
    
    /// Adds a predicate argument to the frame element list of this word.
    /// - Parameter predicateId: Synset id of this predicate.
    public func addPredicate(predicateId: String){
        if !frameElements.isEmpty && frameElements[0].getFrameElementType() == "NONE"{
            frameElements.removeFirst()
        }
        frameElements.append(FrameElement(frameElementType: "PREDICATE", frame: "NONE", id: predicateId))
    }
    
    /// Removes the predicate with the given predicate id.
    public func removePredicate(){
        var i = 0
        for frameElement in frameElements {
            if frameElement.getFrameElementType() == "PREDICATE"{
                frameElements.remove(at: i)
                break
            }
            i = i + 1
        }
    }
    
    /// Checks if one of the frame elements is a predicate.
    /// - Returns: True, if one of the frame elements is predicate; false otherwise.
    public func containsPredicate()->Bool{
        for frameElement in frameElements {
            if frameElement.getFrameElementType() == "PREDICATE"{
                return true
            }
        }
        return false
    }
    
    /// Checks if one of the frame element is a predicate with the given id.
    /// - Parameter predicateId: Synset id to check.
    /// - Returns: True, if one of the frame element is predicate; false otherwise.
    public func containsPredicateWithId(predicateId: String)->Bool{
        for frameElement in frameElements {
            if frameElement.getFrameElementType() == "PREDICATE" && frameElement.getId() == predicateId{
                return true
            }
        }
        return false
    }
    
    /// Returns the frame elements as an array list of strings.
    /// - Returns: Frame elements as an array list of strings.
    public func getFrameElements()->[String]{
        var result : [String] = []
        for frameElement in frameElements {
            result.append(frameElement.description())
        }
        return result
    }
    
    /// Checks if the given argument with the given type and id exists or not.
    /// - Parameters:
    ///   - frameElementType: Type of the frame element to search for.
    ///   - frame: frame Name of the frame to search for
    ///   - id: Id of the frame element to search for.
    /// - Returns: True if the frame element exists, false otherwise.
    public func containsFrameElement(frameElementType: String, frame: String, id: String)->Bool{
        for frameElement in frameElements {
            if frameElement.getFrameElementType() == frameElementType && frameElement.getFrame() == frame && frameElement.getId() == id{
                return true
            }
        }
        return false
    }
}
