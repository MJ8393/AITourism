//
//  RegionsViewController.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

class RegionsViewController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureBackgroundColor(whiteColor)
        configureNavBar("Regions", true, mainColor, whiteColor)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CreateFlowLayout.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
}


extension RegionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async {
            cell.setAnimalImage(region: regions[indexPath.row])
        }
        return cell
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        collectionView.visibleCells.forEach { transform(cell: $0) }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = AnimalInfoViewController()
//        vc.index = indexPath.row
//        navigationController?.pushViewController(vc, animated: true)
//    }
}

let regions: [Region] = [
    Region(name: "Fergana", image: UIImage(named: "question1")!, info: "Fergana Region is one of the regions of Uzbekistan, located in the southern part of the Fergana Valley in the far east of the country. It borders the Namangan and Andijan Regions of Uzbekistan, as well as Kyrgyzstan and Tajikistan. Its capital is the city Fergana. It covers an area of 6,760 km2."),
    Region(name: "Samarkand", image: UIImage(named: "Samarkand")!, info: "Samarqand Region is the most populous region of Uzbekistan. It is located in the center of the country in the basin of Zarafshan River. It borders with Tajikistan, Navoiy Region, Jizzakh Region and Qashqadaryo Region. It covers an area of 16,773 km²."),
    Region(name: "Andijan", image: UIImage(named: "Andijan")!, info: "Andijan Region is a region of Uzbekistan, located in the eastern part of the Fergana Valley in far eastern Uzbekistan. It borders with Kyrgyzstan, Fergana Region and Namangan Region. It covers an area of 4,300 km2."),
    Region(name: "Bukhara", image: UIImage(named: "Bukhara")!, info: "Bukhara Region is a region of Uzbekistan located in the southwest of the country. The Kyzyl Kum desert takes up a large portion of its territory. It borders Turkmenistan, Navoiy Region, Qashqadaryo Region, a small part of the Xorazm Region, and the Karakalpakstan Republic. It covers an area of 40,216 km2."),
    Region(name: "Jizzakh", image: UIImage(named: "Jizzakh")!, info: "Jizzakh Region is one of the regions of Uzbekistan. It is located in the center/east of the country. It borders with Tajikistan to the south and south-east, Samarqand Region to the west, Navoiy Region to the north-west, Kazakhstan to the north, and Sirdaryo Region to the east. It covers an area of 21,210 km2."),
    Region(name: "Khorazm", image: UIImage(named: "Khorazm")!, info: "Khorazm Region, is a viloyat (region) of Uzbekistan located in the northwest of the country in the lower reaches of the Amu Darya River. It borders with Turkmenistan, Karakalpakstan, and Bukhara Region. It covers an area of 6,050 square kilometres (2,340 sq mi)."),
    Region(name: "Namangan", image: UIImage(named: "Namangan")!, info: "Namangan Region is one of the regions of Uzbekistan, located in the southern part of the Fergana Valley in far eastern part of the country. It is on the right bank of Syr Darya River and borders with Kyrgyzstan, Tajikistan, Tashkent Region, Fergana Region, and Andijan Region. It covers an area of 7,440km2."),
    Region(name: "Navoiy", image: UIImage(named: "Navoiy")!, info: "Navoiy Region is one of the regions of Uzbekistan. It is located in the central north/northwest of the country. It covers an area of 111,095 km2 (42,894 sq mi), which makes it the largest of the regions of Uzbekistan. The Navoiy region borders with Kazakhstan, Samarqand Region."),
    Region(name: "Kashkadarya", image: UIImage(named: "Kashkadarya")!, info: "Qashqadaryo Region is one of the regions of Uzbekistan, located in the south-eastern part of the country in the basin of the river Qashqadaryo and on the western slopes of the Pamir-Alay mountains. It borders with Tajikistan, Turkmenistan, Samarqand Region, Bukhara Region and Surxondaryo Region."),
    Region(name: "Sirdarya", image: UIImage(named: "Sirdarya")!, info: "Sirdaryo Region is one of the regions of Uzbekistan, located in the center of the country on the left bank of Syr Darya River. It borders with Kazakhstan, Tajikistan, Tashkent Region, and Jizzakh Region. It covers an area of 4,276 square kilometres (1,651 sq mi), and is mostly desert, with the Starving Steppe."),
    Region(name: "Karakalpakstan", image: UIImage(named: "Sirdarya")!, info: "Karakalpakstan, officially the Republic of Karakalpakstan, is an autonomous republic of Uzbekistan. It occupies the whole northwestern part of Uzbekistan. The capital is Nukus. The Republic of Karakalpakstan has an area of 166,590 km2 (64,320 sq mi), and a population of about two million."),
    
]

struct Region {
    let name: String
    let image: UIImage
    let info: String
}

