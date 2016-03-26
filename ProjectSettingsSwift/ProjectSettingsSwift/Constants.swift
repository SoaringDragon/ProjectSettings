//
//  Constants.swift
//  ProjectSettingsSwift
//
//  Created by GK on 16/3/26.
//  Copyright © 2016年 GK. All rights reserved.
//

import Foundation

#if Debug

let ServerURL = "DebugURL"

#else

    #if Release
        
      let ServerURL = "ReleaseRUL"
        
    #endif

#endif