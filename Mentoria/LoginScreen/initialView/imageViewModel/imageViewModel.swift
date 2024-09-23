//
//  ImageViewModel.swift
//  Dogs
//
//  Created by Yago De Moura Silva on 09/09/24.
//

import Foundation


struct DogImageModel: Decodable {
    let message: [String]
}



class ImageViewModel {
    
    var images: [String] = [] // URLs das imagens
    
    // Callback para atualizar a View
    var onUpdate: (() -> Void)?
    
    // Função que faz a requisição de API
    func fetchImages() {
        let urlString = "https://dog.ceo/api/breeds/image/random/50"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(DogImageModel.self, from: data)
                    DispatchQueue.main.async {
                        self?.images = result.message
                        self?.onUpdate?() // Chama a função para atualizar a View
                    }
                } catch {
                    print("Erro ao decodificar: \(error)")
                }
            } else if let error = error {
                print("Erro na requisição: \(error)")
            }
        }.resume()
    }
}

