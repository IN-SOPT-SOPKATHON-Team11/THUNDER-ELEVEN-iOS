//
//  UIImageView+.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 양정연 on 2022/11/18.
//

import UIKit.UIImageView

import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: urlString, options: nil) { result in // 캐시에서 키를 통해 이미지를 가져온다.
            switch result {
            case .success(let value):
                if let image = value.image { // 만약 캐시에 이미지가 존재한다면
                    self.image = image // 바로 이미지를 셋한다.
                } else {
                    guard let url = URL(string: urlString) else { return }
                    let resource = ImageResource(downloadURL: url, cacheKey: urlString) // URL로부터 이미지를 다운받고 String 타입의 URL을 캐시키로 지정하고
                    self.kf.setImage(with: resource) // 이미지를 셋한다.
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    /// Kingfisher 이미지 처리
    /// - Parameters:
    /// - url: 이미지 URL
    /// - defaultImage: 디폴트 이미지!!
    func image(url: String?, defaultImage: UIImage? = UIImage()) {
        kf.indicatorType = .activity
        guard let url = URL(string: url ?? "") else {
            image = defaultImage
            return
        }
        kf.setImage(
            with: url,
            placeholder: .none,
            options: [
                .transition(ImageTransition.fade(0.5)),
                .backgroundDecode,
                .alsoPrefetchToMemory,
                .cacheMemoryOnly
            ]
        )
    }

    func cancelDownloadTask() {
        kf.cancelDownloadTask()
    }
}
