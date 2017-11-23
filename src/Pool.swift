//
//  Pool.swift
//  Pooling
//
//  Created by Dmitry Volosach on 22.11.2017
//  Copyright © 2017 Dmitry Volosach. All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
//  SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
//  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

import Foundation

/**
 Objects pool
 
 - author: gitvalue
 */
public class Pool<U>: Pooling where U: Poolable {    
    public typealias T = U
    
    /**
     Thread synchronization object
     */
    private let mutex = PThreadMutex()
    
    /**
     Objects list
     */
    private var pool: [T]!
    
    /**
     Objects 'creator' type
     */
    private var creatorType: T.Type
    
    required public init(size: Int, type: T.Type = T.self) {
        pool = []
        creatorType = type
        
        for _ in 0..<size {
            pool.append(creatorType.init(pool: self))
        }
    }
    
    public func borrow() -> U {
        return mutex.sync {
            return (0 < pool.count ? pool.popLast() : creatorType.init(pool: self))!
        }
    }

    public func recall(_ object: U) {
        mutex.sync {
            pool.append(object)
        }
    }
}
