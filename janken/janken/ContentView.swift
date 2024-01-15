//
//  ContentView.swift
//  janken
//
//  Created by 健太郎 on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //グー画像の指定
            Image(.gu)
                .resizable()
            //        アスペクト比を保ったまま画面いっぱいに表示
                .scaledToFit()
//            じゃんけんの種類指定
            Text("ぐー")
            Button(action: {
//                ボタンがタップされた時の動きを記述
                print("タップされたよ！")
            }, label: {
//                buttonに表示する文字を指定
                Text("じゃんけんをする！")
            })
        }

    }
}

#Preview {
    ContentView()
}
