//
//  SimpleHeartView.swift
//  showlove
//
//  Created by apple on 05/01/2024.
//

import SwiftUI

struct SimpleHeartView: View {
    var body: some View {
        Rectangle()
            .frame(width: 400,height: 400)
            .overlay {
                SimpleHeartShape(start: .init(x: 200, y: 180),spacing: 200)
                    .stroke(style: .init(lineWidth: 4))
                    .foregroundColor(.red)
            }
            .foregroundColor(.black)
    }
}

struct SimpleHeartShape: Shape {
    
    var start:CGPoint
    var spacing:CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let radius:CGFloat = rect.width/2.0 * 0.4
        var path = Path()
        let center = start
        
        
        path.addArc(center: .init(x: center.x+radius, y: center.y), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addQuadCurve(to: .init(x: center.x, y: center.y+spacing),
                          control: .init(x: center.x+radius*2, y: center.y + 40))
        
        path.addQuadCurve(to: .init(x: center.x-radius*2, y: center.y),
                          control: .init(x: center.x-radius*2, y: center.y+40))
        
        //        path.addLine(to: .init(x: center.x, y: center.y+100))
        //
        //        path.addLine(to: .init(x: center.x-100, y: center.y))
        //
        path.addArc(center: .init(x: center.x-radius, y: center.y), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        
        return path
        
    }
    
}

#Preview {
    SimpleHeartView()
}
