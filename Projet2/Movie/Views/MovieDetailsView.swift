//
//  MovieDetailsView.swift
//  Projet2
//
//  Created by Baptiste Taviot on 29/03/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    let image : String
    let imageCard : String
    let title : String
    let subtitle : String
    let date: String
    let note : Float
    let description : String
    let bandeannonce : String
    let categorie : [Int]
    let movieViewModel: MovieViewModel
    let genreViewModel: GenreViewModel
    


    @State private var offset = 0.0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { gp in
            ScrollView(.vertical) {
                ZStack(content: {
                    HStack(content: {
                        ImageView(withURL: image)
                    })
                    .zIndex(1)
                    .frame(width: 100, height: 140)
                    .position(x: gp.size.width*0.85, y: 270)
                    VStack(content: {
                        HStack( content: {
                            ImageView(withURL: imageCard)
                                .frame(width: .zero , height: 270)
                        })
                        Text(title)
                            .bold()
                            .font(.system(size: 26))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        Text(subtitle)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.bottom, 1)
                        
                        HStack(content: {
                            Group{
                                Text(date)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                                Text("Note : " + String(note))
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        })
                        
                        .padding(.leading, 20.0)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .center, spacing: 10, content: {
                                ForEach(categorie, id: \.self) { cat in
                                    let g = genreViewModel.genres.first(where: {$0.id == cat})
                                    Text(g?.name ?? "")
                                        .font(.system(size: 13))
                                        .padding([.horizontal,.vertical],10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(.black, lineWidth: 2)
                                        )
                                }
                                .padding(.vertical,5)
                                .padding(.horizontal, 5)
                            })
                        }
                        .padding(.horizontal, 20)
                        
                        
                        
                        ScrollView(.vertical){
                            Text(description)
                                .font(.system(size: 14))
                                .padding(.horizontal, 20.0)
                                .padding(.top, 10.0)
                        }
                        
                        HStack(content:{
                            Text("Bande annonce")
                                .foregroundColor(.black)
                                .bold()
                                .padding(.horizontal, 100)
                                .padding(.vertical, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.black, lineWidth: 4)
                                )
                        })
                    })
                    .frame(minHeight: gp.size.height)
                })
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxHeight: .infinity)
            
        }
    }
}


/*struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(image: "string", imageCard: "String", title: "string", subtitle: "string", date: "string", note: "float", description: "string", bandeannonce: "string", categorie: ["int","int"])
    }
}*/
