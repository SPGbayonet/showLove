//
//  LineHeartView.swift
//  showlove
//
//  Created by apple on 01/01/2024.
//

import SwiftUI

struct LineHeartView: View {
    
    
    var body: some View {
       
        
//        Path({ path in
//            path.move(to: point1)
//            path.addLine(to: point2)
//            path.addLine(to: point3)
//            path.addLine(to: point4)
//            path.addLine(to: point5)
//            path.addLine(to: point6)
//            path.addLine(to: point1)
//           
//        })
//        .stroke(style: .init(lineWidth: 4))
//        .foregroundColor(.red)
        
        Rectangle()
            .frame(width: 400,height: 400)
            .overlay {
                PolylineHeartShape(start: .init(x: 200, y: 180),spacing: 200)
                    .stroke(style: .init(lineWidth: 4))
                    .foregroundColor(.red)
            }
            .foregroundColor(.black)
            
    }
}

struct PolylineHeartShape: Shape {
    
    var start:CGPoint
    var spacing:CGFloat
    
    func path(in rect: CGRect) -> Path {
        let radius:CGFloat = rect.width/2.0 * 0.5
        
        let point1 = start
        
        let point2 = CGPoint(x: point1.x+radius, y: point1.y - radius)
        let point6 = CGPoint(x: point1.x-radius, y: point1.y - radius)
        
        let point3 = CGPoint(x: point1.x + radius+70, y: point1.y + 40)
        let point5 = CGPoint(x: point1.x - radius-50, y: point3.y)
        
        let point4 = CGPoint(x: point1.x+14, y:  point1.y+spacing)
        
        var heart = Path()
        heart.move(to: point1)
        heart.addLine(to: point2)
        heart.addLine(to: point3)
        heart.addLine(to: point4)
        heart.addLine(to: point5)
        heart.addLine(to: point6)
        heart.addLine(to: point1)
        return heart
    }
    
}

#Preview {
    LineHeartView()
}
