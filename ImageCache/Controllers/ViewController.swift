//
//  ViewController.swift
//  ImageCache
//
//  Created by Manjeet Singh on 09/05/24.
//

import UIKit

class ViewController: UIViewController {

    var images: [ImageDataResponse]? = nil
    var imagesResource: ImagesResource = ImagesResource()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubViews()
        imagesResource.getImages { (_imagesResponse, _error) in
            if _error == nil
            {
                self.images = _imagesResponse!
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: _error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func addSubViews(){
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.minimumInteritemSpacing = 5
                layout.minimumLineSpacing = 5

                // Initialize collection view
                collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                collectionView.backgroundColor = .white
                collectionView.dataSource = self
                collectionView.delegate = self
                collectionView.register(ImageGrideCVCell.self, forCellWithReuseIdentifier: "ImageGrideCVCell")

                view.addSubview(collectionView)

                // Constraints for collection view
                NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
                ])
    }
    
    
}


extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images?.count ?? 0
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageGrideCVCell", for: indexPath) as! ImageGrideCVCell

            // Load image dynamically
            let imageData = images?[indexPath.item]
//            let thumbnailData = imageData?.thumbnail
            
//            guard let domain = thumbnailData?.domain, let basePath = thumbnailData?.basePath, let key = thumbnailData?.key else{
//                 return ImageGrideCVCell()
//            }
//            
//            let imagePath = domain + "/" + basePath + "/10/" + key
//            debugPrint("imagePath = \(imagePath)")
//            guard let imageURL = URL(string: imagePath) else{ return ImageGrideCVCell() }
            
            guard let thumbnailData = imageData?.thumbnail else {
                return ImageGrideCVCell()
            }
            cell.imageView.loadImage(fromThumbnail: thumbnailData, placeHolderImage: "") //(fromURL: imageURL, placeHolderImage: "")
            cell.imageView.backgroundColor = .gray
            return cell
        }

        // MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let paddingSpace = CGFloat(5)
            let availableWidth = collectionView.frame.width - paddingSpace * 4 // Adjust according to your spacing preference
            let widthPerItem = availableWidth / 3
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
    
}

