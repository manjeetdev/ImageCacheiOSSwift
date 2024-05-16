//
//  LazyImageView.swift
//  ImageCache
//
//  Created by Manjeet Singh on 14/05/24.
//

import Foundation
import UIKit

class LazyImageView: UIImageView
{
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromThumbnail imageThumbnail: Thumbnail, placeHolderImage: String)
    {
        self.image = UIImage(named: placeHolderImage)
        guard let domain = imageThumbnail.domain, let basePath = imageThumbnail.basePath, let key = imageThumbnail.key else{
             return
        }
        
        let imagePath = domain + "/" + basePath + "/0/" + key
        guard let imageURL = URL(string: imagePath) else{return}
        
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            self.image = cachedImage
            return
        }else if let localPath = findFileInLocal(fromURL: imageURL) {
            debugPrint("image downloaded LocalDatabase")
            let savedImage = UIImage(contentsOfFile: localPath)
            self.image = savedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            
            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image downloaded from server...")
                DispatchQueue.main.async {
                if let image = UIImage(data: imageData)
                {
                    self?.imageCache.setObject(image, forKey: imageURL as AnyObject)
                    
                    if let documentsDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
                        let filePath = basePath + "/10" + key
                        let fileName = filePath.replacingOccurrences(of: "/", with: "_")
                        let fileURL = documentsDirectory.appendingPathComponent(fileName)
                        do {
                            print("Save path url = \(fileURL)")
                            try imageData.write(to: fileURL)
                        } catch {
                            print("Error writing image to disk: \(error)")
                        }
                    }
                   
                        self?.image = image
                    }
                }
            }
        }
        
        func findFileInLocal(fromURL imageURL : URL) -> String? {
            if let documentsDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
                let filePath = basePath + "/10" + key
                let fileName = filePath.replacingOccurrences(of: "/", with: "_")
                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                if  FileManager.default.fileExists(atPath: fileURL.path) {
                    return fileURL.path
                }else {
                    return nil
                }
            }else{
                return nil
            }
        }
        
    }
}

