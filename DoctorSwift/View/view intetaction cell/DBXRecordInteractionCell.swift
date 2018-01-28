//
//  DBXRecordInteractionCell.swift
//  DoctorSwift
//
//  Created by Apple on 27/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class DBXRecordInteractionCell: UITableViewCell {
    
    var recorder: AVAudioRecorder!
    
    var player: AVAudioPlayer!
    var meterTimer: Timer!
    
    var soundFileURL: URL!

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var recordButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reloadInput()  {
        setSessionPlayback()
        askForNotifications()
        checkHeadphones()
        recordButton.tintColor = UIColor(red: 16/255.0, green: 171/255.0, blue: 166/255.0, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func updateAudioMeter(_ timer: Timer) {
        
        if let recorder = self.recorder {
            if recorder.isRecording {
                let min = Int(recorder.currentTime / 60)
                let sec = Int(recorder.currentTime.truncatingRemainder(dividingBy: 60))
                let s = String(format: "%02d:%02d", min, sec)
                
                let  ssss = Float(recorder.currentTime - 0)
                
//                statusLabel.text = s
               progressBar.progress = (ssss / 59)
                
                
                let layer = CAShapeLayer()
                layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: 50).cgPath
                
                
                layer.fillColor = UIColor.red.cgColor
                //playButton.layer.addSublayer(layer)
                print(sec)
                recorder.updateMeters()
                
                print(recorder.currentTime)
                
                if sec == 59{
                    recorder.stop()
                    player?.stop()
                     recordButton.setImage(UIImage(named: "interaction_play_icon"), for: .normal)
                    
                    
                    recordButton.tintColor = UIColor(red: 16/255.0, green: 171/255.0, blue: 166/255.0, alpha: 1.0)
                    meterTimer.invalidate()
                }
                // if you want to draw some graphics...
                //var apc0 = recorder.averagePowerForChannel(0)
                //var peak0 = recorder.peakPowerForChannel(0)
            }
        }
    }
    @IBAction func recordOrPlayClick(_ sender: Any) {
        print("\(#function)")
        //sss()
        
        if player != nil && player.isPlaying {
            print("stopping")
            player.stop()
             recordButton.setImage(UIImage(named: "interaction_play_icon"), for: .normal)
        }
        
        else{
            
         if recorder == nil {
            print("recording. recorder nil")
            //recordButton.setTitle("Pause", for: .normal)
             recordButton.setImage(UIImage(named: "interaction_pause_icon"), for: .normal)
//            playButton.isEnabled = false
//            stopButton.isEnabled = true
            recordWithPermission(true)
            return
        }
        
     if recorder != nil && recorder.isRecording {
            print("pausing")
             //player.delegate = self
            //recorder.pause()
             self.recorder.stop()
             progressBar.progress = 0
            recordButton.setImage(UIImage(named: "interaction_play_icon"), for: .normal)
           
            
           // recordButton.setTitle("Continue", for: .normal)
            
        } else {
            
            
            
            
            print("recording")
            var url: URL?
            url = self.recorder.url
        
        
           // url = URL(fileURLWithPath: "http://dawaibox-prod.s3.amazonaws.com/2bba3979-4c08-4b91-b5d0-feb394b30720.m4a")
        
        
//        var urlstring = "http://dawaibox-prod.s3.amazonaws.com/2bba3979-4c08-4b91-b5d0-feb394b30720.m4a"
//        var url = NSURL(string: urlstring)
//        print(url)
        
//        let url = URL(string: "http://dawaibox-prod.s3.amazonaws.com/2bba3979-4c08-4b91-b5d0-feb394b30720.m4a")
        
       
       
            do {
                self.player = try AVAudioPlayer(contentsOf: url!)
               // stopButton.isEnabled = true
                player.delegate = self
                player.prepareToPlay()
                player.volume = 1.0
                player.play()
            } catch {
                self.player = nil
                print(error.localizedDescription)
            }
            
           
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progressBar.setProgress(Float(player.currentTime/player.duration), animated: false)
            //                statusLabel.text = s
           
            recordButton.setImage(UIImage(named: "interaction_pause_icon"), for: .normal)
//            recordButton  = UIButton(type: .custom)
//            let image = UIImage(named: "interaction_pause_icon")?.withRenderingMode(.alwaysTemplate)
//            recordButton.setImage(image, for: .normal)
//            recordButton.tintColor = UIColor.red
            //progressLoad()
           // recordButton.setTitle("Pause", for: .normal)
            //playButton.isEnabled = false
            //stopButton.isEnabled = true
            //            recorder.record()
            //recordWithPermission(false)
        }
        }
        
    }
    
    
    
    func sss(){
        if let audioUrl = URL(string: "http://freetone.org/ring/stan/iPhone_5-Alarm.mp3") {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            
            //let url = Bundle.main.url(forResource: destinationUrl, withExtension: "mp3")!
            
            do {
                self.player = try AVAudioPlayer(contentsOf: destinationUrl)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    @objc func updateAudioProgressView()
    {
    if player.isPlaying
    {
    // Update progress
    progressBar.setProgress(Float(player.currentTime/player.duration), animated: true)
    }
    }
    
//    func progressLoad(){
//        if (self.player != nil)  {
//             let  ssss = Float(player.currentTime - 0)
//            progressBar.progress = (ssss / 59)
//
//           // print("sssssssss")
//        }
//        progressLoad()
//    }
    func play() {
        print("\(#function)")
        
        
        var url: URL?
        if self.recorder != nil {
            
            print("set up deta1")
            url = self.recorder.url
        } else {
            
            print("set up deta")
            
            url = self.soundFileURL!
        }
        print("playing \(String(describing: url))")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url!)
            //stopButton.isEnabled = true
            player.delegate = self
            player.prepareToPlay()
            player.volume = 1.0
            player.play()
        } catch {
            self.player = nil
            print(error.localizedDescription)
        }
    }
    
    func setupRecorder() {
        print("\(#function)")
        
        let format = DateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "recording-\(format.string(from: Date())).m4a"
        print(currentFileName)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.soundFileURL = documentsDirectory.appendingPathComponent(currentFileName)
        print("writing to soundfile url: '\(soundFileURL!)'")
        
        if FileManager.default.fileExists(atPath: soundFileURL.absoluteString) {
            // probably won't happen. want to do something about it?
            print("soundfile \(soundFileURL.absoluteString) exists")
        }
        
        let recordSettings: [String: Any] = [
            AVFormatIDKey: kAudioFormatAppleLossless,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 32000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        
        
        do {
            recorder = try AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            recorder.delegate = self
            recorder.isMeteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
        } catch {
            recorder = nil
            print(error.localizedDescription)
        }
        
    }
    
    func recordWithPermission(_ setup: Bool) {
        print("\(#function)")
        
        AVAudioSession.sharedInstance().requestRecordPermission {
            [unowned self] granted in
            if granted {
                
                DispatchQueue.main.async {
                    print("Permission to record granted")
                    self.setSessionPlayAndRecord()
                    if setup {
                        self.setupRecorder()
                    }
                    self.recorder.record()
                    
                    self.meterTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                           target: self,
                                                           selector: #selector(self.updateAudioMeter(_:)),
                                                           userInfo: nil,
                                                           repeats: true)
                    
                }
            } else {
                print("Permission to record not granted")
            }
        }
        
        if AVAudioSession.sharedInstance().recordPermission() == .denied {
            print("permission denied")
        }
    }
    
    func setSessionPlayback() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
            
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    
    func setSessionPlayAndRecord() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    
    func deleteAllRecordings() {
        print("\(#function)")
        
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(at: documentsDirectory,
                                                            includingPropertiesForKeys: nil,
                                                            options: .skipsHiddenFiles)
            //                let files = try fileManager.contentsOfDirectory(at: documentsDirectory)
            var recordings = files.filter({ (name: URL) -> Bool in
                return name.pathExtension == "m4a"
                //                    return name.hasSuffix("m4a")
            })
            for i in 0 ..< recordings.count {
                //                    let path = documentsDirectory.appendPathComponent(recordings[i], inDirectory: true)
                //                    let path = docsDir + "/" + recordings[i]
                
                //                    print("removing \(path)")
                print("removing \(recordings[i])")
                do {
                    try fileManager.removeItem(at: recordings[i])
                } catch {
                    print("could not remove \(recordings[i])")
                    print(error.localizedDescription)
                }
            }
            
        } catch {
            print("could not get contents of directory at \(documentsDirectory)")
            print(error.localizedDescription)
        }
        
    }
    
    func askForNotifications() {
        print("\(#function)")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(DBXRecordInteractionCell.background(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(DBXRecordInteractionCell.foreground(_:)),
                                               name: NSNotification.Name.UIApplicationWillEnterForeground,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(DBXRecordInteractionCell.routeChange(_:)),
                                               name: NSNotification.Name.AVAudioSessionRouteChange,
                                               object: nil)
    }
    @objc func background(_ notification: Notification) {
        print("\(#function)")
        
    }
    
    @objc func foreground(_ notification: Notification) {
        print("\(#function)")
        
    }
    
    
    @objc func routeChange(_ notification: Notification) {
        print("\(#function)")
        
        if let userInfo = (notification as NSNotification).userInfo {
            print("routeChange \(userInfo)")
            
            //print("userInfo \(userInfo)")
            if let reason = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt {
                //print("reason \(reason)")
                switch AVAudioSessionRouteChangeReason(rawValue: reason)! {
                case AVAudioSessionRouteChangeReason.newDeviceAvailable:
                    print("NewDeviceAvailable")
                    print("did you plug in headphones?")
                    checkHeadphones()
                case AVAudioSessionRouteChangeReason.oldDeviceUnavailable:
                    print("OldDeviceUnavailable")
                    print("did you unplug headphones?")
                    checkHeadphones()
                case AVAudioSessionRouteChangeReason.categoryChange:
                    print("CategoryChange")
                case AVAudioSessionRouteChangeReason.override:
                    print("Override")
                case AVAudioSessionRouteChangeReason.wakeFromSleep:
                    print("WakeFromSleep")
                case AVAudioSessionRouteChangeReason.unknown:
                    print("Unknown")
                case AVAudioSessionRouteChangeReason.noSuitableRouteForCategory:
                    print("NoSuitableRouteForCategory")
                case AVAudioSessionRouteChangeReason.routeConfigurationChange:
                    print("RouteConfigurationChange")
                    
                }
            }
        }
    }
    func checkHeadphones() {
        print("\(#function)")
        
        // check NewDeviceAvailable and OldDeviceUnavailable for them being plugged in/unplugged
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        if !currentRoute.outputs.isEmpty {
            for description in currentRoute.outputs {
                if description.portType == AVAudioSessionPortHeadphones {
                    print("headphones are plugged in")
                    break
                } else {
                    print("headphones are unplugged")
                }
            }
        } else {
            print("checking headphones requires a connection to a device")
        }
    }
    func exportAsset(_ asset: AVAsset, fileName: String) {
        print("\(#function)")
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let trimmedSoundFileURL = documentsDirectory.appendingPathComponent(fileName)
        print("saving to \(trimmedSoundFileURL.absoluteString)")
        
        
        
        if FileManager.default.fileExists(atPath: trimmedSoundFileURL.absoluteString) {
            print("sound exists, removing \(trimmedSoundFileURL.absoluteString)")
            do {
                if try trimmedSoundFileURL.checkResourceIsReachable() {
                    print("is reachable")
                }
                
                try FileManager.default.removeItem(atPath: trimmedSoundFileURL.absoluteString)
            } catch {
                print("could not remove \(trimmedSoundFileURL)")
                print(error.localizedDescription)
            }
            
        }
        
        print("creating export session for \(asset)")
        
        if let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetAppleM4A) {
            exporter.outputFileType = AVFileType.m4a
            exporter.outputURL = trimmedSoundFileURL
            
            let duration = CMTimeGetSeconds(asset.duration)
            if duration < 5.0 {
                print("sound is not long enough")
                return
            }
            // e.g. the first 5 seconds
            let startTime = CMTimeMake(0, 1)
            let stopTime = CMTimeMake(5, 1)
            exporter.timeRange = CMTimeRangeFromTimeToTime(startTime, stopTime)
            
            //            // set up the audio mix
            //            let tracks = asset.tracksWithMediaType(AVMediaTypeAudio)
            //            if tracks.count == 0 {
            //                return
            //            }
            //            let track = tracks[0]
            //            let exportAudioMix = AVMutableAudioMix()
            //            let exportAudioMixInputParameters =
            //            AVMutableAudioMixInputParameters(track: track)
            //            exportAudioMixInputParameters.setVolume(1.0, atTime: CMTimeMake(0, 1))
            //            exportAudioMix.inputParameters = [exportAudioMixInputParameters]
            //            // exporter.audioMix = exportAudioMix
            
            // do it
            exporter.exportAsynchronously(completionHandler: {
                print("export complete \(exporter.status)")
                
                switch exporter.status {
                case  AVAssetExportSessionStatus.failed:
                    
                    if let e = exporter.error {
                        print("export failed \(e)")
                    }
                    
                case AVAssetExportSessionStatus.cancelled:
                    print("export cancelled \(String(describing: exporter.error))")
                default:
                    print("export complete")
                }
            })
        } else {
            print("cannot create AVAssetExportSession for asset \(asset)")
        }
        
    }
    
}
extension DBXRecordInteractionCell: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,
                                         successfully flag: Bool) {
        
        print("\(#function)")
        
        print("finished recording recording recording\(flag)")
       // stopButton.isEnabled = false
       // playButton.isEnabled = true
        //recordButton.setTitle("Record", for: UIControlState())
        
        // iOS8 and later
        let alert = UIAlertController(title: "Recorder",
                                      message: "Finished Recording",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Keep", style: .default) {[unowned self] _ in
            print("keep was tapped")
            self.recorder = nil
        })
        alert.addAction(UIAlertAction(title: "Delete", style: .default) {[unowned self] _ in
            print("delete was tapped")
            self.recorder.deleteRecording()
        })
        
        //self.present(alert, animated: true, completion: nil)
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder,
                                          error: Error?) {
        print("\(#function)")
        
        if let e = error {
            print("\(e.localizedDescription)")
        }
    }
    
}

// MARK: AVAudioPlayerDelegate
extension DBXRecordInteractionCell: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("\(#function)")
          recordButton.setImage(UIImage(named: "interaction_play_icon"), for: .normal)
        print("finished playing \(flag)")
        recordButton.isEnabled = true
       // stopButton.isEnabled = false
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("\(#function)")
        
        if let e = error {
            print("\(e.localizedDescription)")
        }
        
    }
}
