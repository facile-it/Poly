//
//  Poly+CustomStringConvertible.swift
//  Poly
//
//  Created by Mathew Polzin on 1/12/19.
//
fileprivate let noneValueString = "None"

extension Poly1: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly2: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly3: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly4: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly5: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly6: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .none:
            str = String(describing: noneValueString)
        }
        return "Poly(\(str))"
    }
}

extension Poly7: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly8: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly9: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly10: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .j(let j):
            str = String(describing: j)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly11: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .j(let j):
            str = String(describing: j)
        case .k(let k):
            str = String(describing: k)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly12: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .j(let j):
            str = String(describing: j)
        case .k(let k):
            str = String(describing: k)
        case .l(let l):
            str = String(describing: l)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly13: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .j(let j):
            str = String(describing: j)
        case .k(let k):
            str = String(describing: k)
        case .l(let l):
            str = String(describing: l)
        case .m(let m):
            str = String(describing: m)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}

extension Poly14: CustomStringConvertible {
    public var description: String {
        let str: String
        switch self {
        case .a(let a):
            str = String(describing: a)
        case .b(let b):
            str = String(describing: b)
        case .c(let c):
            str = String(describing: c)
        case .d(let d):
            str = String(describing: d)
        case .e(let e):
            str = String(describing: e)
        case .f(let f):
            str = String(describing: f)
        case .g(let g):
            str = String(describing: g)
        case .h(let h):
            str = String(describing: h)
        case .i(let i):
            str = String(describing: i)
        case .j(let j):
            str = String(describing: j)
        case .k(let k):
            str = String(describing: k)
        case .l(let l):
            str = String(describing: l)
        case .m(let m):
            str = String(describing: m)
        case .n(let n):
            str = String(describing: n)
        case .none:
            str = String(describing: noneValueString)
        }
        
        return "Poly(\(str))"
    }
}
