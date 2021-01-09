//
//  sequenceView.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import SwiftUI


struct sequenceView: View {
    
    var sequence: [Int]
    var pivot: Int
    var landscapeMode: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<sequence.count, id: \.self) { i in
                if i == pivot && pivot != -1 {
                    Rectangle()
                        .frame(width: 10, height: CGFloat(self.sequence[i])*5, alignment: .bottom)
                        .foregroundColor(Color.black)
                        .cornerRadius(10.0)
                } else {
                    Rectangle()
                        .frame(width: 5, height: CGFloat(self.sequence[i])*5, alignment: .bottom)
                        .foregroundColor(
                            Color.init(hue: landscapeMode ? Double(self.sequence[i])/40 : Double(self.sequence[i])/100, saturation: 1, brightness: 1, opacity: 1)
                        )
                        .cornerRadius(10.0)
                }
                
            }
        }
    }
}

struct sequenceView_Previews: PreviewProvider {
    static var previews: some View {
        sequenceView(sequence: [8, 51, 2, 19, 5, 6, 3, 2, 4, 90], pivot: 2, landscapeMode: false)
    }
}
