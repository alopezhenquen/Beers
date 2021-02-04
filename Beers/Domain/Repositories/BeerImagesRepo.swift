
import UIKit
import Foundation

protocol BeerImagesRepo {
    func fetchImage(from url: URL?, to imageView: UIImageView)
    func cancelFetchImage(to imageView: UIImageView)
    func startPrefetchImages(urls: [URL?])
    func cancelPrefetchImages(urls: [URL?])
}
