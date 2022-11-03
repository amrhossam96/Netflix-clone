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

//    private let downloadButton: UIButton = {
//
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .red
//        button.setTitle("Download", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 8
//        button.layer.masksToBounds = true
//
//        return button
//    }()
    
//    private let webView: WKWebView = {
//        let webView = WKWebView()
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        return webView
//    }()

    var viewModel: TitlePreviewViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        //　ナビゲーションバーの背景色
//        configureConstraints()
        guard let viewModel = viewModel else { return }
        configure(with: viewModel)
    }
    

    
    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        
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
