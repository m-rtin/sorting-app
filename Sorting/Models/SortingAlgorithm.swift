//
//  SortingAlgorithm.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import Foundation

struct SortingAlgorithm: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var timeComplexityWorstCase: String
    var timeComplexityBestCase: String
    var timeComplexityAverageCase: String
    var spaceComplexityWorstCase: String
    var spaceComplexityBestCase: String
    var spaceComplexityAverageCase: String
    
    func makeStep(array: inout [Int], ptr: Int) -> [Int] {
        switch self.name {
        case "Bogosort":
            array = bogoSortStep(array: &array)
        case "Bubble Sort":
            array = bubbleSortStep(array: &array)
        case "Insertion Sort":
            array = insertionSortStep(array: &array, ptr: ptr)
        case "Selection Sort":
            array = selectionSortStep(array: &array, ptr: ptr)
        default:
            print("default")
        }
        return array
    }
    
    func makeQuicksortStep(array: inout [Int]) -> ([Int], Int, [Int]) {
        let (beforePivot, pivot, afterPivot) = quickSortStep(array: &array)
        return (beforePivot, pivot, afterPivot)
    }
    
    func applyQuicksortOnSubarrays(resultArray: inout [[Int]], pivotIndex: inout Int, randomSequence: inout [Int]) {
        for (index, sequence) in resultArray.enumerated() {
            if sequence.count > 1 {
                var seq = sequence
                let (before, pivot, after) = self.makeQuicksortStep(array: &seq)
                resultArray.remove(at: index)
                resultArray.insert(before, at: index)
                pivotIndex = index + 1
                resultArray.insert([pivot], at: pivotIndex)
                resultArray.insert(after, at: index+2)
                randomSequence = resultArray.reduce([], +)
                break
            }
        }
    }
}


