// FPButton.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import SwiftUI

struct FPButton: View {
    var label: String
    var width: CGFloat? = nil
    var body: some View {
        Button {
            print(label)
        } label: {
            Text(label)
                .foregroundColor(.white)
                .font(.caption)
        }.frame(maxWidth: .infinity)
            .background(Color.gray)
            .cornerRadius(5.0)

    }
}

struct FPButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FPButton(label: "Release")
            FPButton(label: "Release")
            FPButton(label: "Release")
        }
    }
}
