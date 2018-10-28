//
//  iOSAssignmentTests.swift
//  iOSAssignmentTests
//
//  Created by Asim Parvez on 10/28/18.
//  Copyright © 2018 Asim Parvez. All rights reserved.
//

import XCTest
@testable import iOSAssignment

class SplitMessageTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK: - RandomStringGeneratorTests
    //Test Whether the string generated is of correct length
    func testRandomStringLengthIsCorrect() {
        let str = StringUtility.randomString(length: 50)
        XCTAssertEqual(str.count, 50)
    }
    func testRandomStringDoesNotContainWhiteSpaces() {
        let str = StringUtility.randomString(length: 50)
        XCTAssertFalse(str.contains(" "))
    }
    
    //MARK: - PositiveTestCases
    
    //Test an input of under chunkSize characters. Should return the message as is.
    func testSplitMessageWithInputUnderChunkSize() {
        let smallInput = "Hey, how are you?"
        let msgChunks = StringUtility.splitMessage(message: smallInput)
        XCTAssertEqual(msgChunks?.count, 1)
        XCTAssertEqual(msgChunks?[0], "Hey, how are you?")
    }
    
    //Test an input of over Chunk Size characters with multiple words and none exceeds the character count limit. Making sure input is split on white spaces
    func testSplitMessageWithInputContainingMultipleLegitWords() {
        
        let input = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let msgChunks = StringUtility.splitMessage(message: input)
        XCTAssertEqual(msgChunks?.count, 2)
        //First Chunk comparison
        XCTAssertEqual(msgChunks?[0], "1/2 I can't believe Tweeter now supports chunking")
        //Second Chunk comparison
        XCTAssertEqual(msgChunks?[1], "2/2 my messages, so I don't have to do it myself.")
        
    }
    
    
    //Test an input of very large words that don't fit in the same message chunk
    func testSplitMessageWithInputContainingVeryLargeWords() {
        
        let inputWord30Char =  "123456789012345678901234567890"
        let inputWord30Char2 = "123456789012345678901234567890"
        let inputWord30Char3 = "123456789012345678901234567890"
        let inputSentence = inputWord30Char + " " + inputWord30Char2 + " " + inputWord30Char3
        
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        XCTAssertEqual(msgChunks?.count, 3)
        //First Chunk comparison
        XCTAssertEqual(msgChunks?[0], "1/3 123456789012345678901234567890")
        //Second Chunk comparison
        XCTAssertEqual(msgChunks?[1], "2/3 123456789012345678901234567890")
        //Third Chunk comparison
        XCTAssertEqual(msgChunks?[2], "3/3 123456789012345678901234567890")
    }
    
    
    
    
    
    //Test a large input that should yield more than 10 message chunks
    func testSplitMessageWithALongInputAndAcceptableWords() {
        
        let inputSentence =  "Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters."
        
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        XCTAssertEqual(msgChunks?.count, 11)
        //Chunk comparison for all 11 chunks
        
        XCTAssertEqual(msgChunks?[0], "1/11 Test a large input that should yield more")
        XCTAssertEqual(msgChunks?[1], "2/11 than 10 message chunks. So that we are sure")
        XCTAssertEqual(msgChunks?[2], "3/11 that our app can process long messages that")
        XCTAssertEqual(msgChunks?[3], "4/11 consist of more than 10 parts. Character")
        XCTAssertEqual(msgChunks?[4], "5/11 counting tools can be a huge help in many")
        XCTAssertEqual(msgChunks?[5], "6/11 situations, especially when submitting")
        XCTAssertEqual(msgChunks?[6], "7/11 written material online. Online submission")
        XCTAssertEqual(msgChunks?[7], "8/11 forms frequently limit character input. A")
        XCTAssertEqual(msgChunks?[8], "9/11 college admissions essay may limit input to")
        XCTAssertEqual(msgChunks?[9], "10/11 6000 characters, while social media may")
        XCTAssertEqual(msgChunks?[10], "11/11 limit a status update to 280 characters.")
       
    }
    
    
    
    
    //Test if the function can handle extremely large input of over 100 parts
    func testSplitMessageWithAnExtremelyLongInput() {
        
        let inputSentence =  "Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters."
        
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        XCTAssertEqual(msgChunks?.count, 111)
       
        
    }
    
  
    //MARK: - NegativeTestCases
    
    //Test an input of a single word of over chunkSize characters
    func testSplitMessageWithInputOfSingleWordOverChunkSize() {
        
        let input51Chars = "123456789012345678901234567890123456789012345678901"
        let msgChunks = StringUtility.splitMessage(message: input51Chars)
        //Response should be nil to depict error
        XCTAssertNil(msgChunks)
    }
    
    //Test an input of a multiple words with a single word of over chunkSize characters
    func testSplitMessageWithInputContainingAWordOverChunkSize() {
        
        let inputSentence = "Hi, let's test an input over 50 characters 123456789012345678901234567890123456789012345678901"
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        //Response should be nil to depict error
        XCTAssertNil(msgChunks)
    }
    
    
    //Test a large input that should yield more than 10 message chunks but consists of a word that is longer than chunkSize
    func testSplitMessageWithALongInputAndAnUnAcceptableWord() {
        
        let inputSentence =  "Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. IamalongwordwithmorethanfiftycharactersAndImakesurethatAnErrorConditionOccurs counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters."
        
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        XCTAssertNil(msgChunks)
        
    }
    
    
    //Test if the function can handle large input and a word of length less than chunkSize but goes over the limit by adding prefix
    func testSplitMessageWithALongInputAndAWordUnderChunkSizeCharsButExceedsCharLimitWithPrefix() {
        
        let inputSentence =  "Test a large input that should yield more than 10 message chunks. IamOverFortyButUnderFiftyCharactersIamFortyEight . Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. A college admissions essay may limit input to 6000 characters, while social media may limit a status update to 280 characters. Test a large input that should yield more than 10 message chunks. So that we are sure that our app can process long messages that consist of more than 10 parts. Character counting tools can be a huge help in many situations, especially when submitting written material online. Online submission forms frequently limit character input. "
        
        let msgChunks = StringUtility.splitMessage(message: inputSentence)
        XCTAssertNil(msgChunks)
        
    }
    
    
    
    //MARK: - EdgeCases
    
    //Test edge case where characters are one less than the limit
    func testSplitMessageWithInputOf1CharLessThanChunkSize() {
        let input = StringUtility.randomString(length: chunkSize-1)
        let msgChunks = StringUtility.splitMessage(message: input)
        XCTAssertEqual(msgChunks?.count, 1)
        XCTAssertEqual(msgChunks?[0], input)
    }
    
    //Test edge case where characters are one more than the limit
    func testSplitMessageWithInputOf1CharMoreThanChunkSize() {
        let word1 = StringUtility.randomString(length: chunkSize-10)
        let word2 = StringUtility.randomString(length: 11)
        let input = word1 + " " + word2
        let msgChunks = StringUtility.splitMessage(message: input)
        XCTAssertEqual(msgChunks?.count, 2)
        XCTAssertEqual(msgChunks?[0], "1/2 " + word1)
        XCTAssertEqual(msgChunks?[1], "2/2 " + word2)
    }
    
    
    //Test  case where characters count is exactly as limit
    func testSplitMessageWithInputWordOfChunkSize() {
        let word = StringUtility.randomString(length: chunkSize)
        let msgChunks = StringUtility.splitMessage(message: word)
        XCTAssertEqual(msgChunks?.count, 1)
        XCTAssertEqual(msgChunks?[0], word)
    }
    
}

    
    


    
    
    
    
    

