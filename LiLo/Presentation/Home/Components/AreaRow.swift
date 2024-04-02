//
//  AreaRow.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct AreaRow: View {
    let selectedArea: Area
    let areaA: HomeState.LockerState
    let areaB: HomeState.LockerState
    let areaC: HomeState.LockerState
    let areaD: HomeState.LockerState
    let onClick: (Area) -> Void
    let proxy: GeometryProxy
    
    var body: some View {
        HStack(spacing: 12) {
            AreaView(
                area: .AreaA,
                avaibility: areaA.availability,
                isSelected: selectedArea == .AreaA,
                onClick: {
                    onClick(.AreaA)
                },
                proxy: proxy
            )
            
            AreaView(
                area: .AreaB,
                avaibility: areaB.availability,
                isSelected: selectedArea == .AreaB,
                onClick: {
                    onClick(.AreaB)
                },
                proxy: proxy
            )
            
            AreaView(
                area: .AreaC,
                avaibility: areaC.availability,
                isSelected: selectedArea == .AreaC,
                onClick: {
                    onClick(.AreaC)
                },
                proxy: proxy
            )
            
            AreaView(
                area: .AreaD,
                avaibility: areaD.availability,
                isSelected: selectedArea == .AreaD,
                onClick: {
                    onClick(.AreaD)
                },
                proxy: proxy
            )
        }
    }
}

#Preview {
    GeometryReader { proxy in
        AreaRow(
            selectedArea: .AreaA,
            areaA: .init(),
            areaB: .init(),
            areaC: .init(),
            areaD: .init(),
            onClick: { _ in },
            proxy: proxy
        )
    }
}
