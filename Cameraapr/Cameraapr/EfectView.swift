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
    
//    フィルタ名を列挙した配列
//    0.モノクロ
//    1.chrine
//    2.Fade
//    3.Instant
//    4.Noir
//    5.process
//    6.Tonal
//    7.transfer
//    8.sepiatone
    let filterArray = [
    "CIPhotoEffectMono",
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CISepiaTone"]
//    洗濯中のエフェクト
    @State var filterSelectNumber = 0
    
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
//                フィルタ名を指定
                let filterName = filterArray[filterSelectNumber]
//                次回に適応するフィルタを決める
                filterSelectNumber += 1
//                最後のフィルタまで適応した場合
                if filterSelectNumber == filterArray.count{
                    filterSelectNumber = 0
                }
//                元々の画像の回転角度を取得
//                CoreImageで使えるデータ型に変換する際に、画像の回転角度の情報は失われてしまうため保存しておく。
                let rotate = captureImage.imageOrientation
//                UIImage軽視の画像をCIImage形式に変換
                let inputImage = CIImage(image: captureImage)
                
//                フィルタ名を指定してCIFilterのインスタンスを取得
                guard let effectFilter = CIFilter(name: filterName) else{
                    return
                }
//                フィルタ加工のパラメータを初期化
                effectFilter.setDefaults()
//                インスタンスにフィルタ加工する元画像を設定
                effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
//                フィルタ加工を行う情報を生成
                guard let outputImage = effectFilter.outputImage else{
                    return
                }
//                CIContextのインスタンスを取得
                let ciContext = CIContext(options: nil)
//                フィルタ加工後の画像を設定
                guard let cgImage =  ciContext.createCGImage(outputImage, from: outputImage.extent)else{
                    return
                }
//                フィルタ加工後の画像をCGimage形式から
//                UIimage形式に変更。その際に回転角度を指定
                showImage = UIImage(
                cgImage: cgImage,
                scale:1.0,
                orientation:rotate
                )
            }label: {
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
            }
            .padding()
            
            if let showImage = showImage?.resized(){
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
//                エフェクト編集画面を閉じる
                isShowSheet.toggle()
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
//        onAppearはVstackが表示されたときに実行される
        .onAppear{
//            撮影した写真を表示する写真に設定
            showImage = captureImage
        }

    }
}

#Preview {
    EfectView(
        isShowSheet: .constant(true),
//        UIimageは画像を管理するクラス
//        セットする写真は必ず存在するため「！」を指定して、非オプショナルのUIImage型に変換しています。
        captureImage: UIImage(named: "preview_use")!
    )
}
//フィルタを敵将してエフェクトを与えるのは「Core Image」を利用することで実現できる
