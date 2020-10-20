//
//  ViewController.swift
//  8.xyloPhone(Music App)
//
//  Created by swapnil jadhav on 19/10/20.
//  Copyright © 2020 t. All rights reserved.
//

/*
 
    //first solution
        
        /*
        let url = Bundle.main.url(forResource: "Frog", withExtension: "aiff")!
        
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            guard let player = audioPlayer else {
                return
            }
            
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
        catch let error as Error
        {
            print(error.localizedDescription)
        }*/
        
        
        
        //second solution
        
        /*
        
        if let url = Bundle.main.url(forResource: "Frog", withExtension: "aiff")
        {
            var mysound : SystemSoundID = 0
            
            AudioServicesCreateSystemSoundID(url as CFURL, &mysound)
            
            AudioServicesPlaySystemSound(mysound)
        }
 */
 */

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer?

    // var selectedFile : String = ""  //TRY TO AVOID GLOBAL variable
    
    var soundFile = ["note1","note2","note3","note4","note5","note6","note7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press(_ sender: UIButton) {
        
        
        //playsound()
       
        playsound(sounds:soundFile[sender.tag - 1])
    }
    func playsound(sounds:String)
    {
        let soundurl = Bundle.main.url(forResource: sounds, withExtension: "wav")
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: soundurl!)
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        
        audioPlayer?.play()
    }
    
}

