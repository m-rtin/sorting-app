//
//  randomNumberSequence.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import Foundation

class RandomNumberSequence {
    
    var lengthOfSequence: Int
    var maxNumber: Int
    
    
    init(lengthOfSequence: Int, maxNumber: Int) {
        self.lengthOfSequence = lengthOfSequence
        self.maxNumber = maxNumber
    }
    
    func generateRandomSequence() -> [Int] {
        var randomSequence = [Int]()

        
        for _ in 0..<lengthOfSequence {
            randomSequence.append(Int.random(in: 1..<self.maxNumber))
        }
        return randomSequence
    }
}
