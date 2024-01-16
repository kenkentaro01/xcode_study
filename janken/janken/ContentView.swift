//
//  ContentView.swift
//  janken
//
//  Created by 健太郎 on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
//    stateによって値を更新することができるようになる。
    @State var jankenNumber = 0
    var body: some View {
        VStack {
            if jankenNumber == 0 {
//                初期画面のテキストを表示
                Text("これからじゃんけんをします。")
            } else if jankenNumber == 1{
//                じゃんけんの数字が１だったらグー画像を指定
                //グー画像の指定
                Image(.gu)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
    //            じゃんけんの種類指定
                Text("ぐー")
                
            } else if jankenNumber == 2{
//                 じゃんけんの数字が２だったらチョキ画像を指定
                //グー画像の指定
                Image(.choki)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
    //            じゃんけんの種類指定
                Text("ちょき")
                
            } else{
//                じゃんけんが1,2以外ならパー
                //グー画像の指定
                Image(.pa)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
    //            じゃんけんの種類指定
                Text("パー")
                
            }//ifココまで

            Button(action: {
//次のじゃんけんへ
//                randomメソッドは1から始まる3つの数字をランダムに生成する。
//                jankenNumber = Int.random(in: 1...3)
                
//                新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newjankenNumber = 0
//                repeatは繰り返し、pythonでいうfor構文
                repeat{
                    newjankenNumber = Int.random(in: 1...3)
//                    異なる結果の時はrepeatを抜ける
                } while jankenNumber == newjankenNumber
                
//                新しいじゃんけんの結果を格納
                jankenNumber = newjankenNumber
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
