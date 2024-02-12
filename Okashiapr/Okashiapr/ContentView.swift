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
            
//            リストを表示する
            List(OkashiDataList.okashiList){okashi in
//                一つ一つの要素を取り出す
//                Listの表示内容を生成する
//                水平にレイアウト
                HStack{
//                    画像の読み込み、表示をする
//                    AsyncImageは画像を非同期で読み込むことができ、読み込み中も別の処理をすることができます。
//                    読み込みが完了するまで読み込み中の画像を表示することができる
                    AsyncImage(url: okashi.image){image in
//                        画像を用事する
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height:40)
                    }placeholder: {
//                        読み込み中はインジケータを表示する
                        ProgressView()
                        }
//                    テキストを表示する
                    Text(okashi.name)
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
