//
//  CircleImage.swift
//  Landmarks
//
//  Created by Third User on 11/30/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("pexels-mikhail-nilov-7454872 copy")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
