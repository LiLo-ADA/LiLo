//
//  LockerList.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct LockerList: View {
    let lockers: [LockerResponse]
    let selectedLocker: LockerResponse?
    let onClick: (LockerResponse) -> Void
    
    private var horizontalCount: Int {
        lockers.count / 3
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            if !lockers.isEmpty {
                VStack(spacing: 10) {
                    LazyHStack(spacing: 10) {
                        ForEach(lockers[0..<horizontalCount]) { locker in
                              LockerView(
                                locker: locker,
                                isSelected: selectedLocker?.id == locker.id,
                                onClick: {
                                    onClick(locker)
                                }
                              )
                         }
                         .listStyle(.plain)
                    }
                    .frame(height: 58)
                    
                    LazyHStack(spacing: 10) {
                         ForEach(lockers[horizontalCount..<(horizontalCount * 2)]) { locker in
                             LockerView(
                               locker: locker,
                               isSelected: selectedLocker?.id == locker.id,
                               onClick: {
                                   onClick(locker)
                               }
                             )
                         }
                         .listStyle(.plain)
                    }
                    .frame(height: 58)
                    
                    LazyHStack(spacing: 10) {
                        ForEach(lockers[(horizontalCount * 2)..<(horizontalCount * 3)]) { locker in
                            LockerView(
                              locker: locker,
                              isSelected: selectedLocker?.id == locker.id,
                              onClick: {
                                  onClick(locker)
                              }
                            )
                         }
                         .listStyle(.plain)
                    }
                    .frame(height: 58)
                }
                .padding(10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .background(
                    Color.lightGrey.clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                )
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    LockerList(
        lockers: Dummy.lockers,
        selectedLocker: Dummy.locker,
        onClick: { _ in }
    )
}
