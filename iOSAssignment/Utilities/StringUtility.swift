//
//  StringUtilities.swift
//  iOSAssignment
//
//  Created by Asim Parvez on 10/28/18.
//  Copyright © 2018 Asim Parvez. All rights reserved.
//

import Foundation

public let chunkSize = 50

class StringUtility {
    
    //MARK: Split Strings
   
    public static func splitMessage(message: String) -> [String]?{
        
        //If there is only one chunk return it as is
        if message.count <= chunkSize {
            return [message]
        }
        
        //Returns messages in chunks
        var messages = [String]()
        //Consists of all the space separated strings
        let comps = message.components(separatedBy: " ")
        //Will hold the current message, that is appended to
        var currentMessage = ""
        //Will hold the count for current message
        var messageCount = 1
        //Holds the number of digits required to represent total count
        var totalCountDigits = 1
        
        //We will loop through all the space separated components to create chunks of less than chunkSize characters
        var i = 0
        while  i < comps.count {
            
            //Get the component at index i
            let str = comps[i]
            
            //No of digits required to show the parts component at the start
            // of each message chunk i.e (x/y or x/yy etc)
            let noOfPrefixDigits = messageCount.digitCount + totalCountDigits + 1 + 1// 1 for / and 1 for space
            
            //If a single word can not fit in the message chunk show error
            if str.count + noOfPrefixDigits > chunkSize {
                print("Error")
                return nil
            }
            
            //Depending upon current message's character count either append the string or create a new message
            if (currentMessage.count + str.count + noOfPrefixDigits) <= chunkSize && currentMessage == "" {
                //if the sum of characters is below chunkSize and current string is empty
                currentMessage = str
            }
            else if (currentMessage.count + str.count + noOfPrefixDigits + 1) <= chunkSize && currentMessage != "" {
                //if the sum of characters is below chunkSize and current string is not empty
                currentMessage = currentMessage + " " + str
            }else {
                //if the sum of characters goes above chunkSize characters
                //increment the message count
                messageCount = messageCount + 1
                //Check if the number of digits for total count have changed
                let maxDigitCount = messageCount.digitCount
                if totalCountDigits < maxDigitCount {
                    //- if total digit count has changed, the prefix character count
                    //has changed for all previous strings
                    //- start the loop over again with the new prefix character
                    //count and start adding to messages array from scratch
                    totalCountDigits = maxDigitCount
                    //Force i to -1 so that it re-starts from 0 in next iteration
                    i = -1
                    currentMessage = ""
                    messageCount = 1
                    messages = [String]()
                }else {
                    //If the total digit count has not changed, append the message
                    //to the messages array
                    messages.append(currentMessage)
                    currentMessage = str
                }
            }
            //increment i at the end of each loop
            i = i + 1
        }
        
        //If the last message was not empty, append it to the messages array
        if currentMessage != "" {
            messages.append(currentMessage)
        }
        
        //Loop through all the messages and add prefix to each message.
        //Since at this point we know the exact number of messages.
        for i in 1...messages.count {
            messages[i-1] = String(format: "%d/%d %@",i,messages.count,messages[i-1])
        }
        return messages
        
    }
    
    
    
    //For String Generation During Tests
    public static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
    
}
