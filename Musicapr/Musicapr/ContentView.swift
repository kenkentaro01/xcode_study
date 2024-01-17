//
//  ContentView.swift
//  Musicapr
//
//  Created by 健太郎 on 2024/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            背景画面の指定
            Image(.background)
            
                .resizable()
//            セーフエリア外にまで表示されるようにしてい
                .ignoresSafeArea()
                .scaledToFill()
            HStack{
//                シンバルボタン
                Button{
//              ボタンをタップした時のアクション
                }label: {
                    Image(.cymbal)
                }
                Button{
//              ボタンをタップした時のアクション
                }label: {
                    Image(.guitar)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
