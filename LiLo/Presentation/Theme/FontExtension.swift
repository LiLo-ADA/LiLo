//
//  FontExtension.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation
import SwiftUI

extension Font {
    private static let sfProRegular = "SFPro-Regular"
    private static let sfProSemiBold = "SFPro-SemiBold"
    private static let sfProBold = "SFPro-Bold"
    private static let sfProDisplayBold = "SFProDisplay-Bold"
    
    static var Body: Font {
        Font(UIFont.systemFont(ofSize: 17, weight: .regular))
    }
    
    static var Headline: Font {
        Font(UIFont.systemFont(ofSize: 17, weight: .semibold))
    }
    
    static var Title2: Font {
        Font(UIFont.systemFont(ofSize: 22, weight: .bold))
    }
    
    static var Title1: Font {
        Font(UIFont.systemFont(ofSize: 20, weight: .bold))
    }
    
    static var LargeTitle: Font {
        Font(UIFont.systemFont(ofSize: 28, weight: .bold))
    }
    
    static var Body2: Font {
        Font(UIFont.systemFont(ofSize: 13, weight: .regular))
    }
}
