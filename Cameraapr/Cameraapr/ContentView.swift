//
//  ContentView.swift
//  Cameraapr
//
//  Created by 健太郎 on 2024/01/27.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
//    撮影した写真を穂s時する状態変数
//    nilは写真がない状態を示している
    @State var captureImage: UIImage? = nil
//    撮影がめんの開閉状態を管理
//    trueの時は画面を表示しする。
    @State var isShowSheet = false
//    フォトライブラリーで選択した写真を管理
    @State var photoPickerSelectedImage: PhotosPickerItem? = nil
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
//            フォトライブラリーから選択する
//            第二引数　.imagesとすることで静止画のみとなる
//            .automaticとするとフォトライブラリーの全てが対象となる
            PhotosPicker(selection: $photoPickerSelectedImage, matching: .images, preferredItemEncoding: .automatic, photoLibrary: .shared()){
//                    テキストに表示
                    Text("フォトライブラリから選択する")
//                    横幅いっぱい
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .padding()
}
            .onChange(of: photoPickerSelectedImage, initial:true,{
            oldValue,newValue in
//                 選択した写真がある時
                if let newValue{
//                    Data型で写真を取り出す
//                    Data型は非常に汎用性がたかく、画像、音声、テキストなど、どのような種類のバイナリデータでも表現することができます
//                    写真はバイナリデータとして存在するため、その内容をData型として扱う
                    newValue.loadTransferable(type: Data.self){result in
                        switch result{
                        case .success(let data):
//                            写真がある時
                            if let data{
                                captureImage = UIImage(data: data)
                            }
                        case .failure:
                            return
                        }}
                }
            })
            if let captureImage{
                let shareImage = Image(uiImage: captureImage)
//                共有シート
//                第一引数:共有するコンテンツ　第二引数:共有する時の件名　第三引数:共有する時の本文
                ShareLink(item: shareImage, subject:nil, message: nil, preview: SharePreview("Photo",image: shareImage)){
//                    テキストに表示
                    Text("SNSに投稿する")
//                    横幅いっぱい
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .padding()
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
