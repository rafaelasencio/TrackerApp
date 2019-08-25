//
//  UIImageView+DownloadImage.swift
//  TrackerApp
//
//  Created by Rafael on 23/08/2019.
//  Copyright © 2019 RafaelAB. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url,
                                                completionHandler: { [weak self] url, response, error in
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let weakSelf = self { //self refers to the UIImageView
                        weakSelf.image = image
                    }
                }
            }
        })
        downloadTask.resume()
        return downloadTask
    }
}
