//
//  ContentView.swift
//  showlove
//
//  Created by apple on 02/01/2024.
//

import SwiftUI
import AVFoundation

enum ContainedViewType:String {
    case line
    case simple
    case Pixe
    case real
    case result
}

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    @State var menuTitleStr = "144p"
    @State var containedViewType: ContainedViewType = .line
    
    
    
    var body: some View {
        
        VStack {
            containedView()
                .offset(y:0)
            Rectangle().frame(height: 20)
            Menu {
                Button("144p") {
                    menuTitleStr = "144p"
                    containedViewType = .line
                }
                Button("420p") {
                    menuTitleStr = "420p"
                    containedViewType = .simple
                }
                Button("720p") {
                    menuTitleStr = "720p"
//                    containedViewType = .real
                    containedViewType = .Pixe
                }
                Button("1080p") {
                    menuTitleStr = "1080p"
                    containedViewType = .result
                }
            } label: {
                HStack {
                    Text(menuTitleStr)
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(.black)
            }
            .padding(5)
            .background(.white)
            
            Spacer()
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(.black)
        .onAppear(perform: {
            playBMG()
        })
    }
    
    @ViewBuilder
    func containedView() -> some View {
        switch containedViewType {
        case .line:
            LineHeartView()
        case .simple:
            SimpleHeartView()
        case .result:
            MyHeartView()
        case .Pixe:
            PixelHeartView()
        case .real:
            RealHeartView()
        }
    }
    
    
    func playBMG(){
        let audioFilePath = Bundle.main.path(forResource: "v0300fg", ofType: "m4a")!
        let url = URL(fileURLWithPath: audioFilePath)
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.play()
    }
    
   
}

#Preview {
    ContentView()
}
