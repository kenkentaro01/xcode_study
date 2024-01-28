//
//  ContentView.swift
//  Cameraapr
//
//  Created by 健太郎 on 2024/01/27.
//

import SwiftUI

struct ContentView: View {
//    撮影した写真を穂s時する状態変数
//    nilは写真がない状態を示している
    @State var captureImage: UIImage? = nil
//    撮影がめんの開閉状態を管理
//    trueの時は画面を表示しする。
    @State var isShowSheet = false
    var body: some View {
        VStack {
//スペースの追加
            Spacer()
//            撮影した写真がある時
            if let captureImage{
//                撮影写真を表示
//                Imageは画像を表示するためのViewを作成する
                Image(uiImage: captureImage)
                .resizable()
                .scaledToFit()
            }
//            カメラを起動するボタン
            Button{
//                ボタンをタップしたときのアクション
//                カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    print("カメラは使用できます")
//                    カメラが使えるならisShowSheetをtrue
//                    togleメソッドによりtrue falseを切り替えることができる
                    isShowSheet.toggle()
                }else {
                    print("カメラ利用できません")
                }
            }label:{
//                テキスト表示
                Text("カメラを起動する")
//                横幅いっぱい
                    .frame(maxWidth: .infinity)
//                 高さ50ポイントを指定
                    .frame(height: 50)
//                文字列をセンタリング指定
                    .multilineTextAlignment(.center)
//                背景を青色に指定
                    .background(Color.blue)
//                文字色を白色に指定
                    .foregroundStyle(Color.white)
            }
            .padding()
//            sheetを表示
//            isPresentedで指定した状態変数がtrueの時実行
            .sheet(isPresented: $isShowSheet){
//                UIImagePickerControllerを表示
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
        }

    }
}

#Preview {
    ContentView()
}
