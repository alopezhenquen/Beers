//
//  BeersViewController.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//  
//

import UIKit

class BeersViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var beersCollection: UICollectionView!
    
    // MARK: Properties
    var presenter: ViewToBeersPresenterProtocol?
    var beerImagesRepo: BeerImagesRepo?
    var loadingView: LoadingView?
    
    fileprivate let reuseIdentifier = "BeerCell"
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    fileprivate var paddingSpace : CGFloat = 0
    fileprivate var availableWidth : CGFloat = 0
    fileprivate var widthPerItem : CGFloat = 0
    fileprivate var heightPerItem : CGFloat = 0
    
    fileprivate var beersList : [Beer] = []
    fileprivate var isLoading = false
    fileprivate var moreDataAvailable = true
    

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
    func setupViews(){
        // Setup View
        self.title = NSLocalizedString("BeersTitle", comment: "")
        
        // Setup CollectionView
        beersCollection.dataSource = self
        beersCollection.delegate = self
        paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        availableWidth = beersCollection.frame.width - paddingSpace
        widthPerItem = availableWidth / itemsPerRow
        heightPerItem = widthPerItem * 1.2
        
        // Setup SearchBar as Navigation Item
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.init(named: "searchBar.tintColor")
        searchController.searchBar.placeholder = NSLocalizedString("SearchByFoodBarTitle", comment: "")
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Register BeerCellView
        let beerCellViewNib = UINib.init(nibName: "BeerCell", bundle: nil)
        beersCollection.register(beerCellViewNib,
                                 forCellWithReuseIdentifier: "BeerCell")
        
        // Register LoadingView
        let loadingViewNib = UINib.init(nibName: "LoadingView", bundle: nil)
        beersCollection.register(
            loadingViewNib,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "LoadingView")
    }
    
    func checkEndOfPage(at cellIndex: Int) {
        if (cellIndex == (beersList.count - 1) && !isLoading) {
            // Ask Presenter for Next Page of Beers
            isLoading = true
            presenter?.fetchMoreBeers()
        }
    }

    init() {
        super.init(nibName: "BeersView", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}



extension BeersViewController: PresenterToBeersViewProtocol {
    
    //MARK: Methods
    func onFetchCompleted(with beers: [Beer]) {
        beersList += beers
        isLoading = false
        moreDataAvailable = true
        beersCollection.reloadData()
    }
    
    func onNewFetchCompleted(with beers: [Beer]) {
        beersList = beers
        isLoading = false
        moreDataAvailable = true
        beersCollection.reloadData()
    }
    
    func showNoData() {
        isLoading = false
        moreDataAvailable = false
        beersList.removeAll()
        beersCollection.reloadData()
        loadingView?.showMessage(message: NSLocalizedString("NoDataAvailable", comment: ""))
    }
    
    func showError(error: Error?) {
        self.showErrorAlert(with: error)
    }
    
    func noMoreDataAvailable() {
        isLoading = false
        moreDataAvailable = false
        loadingView?.showMessage(message: NSLocalizedString("NoMoreDataAvailable", comment: ""))
    }
}



extension BeersViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.updateSearchField(with: searchController.searchBar.text ?? "")
    }
}



extension BeersViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beersList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BeerCell else {fatalError()}
        cell.configure(with: beersList[indexPath.row], using: beerImagesRepo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? BeerCell else { return }
        
        // Setup Cell Views
        cell.setupViews()
        
        // Ask for More Beers if this is last.
        checkEndOfPage(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? BeerCell else { return }
        cell.cancelImageDownload()
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        presenter?.didSelectedBeer(beer: beersList[indexPath.row])
        return true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < beersCollection.adjustedContentInset.top {
            navigationItem.rightBarButtonItem = nil
        } else if navigationItem.rightBarButtonItem == nil {
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                target: self,
                                                action: #selector(switchSearch))
            navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    @objc func switchSearch() {
        navigationItem.searchController?.isActive.toggle()
    }
    
    //MARK: Infinite Scrolling
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if isLoading {
            return CGSize.zero
        } else {
            return CGSize.init(width: beersCollection.bounds.size.width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            guard let footerView = beersCollection.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "LoadingView",
                    for: indexPath) as? LoadingView else {
                fatalError()
            }
            loadingView = footerView
            loadingView?.backgroundColor = .clear
            return footerView
        }
        return UICollectionReusableView.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter && moreDataAvailable {
            loadingView?.startIndicator()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            loadingView?.stopIndicator()
        }
    }
}



//MARK: Prefetching

extension BeersViewController : UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        beerImagesRepo?.startPrefetchImages(urls: beersList.map{ $0.imageUrl})
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        beerImagesRepo?.cancelPrefetchImages(urls: beersList.map{ $0.imageUrl})
    }
}



//MARK: Collection Layout

extension BeersViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.widthPerItem, height: self.heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
