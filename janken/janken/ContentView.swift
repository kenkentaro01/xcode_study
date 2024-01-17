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
//            スペース追加
            Spacer()
            if jankenNumber == 0 {
//                初期画面のテキストを表示
                Text("これからじゃんけんをします。")
//                下辺に余白を設定
                    .padding(.bottom, 20.0)

            } else if jankenNumber == 1{
//                じゃんけんの数字が１だったらグー画像を指定
                //グー画像の指定
                Image(.gu)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
                Spacer()
    //            じゃんけんの種類指定
                Text("ぐー")
                //                下辺に余白を設定
                    .padding(.bottom, 20.0)
                
            } else if jankenNumber == 2{
//                 じゃんけんの数字が２だったらチョキ画像を指定
                //グー画像の指定
                Image(.choki)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
                Spacer()
    //            じゃんけんの種類指定
                Text("ちょき")
                //                下辺に余白を設定
                    .padding(.bottom, 20.0)
                
            } else{
//                じゃんけんが1,2以外ならパー
                //グー画像の指定
                Image(.pa)
                    .resizable()
                //        アスペクト比を保ったまま画面いっぱいに表示
                    .scaledToFit()
                Spacer()
    //            じゃんけんの種類指定
                Text("パー")
                //                下辺に余白を設定
                    .padding(.bottom, 20.0)
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
                    .frame(maxWidth: .infinity)
                    .frame(height:100)
                    .font(.title)
                    .background(.pink)
                    .foregroundColor(.white)
            })
        }

    }
}

#Preview {
    ContentView()
}
