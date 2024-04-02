//
//  AreaView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct AreaView: View {
    let area: Area
    let avaibility: Int
    let isSelected: Bool
    let onClick: () -> Void
    let proxy: GeometryProxy
    
    private var width: CGFloat {
        max(((proxy.size.width - (16 * 2) - ((16 * 2) + (12 * 3) / 4)) / 4), 0)
    }
    
    private var areaTextColor: Color {
        if isSelected {
            Color.white
        } else {
            Color.black
        }
    }
    
    private var textColor: Color {
        if isSelected {
            Color.white
        } else {
            if avaibility <= 0 {
                Color.darkVermillion
            } else {
                Color.darkTosca
            }
        }
    }
    
    private var selectedColor: Color {
        if isSelected {
            Color.darkTosca
        } else {
            Color.clear
        }
    }
    
    private var borderColor: Color {
        if isSelected {
            Color.darkTosca
        } else {
            Color.grey
        }
    }
    
    var body: some View {
        Button {
            onClick()
        } label: {
            VStack(spacing: 0) {
                Text(area.rawValue)
                    .font(.Title1)
                    .foregroundColor(areaTextColor)
                
                Spacer()
                    .frame(height: 4)
                
                Text("\(avaibility)")
                    .font(.Headline)
                
                Text("Available")
                    .font(.Body2)
            }
            .padding(12)
            .frame(width: width)
            .foregroundColor(textColor)
            .background(selectedColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2)
            }
        }
    }
}

#Preview {
    GeometryReader { proxy in
        AreaView(
            area: .AreaA,
            avaibility: 0,
            isSelected: true,
            onClick: {  },
            proxy: proxy
        )
    }
}
