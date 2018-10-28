//
//  Int Extension.swift
//  iOSAssignment
//
//  Created by Asim Parvez on 10/28/18.
//  Copyright © 2018 Asim Parvez. All rights reserved.
//

import Foundation
public extension Int {
    /// returns number of digits in Int number
    public var digitCount: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
   
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
}
