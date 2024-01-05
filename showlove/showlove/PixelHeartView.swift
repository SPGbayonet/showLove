//
//  PixelHeartView.swift
//  showlove
//
//  Created by apple on 03/01/2024.
//

import SwiftUI

struct PixelHeartView: View {
//    private let loveArray = self.getLoveArray()
    @State var offsetY:CGFloat = 0
    private let loveLength:CGFloat = 4
    
    var body: some View {
        
        let loveArray = self.getLoveArray()
        let array = [(3,3),(2,4),(4,2),(5,2),(6,2)]
        
        VStack (spacing:1) {
            ForEach(0..<15) { _a in
                HStack(spacing: 1) {
                    ForEach(0..<16) { _b in
                        let index = (_a,_b)
                        if loveArray.contains(where: {$0 == index}) {
                            Color(.black)
                                .frame(width: 20, height: 20)
                        }
                        else if array.contains(where: {$0 == index}) {
                            Color(.white)
                                .frame(width: 20, height: 20)
                        }
                        else {
                            Color(.red)
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                }
            }
        }
        .background(.black)
        .offset(y: offsetY)
        .frame(width: 400, height: 400)
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                animate()
            }
        }
        
//        Text("❤️")
//            .font(.system(size: 200,weight: .bold))
//            .offset(y: offsetY)
//            .onAppear{
//                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
//                    animate()
//                }
//            }
    }
    
    
    func getLoveArray(row:Int = 4) -> [(Int,Int)] {
        var temp = [(Int,Int)]()
        
        var n = 0
        for i in 0..<4 {
            for j in 0..<16 {
                if j < 4-n-1 || j > (15-4+1+n) {
                    temp.append((i,j))
                }
                if j >= (6+n) && j <= (9-n) {
                    temp.append((i,j))
                }
            }
            n += 1
        }
        
        n = 0
        for i in 8..<15 {
            for j in 0..<16 {
            if j <= n || j >= (15-n) {
                temp.append((i,j))
                }
            }
            n += 1
        }
        
        return temp
    }
    
    
    func animate() {
        withAnimation(Animation.linear(duration: 0.3)) {
            self.offsetY -= 10
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            withAnimation(Animation.linear(duration: 0.3)) {
//                self.offsetY -= 10
//            }
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.offsetY = 0
        }
    }
}


#Preview {
    PixelHeartView()
}
