//
//  EfectView.swift
//  Cameraapr
//
//  Created by 健太郎 on 2024/01/29.
//

import SwiftUI

struct EfectView: View {
    //        エフェクト管理画面の開閉状態を管理
            @Binding var isShowSheet: Bool
    //        撮影した写真
//    letで定数にしているのは編集するための元写真が常に保存されるため
            let captureImage : UIImage
    //        表示する写真
//    編集後の写真を保存しておく
            @State var showImage : UIImage?
    var body: some View {
//        縦方向にレイアウト
        VStack{
            Spacer()
            if let showImage{
//                表示する写真があるばいいは画面に表示
                Image(uiImage: showImage)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
//            エフェクトボタン
            Button{
//                ボタンをタップした時のアクション
            }label: {
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
            }
            .padding()
            
            if let showImage{
                let shareImage = Image(uiImage: showImage)
//                共有シート
                ShareLink(item:shareImage,subject: nil,message: nil,preview: SharePreview("Photo",image: shareImage)){
                    Text("シェア")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                }
                .padding()
            }
            Button{
//                ボタンをタップした時のアクション
            }label: {
                Text("閉じる")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
            }
            .padding()
        }
        .onAppear{
//            撮影した写真を表示する写真に設定
            showImage = captureImage
        }

    }
}

#Preview {
    EfectView()
}
