

import UIKit
import Kingfisher

class BeersImagesFetcher: BeerImagesRepo {
    
    func fetchImage(from url: URL?, to imageView: UIImageView) {
        guard let url = url else {
            imageView.image = UIImage(named: "image-not-available")
            return
        }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url,
                              placeholder: nil,
                              options: [
                                .transition(.fade(1))
                              ],
                              completionHandler: nil)
    }
    
    func cancelFetchImage(to imageView: UIImageView) {
        imageView.kf.cancelDownloadTask()
    }
    
    func startPrefetchImages(urls: [URL?]) {
        var validUrls : [URL] = []
        for url in urls {
            guard let url = url else { return }
            validUrls.append(url)
        }
        ImagePrefetcher(urls: validUrls).start()
    }
    
    func cancelPrefetchImages(urls: [URL?]) {
        var validUrls : [URL] = []
        for url in urls {
            guard let url = url else { return }
            validUrls.append(url)
        }
        ImagePrefetcher(urls: validUrls).stop()
    }
}
