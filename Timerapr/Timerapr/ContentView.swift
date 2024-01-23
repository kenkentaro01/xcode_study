//
//  ContentView.swift
//  Timerapr
//
//  Created by 健太郎 on 2024/01/21.
//

import SwiftUI

struct ContentView: View {
//    タイマーの変数を作成
    @State var timerHandler: Timer?
//    カウントの変数を作成
    @State var count = 0
    
//    永続化する秒数設定
//    Userdefaultはアプリで使用する値を保存する機能
//    アプリを停止して再度起動させたときにUserdefaultsを利用して保存していた値を利用
//    「データの永続化」＝データを保存して復元できるようにすること
    @AppStorage("timer_value") var timerValue = 10
    
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
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
//                    水平にレイアウト
                    HStack{
//                        スタートボタン
                        Button{
//                            ボタンをタップした時のアクション
//                            タイマーをカウントダウン開始する関数を呼び出す
                            startTImer()
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
                            if let timerHandler{
//                                もしタイマーが実行中だったら停止
                                if timerHandler.isValid == true{
//                                    タイマー停止
                                    timerHandler.invalidate()
                                }
                            }
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
//            画面が実行されるときに実行される
            .onAppear{
//                カウントの変数を初期化
                count = 0
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
    func countDownTimer(){
//        経過時間に+1していく
        count += 1
        
//        残り時間が0以下の時タイマーを止める
        if timerValue - count <= 0{
//            タイマー停止
            timerHandler?.invalidate()
        }
    }
//    タイマーをカウントダウン開始する関数
    func startTImer(){
//        timerHandlerをアンラップ
        if let timerHandler{
//            もしタイマーが実行中ならスタートしない
            if timerHandler.isValid == true{
//                何も処理しない
                return
            }
        }
//        残り時間が0以下のとき、countを0に初期化する
        if timerValue - count <= 0{
//            countを初期化する
            count = 0
        }
//        タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1,
//                                            inの前の[_]はクロージャの引数の省略を意味する
//  repeatをfaleseにすると繰り返しが1回のみになる
                                            repeats: true){_ in
            
//            タイマー実行時に呼び出される
//            1秒ごとに実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
    }
}

#Preview {
    ContentView()
}
