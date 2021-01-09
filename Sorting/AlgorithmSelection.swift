//
//  ContentView.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import SwiftUI

struct AlgorithmSelection: View {
    var body: some View {
        NavigationView {
            List(sortingAlgorithmData) { SortingAlgorithm in
                NavigationLink(destination: SortingView(algorithm: SortingAlgorithm)) {
                    Text(SortingAlgorithm.name)
                }
            }
            .navigationBarTitle(Text("Sorting Algorithms"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmSelection()
    }
}
