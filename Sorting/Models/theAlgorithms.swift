//
//  theAlgorithms.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import Foundation

func bogoSortStep(array: inout [Int]) -> [Int] {
    let a = Int.random(in: 0..<array.count)
    let b = Int.random(in: 0..<array.count)
    array.swapAt(a, b)
    
    return array
}

func bubbleSortStep(array: inout [Int]) -> [Int] {
    var counter = 0

    for i in 0..<array.count - 1 - counter {
        if array[i] > array[i+1] {
            array.swapAt(i, i+1)
        }
        counter += 1
    }
    return array
}

func insertionSortStep(array: inout [Int], ptr: Int) -> [Int] {
    if ptr > array.count - 1 {
        return array
    }
    for i in 0..<ptr {
        if array[ptr - i] < array[ptr - (i+1)] {
            array.swapAt(ptr - i, ptr - (i+1))
        }
        else {
            break
        }
    }
    return array
}

func selectionSortStep(array: inout [Int], ptr: Int) -> [Int] {
    func getMinimumIndex(array: [Int]) -> Int {
        var minimum = array[0]
        var minimumIndex = 0
        
        for i in 0..<array.count {
            if array[i] < minimum {
                minimum = array[i]
                minimumIndex = i
            }
        }
        
        return minimumIndex
    }

    let minIndex = getMinimumIndex(array: Array(array.dropFirst(ptr))) + ptr
    array.swapAt(ptr, minIndex)
            
    return array
}

func quickSortStep(array: inout [Int]) -> ([Int], Int, [Int]) {
        if array.count == 2 {
            if array[0] < array[1] {
                return ([array[0]], array[1], [])
            } else {
                return ([array[1]], array[0], [])
            }
        }
        
        var pivot = 0
        var leftPtr = 1
        var rightPtr = array.count-1
        
        while true {
            if array[leftPtr] <= array[pivot] {
                leftPtr += 1
            }
            if array[rightPtr] > array[pivot] {
                rightPtr -= 1
            }
            
            if rightPtr < leftPtr {
                array.swapAt(rightPtr, pivot)
                pivot = rightPtr
                break
            }
            
            if array[leftPtr] > array[pivot] && array[rightPtr] <= array[pivot] {
                array.swapAt(leftPtr, rightPtr)
            }
        }
    let arrayBeforePivot = Array(array.prefix(pivot))
    let arrayAfterPivot = Array(array.suffix(array.count - 1 - pivot))
    
    return (arrayBeforePivot, array[pivot], arrayAfterPivot)
}
