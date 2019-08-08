    //
//  File.swift
//  Ayo~Bro
//
//  Created by A09 on 09/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

    import Foundation
    
    extension NSObject{
        static var reuseIdentifier: String {
            return String(describing: self)
        }
    }

