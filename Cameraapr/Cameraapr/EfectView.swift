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

    }
}

#Preview {
    EfectView()
}
