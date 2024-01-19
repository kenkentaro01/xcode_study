//
//  ContentView.swift
//  Musicapr
//
//  Created by 健太郎 on 2024/01/17.
//

import SwiftUI

struct ContentView: View {
//    音を鳴らすためのsoundPlayerクラスのインスタンスを生成する
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack {
//            背景画面の指定
            Image(.background)
                .backgroundModifier()
            
//                .resizable()
////            セーフエリア外にまで表示されるようにしてい
//                .ignoresSafeArea()
//                .scaledToFill()
            HStack{
//                シンバルボタン
                Button{
//              ボタンをタップした時のアクション
//                    シンバルの音を鳴らす
                    soundPlayer.cymbalPlay()
                }label: {
                    Image(.cymbal)
                }
                Button{
//              ボタンをタップした時のアクション
                    soundPlayer.guitarPlay()
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
