//
//  MyHeartView.swift
//  showlove
//
//  Created by apple on 02/01/2024.
//

import SwiftUI

struct MyHeartView: View {
    var body: some View {
       
        VStack {
            Spacer()
            
            Text("YOU")
                .font(.system(size: 100,weight: .bold))
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 4)
                        .padding(.horizontal,-10)
                }
            
        }
        .frame(width: 400,height: 400)
            
            
        
    }
}

#Preview {
    MyHeartView()
}
