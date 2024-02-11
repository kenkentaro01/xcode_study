//
//  ContentView.swift
//  Okashiapr
//
//  Created by 健太郎 on 2024/02/11.
//

import SwiftUI

struct ContentView: View {
//    OkashiDataを参照する変数
    var OkashiDataList = OkashiData()
//    入力された文字列を保持する状態変数
    @State var  inputText = ""
    var body: some View {
        VStack{
//            文字を受け取るTextfieldを表示する
            TextField("キーワード",
//                      ＄をつけることで状態変数の値を参照せしてる
            text: $inputText,
//                      プレースフォルダーに表示するメッセージ
            prompt: Text("キーワードを入力してください"))
//            textfieldの入力が確定したタイミングで実行される
            .onSubmit {
//                入力完了直後に検索をする
                OkashiDataList.searchOkashi(keyword: inputText)
            }
//            キーボードの改行を検索に変更する
            .submitLabel(.search)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
