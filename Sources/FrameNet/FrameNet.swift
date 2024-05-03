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
    private var parser: XMLParser = XMLParser()
    
    /// A constructor of FrameNet class which reads all frame files inside the files2.txt file. For each
    /// filename inside that file, the constructor creates a FrameNet.Frame and puts in inside the frames ArrayList.
    override public init(){
        let url = Bundle.module.url(forResource: "framenet", withExtension: "xml")
        parser = XMLParser(contentsOf: url!)!
        super.init()
        parser.delegate = self
        parser.parse()
    }
    
    /// Parses start of an element
    /// - Parameters:
    ///   - parser: Parser
    ///   - elementName: Name of the element to be parsed
    ///   - namespaceURI: -
    ///   - qName: -
    ///   - attributeDict: Attribute list of the element
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
    
    /// Parses the end of the element
    /// - Parameters:
    ///   - parser: Parser
    ///   - elementName: Name of the element to be parsed
    ///   - namespaceURI: -
    ///   - qName: -
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
    
    /// Parses simple text
    /// - Parameters:
    ///   - parser: Parser
    ///   - string: Current text to be parsed
    public func parser(_ parser: XMLParser, foundCharacters string: String){
        if string != "\n"{
            value = value + string
        }
    }
    
    /// Checks if the given lexical unit exists in any frame in the frame set.
    /// - Parameter synSetId: Id of the lexical unit
    /// - Returns: True if any frame contains the given lexical unit, false otherwise.
    public func lexicalUnitExists(synSetId: String)->Bool{
        for frame in self.frames{
            if frame.lexicalUnitExists(synSetId: synSetId){
                return true
            }
        }
        return false
    }
    
    /// Returns an array of frames that contain the given lexical unit in their lexical units
    /// - Parameter synSetId: Id of the lexical unit.
    /// - Returns: An array of frames that contains the given lexical unit.
    public func getFrames(synSetId: String)->[Frame]{
        var result: [Frame] = []
        for frame in self.frames{
            if frame.lexicalUnitExists(synSetId: synSetId){
                result.append(frame)
            }
        }
        return result
    }
    
    /// Returns number of frames in the frame set.
    /// - Returns: Number of frames in the frame set.
    public func size()->Int{
        return self.frames.count
    }
    
    /// Returns the element at the specified position in the frame list.
    /// - Parameter index: index of the element to return
    /// - Returns: The element at the specified position in the frame list.
    public func getFrame(index: Int)->Frame{
        return self.frames[index]
    }

}
