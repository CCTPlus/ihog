// ObjectView.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import DataStore
import SwiftUI

struct ObjectView: View {
    var width: CGFloat
    var object: ShowObject
    
    var body: some View {
        Button {
            print("Button")
        } label: {
            VStack(alignment: .center) {
                HStack {
                    Text(object.rawName)
                    Spacer()
                    Button {
                        print("menu")
                    } label: {
                        Image(systemSymbol: .ellipsisCircle)
                    }
                    .foregroundColor(
                        .white.opacity(0.7)
                    )
                }
                Spacer()
                Text(object.name)
                    .font(.title)
                    .bold()
                    .padding(.top)
            }
            .foregroundColor(.primary)
            .frame(width: width, height: width)
            .padding(.all, 20.0)
            .background(object.color)
            .cornerRadius(width * 0.15)
        }
        
    }
}

//struct ObjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeometryReader { geo in
//            ObjectView(width: geo.size.width*0.35, object: ShowObject.mockScene)
//        }
//    }
//}
