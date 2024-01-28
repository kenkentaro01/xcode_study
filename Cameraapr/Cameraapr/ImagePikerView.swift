//
//  ImagePikerView.swift
//  Cameraapr
//
//  Created by 健太郎 on 2024/01/27.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
//UIViewPickerControllerが表示されているかを管理
//    撮影画面の表示状態を管理する。撮影が終了したときやキャンセルボタンが押されたときに「false」を設定して画面を閉じる
//    Bindingを使用することでView間でデータの同期を保つことができます。
    @Binding var isShowSheet : Bool
//    撮影した写真を格納する変数
//    画面に表示される画像や外部から取り込んだ画像を管理するために使用される
//    最初は写真がない状態から開始する。初期値がnillとなるためオプショナル型で宣言する
    @Binding var captureImage: UIImage?
    
//    Coodinatorでコントローラーのdelegateを管理
    class Coordinator : NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
//        ImagePickerView型の定数を用意
        let parent : ImagePickerView
//        イニシャライザ
//        22行目で宣言したparentのこと
//        Coordinatorの親である「ImagePicker View」がself.paretに格納される
//        イニシャライザは構造体やクラスのインスタンスの生成の際に初期化のために使用する手続きのこと
        init(_ parent:ImagePickerView){
            self.parent = parent
        }
//        撮影が終わったときに呼ばれるdelegateメソッド　必ず必要
//        第一引数カメラ撮影を行う画面　第二引数　撮影した写真の情報を格納する
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            撮影した写真をcaptureImageに保存
//            UIImagePickerController.InfoKey.originalImageを指定することでカメラで撮影した写真が取得できる。
//            Any型についていろんなデータが格納できる。 「いろんな」→int stringでも入る
//            as? UIImageにより「Any」→「UIImage」へ型を変換している　これをダウンキャストという
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
//    cordinatorを生成swiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
//cordinatorクラスのインスタンスの生成
        Coordinator(self)
    }
//    Viewを生成するときに実行
    func makeUIViewController(context: Context) -> UIViewController {
//     UIViewControllerのインスタンスを生成
        let myImagePickerContoroller = UIImagePickerController()
//        sourceTypeにcameraを設定
//        写真の取得先を指定。.cameraを指定することでカメラから写真を取得することができる
        myImagePickerContoroller.sourceType = .camera
//        delegate設定
//        delegateを利用するために通知先を指定する必要がある。
//        通知先　→「どこにdelegateメソッドがあるのか」をせ知らせるために指定する必要がある
        myImagePickerContoroller.delegate = context.coordinator
//        UIViewControllerを返す
//        カメラの起動に必要なUIImagePickerControllerを返してカメラ撮影ができるように指示する。
        return myImagePickerContoroller
    }
//    Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        処理なし
    }
}
//didFinishPickingMediaWithInfo


//UIImagePickerControllerについて
//UIImagePickerControllerとはiOSデバイスに搭載されているカメラを使って写真や動画を撮影できる機能が提供されているクラス
