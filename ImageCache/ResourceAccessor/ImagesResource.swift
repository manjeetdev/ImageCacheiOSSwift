//
//  ImagesResource.swift
//  ImageCache
//
//  Created by Manjeet Singh on 14/05/24.
//

import Foundation

struct ImagesResource
{
    func getImages(completionHandler: @escaping ([ImageDataResponse]?, Error?) -> ()) {

        let animalApiUrl = URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100")!

        URLSession.shared.dataTask(with: animalApiUrl) { (data, response, error) in

            if(error == nil && data != nil)
            {
                do {
                    let result = try JSONDecoder().decode([ImageDataResponse].self, from: data!)
                    completionHandler(result, nil)
                } catch let error {
                    debugPrint(error)
                    completionHandler(nil, error)
                }
            }

        }.resume()


    }
}
