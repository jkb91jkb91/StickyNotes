//
//  UICollection + DataSource.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Module

import UIKit

//MARK:-extensions

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
        cell.textView.text = viewModel.noteElement(row: indexPath.row)
        cell.imageV.image = UIImage(named: viewModel.colorElement(row: indexPath.row))
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        viewModel.editSelected = true
        viewModel.selectedRow = row
        viewModel.selectedColor = viewModel.notes[row].color
        performSegue(withIdentifier: "popSegue", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewModel.size == Sizes.largeSize {
            return Sizes.smallSize
        } else {
            return Sizes.largeSize
        }
    }
}


