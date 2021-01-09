//
//  ComplexityView.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import SwiftUI

struct AlgorithmInfoView: View {
    
    var algorithm: SortingAlgorithm
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Time Complexity")
                .fontWeight(.bold)
            Text("Best: \(algorithm.timeComplexityBestCase), Average: \(algorithm.timeComplexityAverageCase), Worst: \(algorithm.timeComplexityWorstCase)")
                .padding(.bottom, 5)
                
            Text("Space Complexity")
                .fontWeight(.bold)
            Text("Best: \(algorithm.spaceComplexityBestCase), Average: \(algorithm.spaceComplexityAverageCase), Worst: \(algorithm.spaceComplexityWorstCase)")
        }
    }
}

struct ComplexityView_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmInfoView(algorithm: SortingAlgorithm(id: 1, name: "Bubble", timeComplexityWorstCase: "1", timeComplexityBestCase: "2", timeComplexityAverageCase: "3", spaceComplexityWorstCase: "4", spaceComplexityBestCase: "5", spaceComplexityAverageCase: "6"))
        
    }
}
