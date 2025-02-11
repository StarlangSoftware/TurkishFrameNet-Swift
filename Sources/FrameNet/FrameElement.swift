//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 29.11.2020.
//

import Foundation

public class FrameElement{
    
    private var id: String = ""
    private var frame: String = ""
    private var frameElementType = ""
    
    /// A constructor of FrameElement class which takes frameElement string which is in the form of frameElementType$id
    /// and parses this string into frameElementType and id. If the frameElement string does not contain '$' then the
    /// constructor return a NONE type frameElement.
    /// - Parameter frameElement: Argument string containing the argumentType and id
    public init(frameElement: String){
        if frameElement.contains("$"){
            self.frameElementType = String(frameElement[..<frameElement.range(of: "$")!.lowerBound])
            self.frame = String(frameElement[frameElement.index(frameElement.range(of: "$")!.lowerBound, offsetBy: 1)..<frameElement.index(frameElement.range(of: "$", options: NSString.CompareOptions.backwards)!.upperBound, offsetBy: -1)])
            self.id = String(frameElement[frameElement.range(of: "$", options: NSString.CompareOptions.backwards)!.upperBound...])
        } else {
            self.frameElementType = "NONE"
        }
    }
    
    /// Another constructor of FrameElement class which takes frameElementType and id as inputs and initializes corresponding attributes
    /// - Parameters:
    ///   - frameElementType: Type of the frameElement
    ///   - frame: Frame of the frameElement
    ///   - id: Id of the frameElement
    public init(frameElementType: String, frame: String, id: String){
        self.frameElementType = frameElementType;
        self.frame = frame;
        self.id = id;
    }
    
    /// Accessor for frameElementType.
    /// - Returns: frameElementType.
    public func getFrameElementType()->String{
        return self.frameElementType;
    }
    
    /// Accessor for frame.
    /// - Returns: frame.
    public func getFrame()->String{
        return self.frame;
    }
    
    /// Accessor for id.
    /// - Returns: id.
    public func getId()->String{
        return self.id;
    }
    
    public func setId(id: String){
        self.id = id
    }
    
    /// description converts an FrameElement to a string. If the frameElementType is "NONE" returns only "NONE", otherwise
    /// it returns argument string which is in the form of frameElementType$id
    /// - Returns: string form of frameElement
    public func description()->String{
        if self.frameElementType == "NONE"{
            return self.frameElementType;
        } else {
            return self.frameElementType + "$" + self.frame + "$" + self.id;
        }
    }

}
