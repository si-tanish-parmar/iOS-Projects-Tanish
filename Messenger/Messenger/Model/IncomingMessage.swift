//
//  IncomingMessage.swift
//  Messenger
//
//  Created by Tanish Parmar on 16/10/23.
//

import Foundation
import MessageKit
import CoreLocation

class IncomingMessage{
    var messageCollectionView: MessagesViewController
    init(_collectionView: MessagesViewController){
        messageCollectionView = _collectionView
    }
    //MARK: Create Message
    func createMessage(localMessage: LocalMessage) -> MKMessage?{
        let mkMessage = MKMessage(message: localMessage)
        if localMessage.type == kPHOTO{
            let photoItem = PhotoMessage(path: localMessage.pictureUrl)
            mkMessage.photoItem = photoItem
            mkMessage.kind = MessageKind.photo(photoItem)
            FileStorage.downloadImage(imageUrl: localMessage.pictureUrl) { (image) in
                mkMessage.photoItem?.image = image
                self.messageCollectionView.messagesCollectionView.reloadData()
            }
        }
        if localMessage.type == kVIDEO{
            FileStorage.downloadImage(imageUrl: localMessage.pictureUrl) { (thumbNail) in
                FileStorage.downloadVideo(videoLink: localMessage.videoUrl) { (readyToPlay, fileName) in
                    let videoUrl = URL(fileURLWithPath: fileInDocumentsDirectory(fileName: fileName))
                    let videoItem = VideoMessage(url: videoUrl)
                    mkMessage.videoItem = videoItem
                    mkMessage.kind = MessageKind.video(videoItem)
                }
                mkMessage.videoItem?.image = thumbNail
                self.messageCollectionView.messagesCollectionView.reloadData()
            }
        }
        
        if localMessage.type == kLOCATION{
            let locationItem = LocationMessage(location: CLLocation(latitude: localMessage.latitude, longitude: localMessage.longitude))
            mkMessage.kind = MessageKind.location(locationItem)
            mkMessage.locationItem = locationItem
        }
        
        if localMessage.type == kAUDIO{
            let audioMessage = AudioMessage(duration: Float(localMessage.audioDuration))
            mkMessage.audioItem = audioMessage
            mkMessage.kind = MessageKind.audio(audioMessage)
            FileStorage.downloadAudio(audioLink: localMessage.audioUrl) { (fileName) in
                let audioURl = URL(fileURLWithPath: fileInDocumentsDirectory(fileName: fileName))
                mkMessage.audioItem?.url = audioURl
            }
            self.messageCollectionView.messagesCollectionView.reloadData()
        }
        return mkMessage
    }
}
