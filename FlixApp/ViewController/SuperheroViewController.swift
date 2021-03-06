//
//  SuperheroViewController.swift
//  FlixApp
//
//  Created by Hiren Patel on 2/7/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine: CGFloat = 4
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        
        fetchMovies()
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        cell.posterImageView.af_setImage(withURL: movie.posterUrl!)
        
        
//        if let posterPathString = movie["poster_path"]as? String {
//            let baseURLString = "https://image.tmdb.org/t/p/w500"
//            let posterURL = URL(string: baseURLString + posterPathString)!
//            cell.posterImageView.af_setImage(withURL: posterURL)
//        }
        return cell
    }
    
    
    
    
    
    func fetchMovies() {
        
        MovieAPIManager().superHeroMovies { (movies, error) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
            }
        }
        //self.activityIndicator.startAnimating()
//
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            //this will run when the network request returns
//            if let error = error {
//                print (error.localizedDescription)
//            }else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let movies = dataDictionary["results"] as! [[String: Any]]
//                self.movies = movies
//                self.collectionView.reloadData()
//                //self.refreshControl.endRefreshing()
//                //self.activityIndicator.stopAnimating()
//            }
//        }
//        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController;
        let movieItem = sender as! UICollectionViewCell;
        
        if let indexPath = collectionView.indexPath(for: movieItem){
            let movie = movies[indexPath.item]
            destinationVC.movie = movie;
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
