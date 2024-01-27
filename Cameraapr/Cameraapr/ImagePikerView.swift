//
//  ImagePikerView.swift
//  Cameraapr
//
//  Created by 健太郎 on 2024/01/27.
//

import SwiftUI

struct ImagePikerView: UIViewControllerRepresentable {
//UIViewPickerControllerが表示されているかを管理
//    撮影画面の表示状態を管理する。撮影が終了したときやキャンセルボタンが押されたときに「false」を設定して画面を閉じる
    @Binding var isShowSheet : Bool
//    撮影した写真を格納する変数
//    画面に表示される画像や外部から取り込んだ画像を管理するために使用される
//    最初は写真がない状態から開始する。初期値がnillとなるためオプショナル型で宣言する
    @Binding var captureImage: UIImage?
    
//    Coodinatorでコントローラーのdelegateを管理
    class Coordinator : NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
//        ImagePickerView型の定数を用意
        let parent :ImagePikerView
//        イニシャライザ
        init(_ parent: ImagePikerView){
            self.parent = parent
        }
//        撮影が終わったときに呼ばれるdelegateメソッド　必ず必要
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            撮影した写真をcaptureImageに保存
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.captureImage = originalImage
            }
//            sheetを閉じる
            parent.isShowSheet.toggle()
        }
//        キャンセルボタンを選択された時の呼ばれるddelegateメソッド　必ず必要
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet.toggle()
        }
    }
    
}
//didFinishPickingMediaWithInfo
