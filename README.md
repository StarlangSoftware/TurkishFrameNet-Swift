Turkish FrameNet
============

Introduced in 1997, FrameNet (Lowe, 1997; Baker et al., 1998; Fillmore and Atkins, 1998; Johnson et al., 2001) has been developed by the International Computer Science Institute in Berkeley, California. It is a growing computational lexicography project that offers in-depth semantic information on English words and 
predicates. Based on the theory of Frame Semantics by Fillmore (Fillmore and others, 1976; Fillmore, 2006), FrameNet offers semantic information on predicate-argument structure in a way that is loosely similar to wordnet (Kilgarriff and Fellbaum, 2000).

In FrameNet, predicates and related lemmas are categorized under frames. The notion of frame here is thoroughly described in Frame Semantics as a schematic representation of an event, state or relationship. These semantic information packets called frames are constituted of individual lemmas (also known as Lexical Units) and frame elements (such as the agent, theme, instrument, duration, manner, direction etc.). Frame elements can be described as semantic roles that are related to the frame. Lexical Units, or lemmas, are linked to a frame through a single sense. For instance, the lemma ”roast” can mean to criticise harshly
or to cook by exposing to dry heat. With its latter meaning, ”roast” belongs to the Apply Heat frame.

In this version of Turkish FrameNet, we aimed to release a version of Turkish FrameNet that captures at least a considerable majority of the most frequent predicates, thus offering a valuable and practical resource from day one. Because Turkish is a low-resource language, it was important to ensure that FrameNet had enough coverage that it could be incorporated into NLP solutions as soon as it is released to the public.

We took a closer look at Turkish WordNet and designated 8 domains that would possibly contain the most frequent predicates in Turkish: Activity, Cause, Change, Motion, Cognition, Perception, Judgement and Commerce. For the first phase, the focus was on the thorough annotation of these domains. Frames from
English FrameNet were adopted when possible and new frames were created when needed. In the next phase, team of annotators will attack the
Turkish predicate compilation offered by TRopBank and KeNet for a lemma-by-lemma annotation process. This way, both penetration and coverage of the Turkish FrameNet will be increased.

Simple Web Interface
============
[Link 1](https://starlangsoftware.github.io/nlptoolkit-web-simple/turkish-framenet.html) [Link 2](http://104.247.163.162/nlptoolkit/turkish-framenet.html)

Video Lectures
============

[<img src="https://github.com/StarlangSoftware/TurkishFrameNet/blob/master/video.jpg" width="50%">](https://youtu.be/mE600WMdSrQ)

For Developers
============
You can also see [Java](https://github.com/starlangsoftware/TurkishFrameNet), [Python](https://github.com/starlangsoftware/TurkishFrameNet-Py), [Cython](https://github.com/starlangsoftware/TurkishFrameNet-Cy), [C++](https://github.com/starlangsoftware/TurkishFrameNet-CPP), [C](https://github.com/starlangsoftware/TurkishFrameNet-C), [Js](https://github.com/starlangsoftware/TurkishFrameNet-Js), [Php](https://github.com/starlangsoftware/TurkishFrameNet-Php), or [C#](https://github.com/starlangsoftware/TurkishFrameNet-CS) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called TurkishFrameNet-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/TurkishFrameNet-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run TurkishFrameNet-Swift.

Detailed Description
============

+ [FrameNet](#framenet)
+ [Frame](#frame)

## FrameNet

FrameNet'i okumak ve tüm Frameleri hafızada tutmak için

	a = FrameNet()

Frameleri tek tek gezmek için

	for i in 0..<a.size(){
		frame = a.getFrame(i)
	}

Bir fiile ait olan Frameleri bulmak için

	frames = a.getFrames("TUR10-1234560")

## Frame

Bir framein lexical unitlerini getirmek için

	func getLexicalUnit(index: Int)->String
		
Bir framein frame elementlerini getirmek için

	func getFrameElement(index: Int)->String
	
# Cite

	@inproceedings{marsan20,
 	title = {{B}uilding the {T}urkish {F}rame{N}et},
 	year = {2021},
 	author = {B. Marsan and N. Kara and M. Ozcelik and B. N. Arican and N. Cesur and A. Kuzgun and E. Saniyar and O. Kuyrukcu and O. T. Y{\i}ld{\i}z},
 	booktitle = {Proceedings of GWC 2021}
	}

For Contibutors
============

### Package.swift file

1. Dependencies should be given w.r.t github.
```
    dependencies: [
        .package(name: "MorphologicalAnalysis", url: "https://github.com/StarlangSoftware/TurkishMorphologicalAnalysis-Swift.git", .exact("1.0.6"))],
```
2. Targets should include direct dependencies, files to be excluded, and all resources.
```
    targets: [
        .target(
	dependencies: ["MorphologicalAnalysis"],
	exclude: ["turkish1944_dictionary.txt", "turkish1944_wordnet.xml",
	"turkish1955_dictionary.txt", "turkish1955_wordnet.xml",
	"turkish1959_dictionary.txt", "turkish1959_wordnet.xml",
	"turkish1966_dictionary.txt", "turkish1966_wordnet.xml",
	"turkish1969_dictionary.txt", "turkish1969_wordnet.xml",
	"turkish1974_dictionary.txt", "turkish1974_wordnet.xml",
	"turkish1983_dictionary.txt", "turkish1983_wordnet.xml",
	"turkish1988_dictionary.txt", "turkish1988_wordnet.xml",
	"turkish1998_dictionary.txt", "turkish1998_wordnet.xml"],
	resources:
[.process("turkish_wordnet.xml"),.process("english_wordnet_version_31.xml"),.process("english_exception.xml")]),
```
3. Test targets should include test directory.
```
	.testTarget(
		name: "WordNetTests",
		dependencies: ["WordNet"]),
```

### Data files
1. Add data files to the project folder.

### Swift files

1. Do not forget to comment each function.
```
   /**
     * Returns the value to which the specified key is mapped.
     - Parameters:
        - id: String id of a key
     - Returns: value of the specified key
     */
    public func singleMap(id: String) -> String{
        return map[id]!
    }
```
2. Do not forget to define classes as open in order to be able to extend them in other packages.
```
	open class Word : Comparable, Equatable, Hashable
```
3. Function names should follow caml case.
```
	public func map(id: String)->String?
```
4. Write getter and setter methods.
```
	public func getSynSetId() -> String{
	public func setOrigin(origin: String){
```
5. Use separate test class extending XCTestCase for testing purposes.
```
final class WordNetTest: XCTestCase {
    var turkish : WordNet = WordNet()
    
    func testSize() {
        XCTAssertEqual(78326, turkish.size())
    }
```
6. Enumerated types should be declared as enum.
```
public enum CategoryType : String{
    case MATHEMATICS
    case SPORT
    case MUSIC
```
7. Implement == operator and hasher method for hashing purposes.
```
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    public static func == (lhs: Relation, rhs: Relation) -> Bool {
        return lhs.name == rhs.name
    }
```
8. Make classes Comparable for comparison, Equatable for equality, and Hashable for hashing check.
```
	open class Word : Comparable, Equatable, Hashable
```
9. Implement < operator for comparison purposes.
```
    public static func < (lhs: Word, rhs: Word) -> Bool {
        return lhs.name < rhs.name
    }
```
10. Implement description for toString method.
```
	open func description() -> String{
```
11. Use Bundle and XMLParserDelegate for parsing Xml files.
```
	let url = Bundle.module.url(forResource: fileName, withExtension: "xml")
	var parser : XMLParser = XMLParser(contentsOf: url!)!
	parser.delegate = self
	parser.parse()
```
also use parser method.
```
public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
```
