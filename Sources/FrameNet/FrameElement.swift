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
    
    public init(frameElement: String){
        if frameElement.contains("$"){
            self.frameElementType = String(frameElement[..<frameElement.range(of: "$")!.lowerBound])
            self.frame = String(frameElement[frameElement.index(frameElement.range(of: "$")!.lowerBound, offsetBy: 1)..<frameElement.index(frameElement.range(of: "$", options: NSString.CompareOptions.backwards)!.upperBound, offsetBy: -1)])
            self.id = String(frameElement[frameElement.range(of: "$", options: NSString.CompareOptions.backwards)!.upperBound...])
        } else {
            self.frameElementType = "NONE"
        }
    }
    
    public init(frameElementType: String, frame: String, id: String){
        self.frameElementType = frameElementType;
        self.frame = frame;
        self.id = id;
    }
    
    public func getFrameElementType()->String{
        return self.frameElementType;
    }

    public func getFrame()->String{
        return self.frame;
    }

    public func getId()->String{
        return self.id;
    }
    
    public func description()->String{
        if self.frameElementType == "NONE"{
            return self.frameElementType;
        } else {
            return self.frameElementType + "$" + self.frame + "$" + self.id;
        }
    }

}
