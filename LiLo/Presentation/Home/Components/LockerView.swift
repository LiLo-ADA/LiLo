//
//  LockerView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct LockerView: View {
    let locker: LockerResponse
    let isSelected: Bool
    let onClick: () -> Void
    
    private var numberText: String {
        if locker.number < 10 {
            "0\(locker.number)"
        } else {
            "\(locker.number)"
        }
    }
    
    private var textColor: Color {
        if isSelected {
            Color.white
        } else {
            if locker.status == 1 {
                Color.darkTosca
            } else {
                Color.darkVermillion
            }
        }
    }
    
    private var strokeColor: Color {
        if locker.status == 1 {
            Color.darkTosca
        } else {
            Color.darkVermillion
        }
    }
    
    private var bgColor: Color {
        if isSelected {
            if locker.status == 1 {
                Color.darkTosca
            } else {
                Color.darkVermillion
            }
        } else {
            Color.white
        }
    }
    
    var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                Text(numberText)
                    .font(.Headline)
            }
            .frame(
                width: 56,
                height: 56
            )
            .background(bgColor)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(strokeColor, lineWidth: 2)
            }
        }
    }
}

#Preview {
    LockerView(
        locker: Dummy.locker,
        isSelected: true,
        onClick: {  }
    )
}
