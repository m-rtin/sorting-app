//
//  ButtonView.swift
//  Sorting
//
//  Created by Martin Voigt on 26.10.20.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText: String
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(buttonText)
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .background(Color.init(red: 68/255, green: 75/255, blue: 110/255, opacity: 1))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "New") {
            
        }
    }
}
