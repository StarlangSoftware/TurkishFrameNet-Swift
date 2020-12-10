//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 22.10.2020.
//

import Foundation

public class FrameNet: NSObject, XMLParserDelegate{
    
    private var frames: [Frame] = []
    private var frame: Frame? = nil
    private var value: String = ""
    
    override public init(){
        super.init()
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent("framenet.xml")
        let parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        var id: String
        if (elementName == "FRAME") {
            id = attributeDict["NAME"]!
            self.frame = Frame(name: id)
        } else {
            if (elementName == "FRAME_ELEMENT" || elementName == "LEXICAL_UNIT") {
                value = ""
            }
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName == "FRAME"){
            self.frames.append(frame!)
            value = ""
        } else {
            if (elementName == "FRAME_ELEMENT"){
                self.frame?.addFrameElement(frameElement: value)
            } else {
                if (elementName == "LEXICAL_UNIT"){
                    self.frame!.addLexicalUnit(lexicalUnit: value)
                }
            }
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String){
        if string != "\n"{
            value = value + string
        }
    }
    
    public func lexicalUnitExists(synSetId: String)->Bool{
        for frame in self.frames{
            if frame.lexicalUnitExists(synSetId: synSetId){
                return true
            }
        }
        return false
    }
    
    public func getFrames(synSetId: String)->[Frame]{
        var result: [Frame] = []
        for frame in self.frames{
            if frame.lexicalUnitExists(synSetId: synSetId){
                result.append(frame)
            }
        }
        return result
    }
    
    public func size()->Int{
        return self.frames.count
    }
    
    public func getFrame(index: Int)->Frame{
        return self.frames[index]
    }

}
