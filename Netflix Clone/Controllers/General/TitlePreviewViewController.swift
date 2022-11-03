//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Amr Hossam on 07/01/2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton! {
        didSet {
            downloadButton.layer.cornerRadius = 8
            downloadButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var webView: WKWebView!

    var viewModel: TitlePreviewViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        configure(with: viewModel)
    }
    

    public func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        titleLabel.sizeToFit()
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }

}
