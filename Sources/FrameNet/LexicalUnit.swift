//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 22.10.2020.
//

import Foundation

public class LexicalUnit{
    
    private var synSetId: String = ""
    private var frameElements: [String] = []
    
    public init(synSetId: String){
        self.synSetId = synSetId
    }
    
    public func addElement(element: String){
        self.frameElements.append(element)
    }
    
    public func getSynSetId()-> String{
        return synSetId;
    }
    
    public func size()-> Int{
        return self.frameElements.count
    }
    
    public func getFrameElements()-> [String]{
        return self.frameElements
    }
}
