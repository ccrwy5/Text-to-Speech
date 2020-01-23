//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Chris Rehagen on 1/22/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextView.layer.cornerRadius = 12.0
        
        let color : UIColor = UIColor( red: 78/255, green: 229/255, blue: 128/255, alpha: 1.0 )
        inputTextView.layer.masksToBounds = true
        inputTextView.layer.borderColor = color.cgColor
        inputTextView.layer.borderWidth = 1.0
        
        
        clearButton.layer.cornerRadius = 12.0
        playButton.layer.cornerRadius = 32.0
        pauseButton.layer.cornerRadius = 32.0
        
        speedLabel.text = "Speed: " + String(speedSlider.value)
        pitchLabel.text = "Pitch: " + String(pitchSlider.value)
        volumeLabel.text = "Volume: " + String(volumeSlider.value)


        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        
        let userTextInput = inputTextView.text
        let userSpeedInput = speedSlider.value
        let userpitchInput = pitchSlider.value
        let userVolumeInput = volumeSlider.value
    
        let utterance = AVSpeechUtterance(string: userTextInput!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-EN")
        utterance.rate = userSpeedInput
        utterance.pitchMultiplier = userpitchInput
        utterance.volume = userVolumeInput

        synthesizer.speak(utterance)
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)

    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        inputTextView.text = ""
    }
    
    @IBAction func speedSliderAdjusted(_ sender: Any) {
        speedLabel.text = "Speed: " + String(format: "%.1f", speedSlider.value)
    }
    
    @IBAction func pitchSliderAdjusted(_ sender: Any) {
        pitchLabel.text = "Pitch: " + String(format: "%.1f", pitchSlider.value)
    }
    
    @IBAction func volumeSliderAdjusted(_ sender: Any) {
        volumeLabel.text = "Volume: " + String(format: "%.1f", volumeSlider.value)
    }
    

}

