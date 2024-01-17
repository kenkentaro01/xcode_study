//
//  SoundPlayer.swift
//  Musicapr
//
//  Created by 健太郎 on 2024/01/17.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
//シンバル音源データを読み込み
//    letは一度値を設定したら変更できないといった指定
//    NSDataAssetはAsset .xcasset内のファイルや画像を管理してくれるクラス
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    
//    シンバル用プレイヤー変数
//    [!]は強制アンラップ
    var cymbalPlayer : AVAudioPlayer!
    
    func cymbalPlay(){
//        tryとdoーcatchを組み合わせて例外処理を行います。
        do{
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            //        シンバルの音源を再生
            cymbalPlayer.play()
        }catch{
            print("シンバルで、エラーが発生しました。")
        }
    }
    
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    var guitarPlayer : AVAudioPlayer!
    
    func guitarPlay(){
        do{
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            
            guitarPlayer.play()
        }catch{
            print("ギターでエラーが発生しました。")
        }
    }
}
