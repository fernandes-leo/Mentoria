//
//  ImageViewController.swift
//  Dogs
//
//  Created by Yago De Moura Silva on 09/09/24.
//

import UIKit

class ImageViewController: UIViewController, UICollectionViewDataSource {
    
    private let viewModel = ImageViewModel()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.backgroundColor = .red
                title = "Imagens de Cachorros"
        
        // Vinculando o callback do ViewModel para atualizar a CollectionView
        viewModel.onUpdate = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        // Iniciar a requisição
        viewModel.fetchImages()
    }
    
    // Configuração da CollectionView
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        view.addSubview(collectionView)
    }
    
    // UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        let imageUrl = viewModel.images[indexPath.row]
        cell.configure(with: imageUrl)
        return cell
    }
}
