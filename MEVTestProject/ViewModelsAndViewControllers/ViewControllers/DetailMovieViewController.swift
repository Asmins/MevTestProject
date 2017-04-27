//
//  DetailMovieViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateReleaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var infoAboutLabel: UILabel!

    var movie: Movie?

    var viewModel = DetailMovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.showOrHiddenPlaceholder(movie: movie
            , firstAction: {
                self.showPlaceholder()
        }, secondAction: {
            self.showFeed()
        })

        self.tabBarController?.setCustomTitle(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.movie = nil
    }

    func settingView(_ movie: Movie) {
        self.posterImageView.sd_setImage(with: URL(string: movie.getPosterURl()))
        self.actorsLabel.text = movie.getActors()
        self.dateReleaseLabel.text = movie.getDateMovie()
        self.genreLabel.text = movie.getGenre()
        self.infoAboutLabel.text = movie.getInfo()
        self.titleLabel.text = movie.getNameMovie()
    }
}

extension DetailMovieViewController {
    func showPlaceholder() {
        self.placeholderView.isHidden = false
        self.feedView.isHidden = true
    }

    func showFeed() {
        self.placeholderView.isHidden = true
        self.settingView(movie!)
        self.feedView.isHidden = false
    }
}
