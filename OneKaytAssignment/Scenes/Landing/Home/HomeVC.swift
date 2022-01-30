//
//  HomeVC.swift
//  OneKaytAssignment
//
//  Created by MgKaung on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

protocol HomeDisplayLogic: AnyObject {
  func displayBanner(viewModel: Home.Banner.ViewModel)
  func displayAdvertisement(viewModel: Home.Advertisement.ViewModel)
  func displayError(errorString: String)
}

class HomeVC: UIViewController, HomeDisplayLogic {
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic)?
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle
  private let searchController = UISearchController(searchResultsController: nil)
  var slides: [UIView] = []
  var banners: [String] = []
  var advList: [AdvertisementList] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    doGetBanner()
    doGetAdvertisement()
    setupView()
    setupAdvSlide()
  }
  
  // MARK: Do something
  
  @IBOutlet weak var advScrollView: UIScrollView!
  @IBOutlet weak var advPageControl: UIPageControl!
  @IBOutlet weak var advCollectionCell: UICollectionView!
  
  @objc func addTapped() {
    confirmAlert(message: "Are you sure to log out?", okHandler: { [weak self] in
      Defaults[\.isLogin] = false
      self?.router?.routeToLogin(nav: self?.navigationController)
    })
  }
  
  func setupView() {
    setupSearchBar()
    setupLogOut()
    setupCollectionView()
  }
  
  func setupSearchBar() {
    navigationController?.setDefaultStyle()
    navigationController?.isNavigationBarHidden = false
    searchController.searchBar.tintColor = .black
    searchController.searchBar.barTintColor = AppTheme.Colors.main
    navigationController?.navigationBar.topItem?.titleView = searchController.searchBar
    searchController.hidesNavigationBarDuringPresentation = false
    if #available(iOS 13.0, *) {
      searchController.searchBar.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Search at One Kyat ", attributes: [NSAttributedString.Key.foregroundColor: AppTheme.Colors.main])
      searchController.searchBar.searchTextField.backgroundColor = . white
      searchController.searchBar.searchTextField.leftView?.tintColor = AppTheme.Colors.main
    } else {
      // Fallback on earlier versions
    }
  }
  
  func setupLogOut() {
    let logOut = UIBarButtonItem(image: UIImage(named: "logout"), style: .plain, target: self, action:  #selector(addTapped))
    
    navigationController?.navigationBar.topItem?.rightBarButtonItem = logOut
  }
  
  func setupCollectionView() {
    advCollectionCell.delegate = self
    advCollectionCell.dataSource = self
    advCollectionCell.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    advCollectionCell.register(UINib.init(nibName: AdvertisementCell.className, bundle: nil), forCellWithReuseIdentifier: AdvertisementCell.className)
  }
  func doGetBanner() {
    let request = Home.Banner.Request()
    interactor?.doGetBanner(request: request)
  }
  
  func doGetAdvertisement() {
    let request = Home.Advertisement.Request()
    interactor?.doGetAdvertisement(request: request)
  }
  
  func displayBanner(viewModel: Home.Banner.ViewModel) {
    banners = viewModel.banners
    setupAdvSlide()
  }
  
  func displayAdvertisement(viewModel: Home.Advertisement.ViewModel) {
    advList = viewModel.advertisement ?? []
    
  }
  
  func displayError(errorString: String) {
    showAlert(message: errorString)
  }
}
extension HomeVC {
  func setupAdvSlide() {
    slides = createSlides()
    setupSlideScrollView(slides: slides)
    
    advPageControl.numberOfPages = slides.count
    advPageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0.3137254902, blue: 0.337254902, alpha: 1)
    advPageControl.pageIndicatorTintColor =  #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
    advPageControl.currentPage = 0
    advScrollView.delegate = self
    advScrollView.contentSize.height = 1.0
    advScrollView.showsHorizontalScrollIndicator = false
  }
  
  func createSlides() -> [UIView] {
    var bannerView: [UIView] = []
    for imgBanner in banners {
      let uiView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 120))
      let slide1: UIImageView = UIImageView(frame: uiView.frame)
      slide1.image = UIImage(named: imgBanner)
      uiView.addSubview(slide1)
      bannerView.append(uiView)
    }
    return bannerView
  }
  
  func setupSlideScrollView(slides : [UIView]) {
    advScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    advScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
    advScrollView.isPagingEnabled = true
    
    for i in 0 ..< slides.count {
      slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
      advScrollView.addSubview(slides[i])
    }
  }
}

extension HomeVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageIndex = Int(round(scrollView.contentOffset.x/view.frame.width))
    advPageControl.currentPage = pageIndex
  }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return advList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.width / 2) - 20, height: collectionView.frame.width/2 + 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  AdvertisementCell.className, for: indexPath)
    (cell  as? AdvertisementCell)?.configure(data: advList[indexPath.row].product)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    router?.routeToAdvDetail(nav: navigationController)
  }
}
