//
//  VideoCutter.swift
//  Spotify-TESTE
//
//  Created by Lucas Nascimento on 02/03/17.
//  Copyright © 2017 Lucas Nascimento. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

enum BackgroundVideoErrors: Error {
    case invalidVideo
}

class BackgroundVideo {
    
    var backGroundPlayer : AVPlayer?
    var videoURL: URL?
    var viewController: UIViewController?
    var hasBeenUsed: Bool = false
    
    
    init (on viewController: UIViewController, withVideoURL URL: String) {
        self.viewController = viewController
        
        
        let videoNameAndExtension:[String]? = URL.characters.split{$0 == "."}.map(String.init)
        if videoNameAndExtension!.count == 2 {
            if let videoName = videoNameAndExtension?[0] , let videoExtension = videoNameAndExtension?[1] {
                if let url = Bundle.main.url(forResource: videoName, withExtension: videoExtension) {
                    self.videoURL = url
                    self.backGroundPlayer = AVPlayer(url: self.videoURL!)
                } else {
                    print(BackgroundVideoErrors.invalidVideo)
                }
            }
        } else {
            print("Wrong video name format")
        }
    }
    
    
    deinit{
        
        if self.hasBeenUsed {
            NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
            NotificationCenter.default.removeObserver(self, name: .UIApplicationWillEnterForeground, object: nil)
        }
        
    }
    
    func setUpBackground(){
        self.backGroundPlayer?.actionAtItemEnd = .none
        self.backGroundPlayer?.isMuted = true
        
        let loginView: UIView = self.viewController!.view
        let playerLayer = AVPlayerLayer(player: self.backGroundPlayer)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.frame = loginView.frame
        loginView.layer.addSublayer(playerLayer)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            
        }
        catch {
            print("failed setting AVAudioSession Category to AVAudioSessionCategoryAmbient")
        }
        
        self.backGroundPlayer?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loopVideo), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loopVideo), name: .UIApplicationWillEnterForeground, object: nil)
        self.hasBeenUsed = true
        
    }
    
    @objc private func loopVideo() {
        self.backGroundPlayer?.seek(to: kCMTimeZero)
        self.backGroundPlayer?.play()
    }
    
    func pause() {
        self.backGroundPlayer?.pause()
        
    }
    func play() {
        self.backGroundPlayer?.play()
        
    }
    
    
}



