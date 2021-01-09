//
//  SortingView.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import SwiftUI
import Combine

struct SortingView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @State private var landscapeMode: Bool = false
    
    var algorithm: SortingAlgorithm
    @State private var randomSequence = [Int]()
    @State private var cancelable : AnyCancellable?
    @State var showingComplexityInfo = false
        
    // for selection and insertion sort
    @State private var pivotPointer: Int = 0
    
    // for quick sort
    @State private var quickSortResult = [[Int]]()
    @State private var firstTime: Bool = true
    @State private var quickSortPivotIndex: Int = 0
    
    
    var body: some View {
        VStack {
            Button(action: {
                self.showingComplexityInfo.toggle()
            }, label: {
                Text("More information")
                    .foregroundColor(Color.init(red: 68/255, green: 75/255, blue: 110/255, opacity: 1))
            })
            .sheet(isPresented: $showingComplexityInfo) {
                AlgorithmInfoView(algorithm: algorithm)
            }
            .padding(.top, 10)
            
            Spacer()
            
            if randomSequence.count == 0 {
                Text("Press the New button!")
            } else {
                switch algorithm.name {
                case "Insertion Sort":
                    sequenceView(sequence: randomSequence, pivot: pivotPointer, landscapeMode: landscapeMode)
                        .padding()
                case "Selection Sort":
                    sequenceView(sequence: randomSequence, pivot: pivotPointer, landscapeMode: landscapeMode)
                        .padding()
                case "Quick Sort":
                    sequenceView(sequence: randomSequence, pivot: quickSortPivotIndex, landscapeMode: landscapeMode)
                        .padding()
                default:
                    sequenceView(sequence: randomSequence, pivot: -1, landscapeMode: landscapeMode)
                        .padding()
                }
            }
            
            Spacer()
            
            HStack {
                // Generate new random sequence
                ButtonView(buttonText: "New") {
                    // iPhone portrait mode
                    if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                        let generator = RandomNumberSequence(lengthOfSequence: 60, maxNumber: 110)
                        self.randomSequence = generator.generateRandomSequence()
                        landscapeMode = false
                    }
                    // iPhone landscape mode
                    else {
                        let generator = RandomNumberSequence(lengthOfSequence: 130,
                                                             maxNumber: 40)
                        self.randomSequence = generator.generateRandomSequence()
                        landscapeMode = true
                    }
                    
                    pivotPointer = 0
                    quickSortPivotIndex = 0
                    quickSortResult = [[]]
                    firstTime = true
                }
                
                // Make one sorting step
                ButtonView(buttonText: "Next") {
                    withAnimation {
                        if randomSequence == randomSequence.sorted() {
                            pivotPointer = 0
                        } else {
                            if algorithm.name == "Quick Sort" {
                                if firstTime {
                                    quickSortResult = [randomSequence]
                                    firstTime = false
                                }
                                algorithm.applyQuicksortOnSubarrays(resultArray: &quickSortResult, pivotIndex: &quickSortPivotIndex, randomSequence: &randomSequence)
                            }
                            else {
                                randomSequence = algorithm.makeStep(array: &randomSequence, ptr: pivotPointer)
                                pivotPointer += 1
                            }
                        }
                    }
                }
                
                // Sort the random sequence
                ButtonView(buttonText: "Sort") {
                    cancelable = Timer.publish(
                        every: 0.5,
                        on: RunLoop.main,
                        in: RunLoop.Mode.default
                    ).autoconnect().sink { (Date) in
                        withAnimation(Animation.easeInOut(duration: 1)) {
                            if algorithm.name == "Quick Sort" {
                                if firstTime {
                                    quickSortResult = [randomSequence]
                                    firstTime = false
                                }
                                algorithm.applyQuicksortOnSubarrays(resultArray: &quickSortResult, pivotIndex: &quickSortPivotIndex, randomSequence: &randomSequence)
                            }
                            else {
                                randomSequence = algorithm.makeStep(array: &randomSequence, ptr: pivotPointer)
                                pivotPointer += 1
                            }
                        }
                        if randomSequence == randomSequence.sorted() {
                            self.cancelable?.cancel() }
                    }
                }
            }
        }
        .navigationBarTitle(Text(algorithm.name), displayMode: .inline)
    }
    
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SortingView(algorithm: SortingAlgorithm(id: 1, name: "Quick Sort", timeComplexityWorstCase: "O(1)", timeComplexityBestCase: "O(1)", timeComplexityAverageCase: "O(1)", spaceComplexityWorstCase: "O(1)", spaceComplexityBestCase: "O(1)", spaceComplexityAverageCase: "O(1)"))
            SortingView(algorithm: SortingAlgorithm(id: 1, name: "Insertion Sort", timeComplexityWorstCase: "O(1)", timeComplexityBestCase: "O(1)", timeComplexityAverageCase: "O(1)", spaceComplexityWorstCase: "O(1)", spaceComplexityBestCase: "O(1)", spaceComplexityAverageCase: "O(1)"))
        }
    }
}
