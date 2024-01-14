//
//  ContentView.swift
//  Studyswift
//
//  Created by 健太郎 on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
//    変数の指定
    @State var outputText = "Hello,world!"
    var body: some View {
        
        VStack {
            Text(outputText)
                .font(.largeTitle)
//      ボタンの追加
            Button("切り替えボタン") {
                outputText = "Hi,Swift!"
            }
            .padding(.all)
            .background(.blue)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
