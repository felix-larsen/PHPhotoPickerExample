//
//  ContentView.swift
//  PHPhotoPicker
//
//  Created by Felix Houghton-Larsen on 17.10.20.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var showSheet = false
    @State var selectedImage: UIImage?
    @State var date: Date?
    @State var location: CLLocationCoordinate2D?
    
    var body: some View {
        VStack {
            Button("Select Image!") {
                showSheet.toggle()
            }
            .padding()
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            if let date = date {
                Text("Creation date: \(date)")
            }
            if let location = location {
                Text("Location: latitude \(location.latitude) longitude \(location.longitude)")
            }
        }.sheet(isPresented: $showSheet) {
            CustomPhotoPickerView(selectedImage: $selectedImage, date: $date, location: $location)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
