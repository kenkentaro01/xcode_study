//
//  ContentView.swift
//  Timerapr
//
//  Created by 健太郎 on 2024/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationStackにより先頭の画面ということを宣言している
        NavigationStack{
            ZStack{
//                背景画面
                Image(.backgroundTimer)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
//                垂直にレイアウト
//                View間の感覚を30にする
                VStack(spacing: 30.0){
//                    テキストを表示する
                    Text("残り10秒")
                        .font(.largeTitle)
//                    水平にレイアウト
                    HStack{
//                        スタートボタン
                        Button{
//                            ボタンをタップした時のアクション
                        }label: {
//                         テキストを表示する
                            Text("スタート")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .frame(width: 140,height: 140)
                            .background(Color.start)
                            .clipShape(Circle())
                        }//スタートボタンはココまです
                        // ストップボタン
                        Button{
                            //                            ボタンをタップした時のアクション
                        }label: {
                            //                         テキストを表示する
                            Text("ストップ")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color.stop)
                                .clipShape(Circle())
                        }//スタートボタンはココまで
                    }
                }
            }
//            ナビゲーションにボタンを追加
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
//                    ナビゲーション遷移
                    NavigationLink{
                        SettingView()
                    }label:{
//                        テキストを表示
                        Text("秒数設定")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
