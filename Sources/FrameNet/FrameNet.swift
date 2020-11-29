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
    private var lexicalUnit: LexicalUnit? = nil
    private var value: String = ""
    
    override public init(){
        super.init()
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent("files.txt")
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let thisSourceFile = URL(fileURLWithPath: #file)
                let thisDirectory = thisSourceFile.deletingLastPathComponent()
                let fileName = "Frames/" + line.trimmingCharacters(in: .whitespacesAndNewlines)
                let url = thisDirectory.appendingPathComponent(fileName)
                let parser = XMLParser(contentsOf: url)!
                self.frame = Frame(name: String(line))
                self.lexicalUnit = nil
                parser.delegate = self
                parser.parse()
            }
        } catch {
        }
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        var id: String
        if (elementName == "LEXICALUNIT") {
            id = attributeDict["ID"]!
            self.lexicalUnit = LexicalUnit(synSetId: id)
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName == "FRAME"){
            self.frames.append(frame!)
        } else if (elementName == "LEXICALUNIT"){
            self.frame?.addLexicalUnit(lexicalUnit: self.lexicalUnit!)
            self.lexicalUnit = nil
        } else if (elementName == "ELEMENT"){
            self.lexicalUnit?.addElement(element: value)
            value = ""
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
