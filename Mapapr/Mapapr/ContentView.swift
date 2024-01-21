//
//  ContentView.swift
//  Mapapr
//
//  Created by 健太郎 on 2024/01/20.
//

import SwiftUI

struct ContentView: View {
//    入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    
//    検索キーワードを保持する状態変数　初期値は東京駅
    @State var displaySearchKey: String = "東京駅"
    
//    マップ種類　最初は標準から
    
    @State var displayMapType : MapType = .standard
    var body: some View {
//垂直にレイアウト
        VStack{
//            テキストフィールド（文字入力）
//            TextFieldの第一引数は説明
            TextField("キーワード",text: $inputText,prompt: Text("キーワードを入力してください"))
//            onSubmitは開業を行なったタイミングで{}内のコードが実行される
//            入力が完了された時
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            
//            マップの上に切り替えボタンを配置するためにZstackで重ね合わせる
//alignment: .bottomTrailingを設定すると画面右下に基準に配置される
            ZStack(alignment: .bottomTrailing){
                MapView(searchKey: displaySearchKey,mapType:displayMapType)
                
//                マップ種類切り替えボタン
                Button{
                    if displayMapType == .standard{
                        displayMapType = .satellite
                    }else if displayMapType == .satellite{
                        displayMapType = .hybrid
                    }else{
                        displayMapType = .standard
                    }
                }label: {
//                    ココで指定できるアイコンはxcodeで使用できるアイコンセット
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,height: 35.0)
                }
//                右の余白を２０空ける
                .padding(.trailing,20.0)
//                したの余白を３０空ける
                .padding(.bottom,30.0)
            }
//            マップを表示
            
        }
    }
}

#Preview {
    ContentView()
}
