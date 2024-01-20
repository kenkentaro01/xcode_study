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
//            マップを表示
            MapView(searchKey: displaySearchKey)
        }
    }
}

#Preview {
    ContentView()
}
