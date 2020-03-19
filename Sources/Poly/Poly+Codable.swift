//
//  Poly+Codable.swift
//  Poly
//
//  Created by Mathew Polzin on 1/12/19.
//

// MARK: - Generic Decoding

public struct PolyDecodeNoTypesMatchedError: Swift.Error, CustomDebugStringConvertible {
    
    public struct IndividualFailure: Swift.Error {
        public let type: Any.Type
        public let error: DecodingError
    }
    
    public let codingPath: [CodingKey]
    public let individualTypeFailures: [IndividualFailure]
    
    public var debugDescription: String {
        let codingPathString = codingPath
            .map { $0.intValue.map(String.init) ?? $0.stringValue }
            .joined(separator: "/")
        
        let failureStrings = individualTypeFailures.map {
            let type = $0.type
            let descriptiveError = $0.error as? CustomDebugStringConvertible
            let error = descriptiveError?.debugDescription ?? String(describing: $0.error)
            return "\(String(describing: type)) could not be decoded because:\n\(error)"
        }.joined(separator: "\n\n")
        
        return
        """
        Poly failed to decode any of its types at: "\(codingPathString)"
        
        \(failureStrings)
        """
    }
}

internal typealias PolyTypeNotFound = PolyDecodeNoTypesMatchedError.IndividualFailure

private func decode<Thing: Decodable>(_ type: Thing.Type, from container: SingleValueDecodingContainer) throws -> Result<Thing, PolyTypeNotFound> {
    let ret: Result<Thing, PolyTypeNotFound>
    do {
        ret = try .success(container.decode(Thing.self))
    } catch (let err as DecodingError) {
        ret = .failure(PolyTypeNotFound(type: type, error: err))
    } catch (let err) {
        ret = .failure(PolyTypeNotFound(
            type: type,
            error: DecodingError.typeMismatch(
                Thing.self,
                .init(
                    codingPath: container.codingPath,
                    debugDescription: String(describing: err),
                    underlyingError: err
                )
            )
        ))
    }
    return ret
}

// MARK: - 0 types
extension Poly1: Encodable where A: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .none:
            break
        }
    }
}

extension Poly1: Decodable where A: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly1.a($0) }
        ]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 2 types
extension Poly2: Encodable where A: Encodable, B: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .none:
            break
        }
    }
}

extension Poly2: Decodable where A: Decodable, B: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly2.a($0) },
            try decode(B.self, from: container).map { Poly2.b($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 3 types
extension Poly3: Encodable where A: Encodable, B: Encodable, C: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .none:
            break
        }
    }
}

extension Poly3: Decodable where A: Decodable, B: Decodable, C: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly3.a($0) },
            try decode(B.self, from: container).map { Poly3.b($0) },
            try decode(C.self, from: container).map { Poly3.c($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 4 types
extension Poly4: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .none:
            break
        }
    }
}

extension Poly4: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly4.a($0) },
            try decode(B.self, from: container).map { Poly4.b($0) },
            try decode(C.self, from: container).map { Poly4.c($0) },
            try decode(D.self, from: container).map { Poly4.d($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 5 types
extension Poly5: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .none:
            break
        }
    }
}

extension Poly5: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly5.a($0) },
            try decode(B.self, from: container).map { Poly5.b($0) },
            try decode(C.self, from: container).map { Poly5.c($0) },
            try decode(D.self, from: container).map { Poly5.d($0) },
            try decode(E.self, from: container).map { Poly5.e($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 6 types
extension Poly6: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .none:
            break
        }
    }
}

extension Poly6: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly6.a($0) },
            try decode(B.self, from: container).map { Poly6.b($0) },
            try decode(C.self, from: container).map { Poly6.c($0) },
            try decode(D.self, from: container).map { Poly6.d($0) },
            try decode(E.self, from: container).map { Poly6.e($0) },
            try decode(F.self, from: container).map { Poly6.f($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 7 types
extension Poly7: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .none:
            break
        }
    }
}

extension Poly7: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly7.a($0) },
            try decode(B.self, from: container).map { Poly7.b($0) },
            try decode(C.self, from: container).map { Poly7.c($0) },
            try decode(D.self, from: container).map { Poly7.d($0) },
            try decode(E.self, from: container).map { Poly7.e($0) },
            try decode(F.self, from: container).map { Poly7.f($0) },
            try decode(G.self, from: container).map { Poly7.g($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 8 types
extension Poly8: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .none:
            break
        }
    }
}

extension Poly8: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly8.a($0) },
            try decode(B.self, from: container).map { Poly8.b($0) },
            try decode(C.self, from: container).map { Poly8.c($0) },
            try decode(D.self, from: container).map { Poly8.d($0) },
            try decode(E.self, from: container).map { Poly8.e($0) },
            try decode(F.self, from: container).map { Poly8.f($0) },
            try decode(G.self, from: container).map { Poly8.g($0) },
            try decode(H.self, from: container).map { Poly8.h($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 9 types
extension Poly9: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .none:
            break
        }
    }
}

extension Poly9: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly9.a($0) },
            try decode(B.self, from: container).map { Poly9.b($0) },
            try decode(C.self, from: container).map { Poly9.c($0) },
            try decode(D.self, from: container).map { Poly9.d($0) },
            try decode(E.self, from: container).map { Poly9.e($0) },
            try decode(F.self, from: container).map { Poly9.f($0) },
            try decode(G.self, from: container).map { Poly9.g($0) },
            try decode(H.self, from: container).map { Poly9.h($0) },
            try decode(I.self, from: container).map { Poly9.i($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 10 types
extension Poly10: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable, J: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .j(let j):
            try container.encode(j)
        case .none:
            break
        }
    }
}

extension Poly10: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable, J: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly10.a($0) },
            try decode(B.self, from: container).map { Poly10.b($0) },
            try decode(C.self, from: container).map { Poly10.c($0) },
            try decode(D.self, from: container).map { Poly10.d($0) },
            try decode(E.self, from: container).map { Poly10.e($0) },
            try decode(F.self, from: container).map { Poly10.f($0) },
            try decode(G.self, from: container).map { Poly10.g($0) },
            try decode(H.self, from: container).map { Poly10.h($0) },
            try decode(I.self, from: container).map { Poly10.i($0) },
            try decode(J.self, from: container).map { Poly10.j($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 11 types
extension Poly11: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable, J: Encodable, K: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .j(let j):
            try container.encode(j)
        case .k(let k):
            try container.encode(k)
        case .none:
            break
        }
    }
}

extension Poly11: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable, J: Decodable, K: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly11.a($0) },
            try decode(B.self, from: container).map { Poly11.b($0) },
            try decode(C.self, from: container).map { Poly11.c($0) },
            try decode(D.self, from: container).map { Poly11.d($0) },
            try decode(E.self, from: container).map { Poly11.e($0) },
            try decode(F.self, from: container).map { Poly11.f($0) },
            try decode(G.self, from: container).map { Poly11.g($0) },
            try decode(H.self, from: container).map { Poly11.h($0) },
            try decode(I.self, from: container).map { Poly11.i($0) },
            try decode(J.self, from: container).map { Poly11.j($0) },
            try decode(K.self, from: container).map { Poly11.k($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 12 types
extension Poly12: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable, J: Encodable, K: Encodable, L: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .j(let j):
            try container.encode(j)
        case .k(let k):
            try container.encode(k)
        case .l(let l):
            try container.encode(l)
        case .none:
            break
        }
    }
}

extension Poly12: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable, J: Decodable, K: Decodable, L: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly12.a($0) },
            try decode(B.self, from: container).map { Poly12.b($0) },
            try decode(C.self, from: container).map { Poly12.c($0) },
            try decode(D.self, from: container).map { Poly12.d($0) },
            try decode(E.self, from: container).map { Poly12.e($0) },
            try decode(F.self, from: container).map { Poly12.f($0) },
            try decode(G.self, from: container).map { Poly12.g($0) },
            try decode(H.self, from: container).map { Poly12.h($0) },
            try decode(I.self, from: container).map { Poly12.i($0) },
            try decode(J.self, from: container).map { Poly12.j($0) },
            try decode(K.self, from: container).map { Poly12.k($0) },
            try decode(L.self, from: container).map { Poly12.l($0)}]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 13 types
extension Poly13: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable, J: Encodable, K: Encodable, L: Encodable, M: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .j(let j):
            try container.encode(j)
        case .k(let k):
            try container.encode(k)
        case .l(let l):
            try container.encode(l)
        case .m(let m):
            try container.encode(m)
        case .none:
            break
        }
    }
}

extension Poly13: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable, J: Decodable, K: Decodable, L: Decodable, M: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly13.a($0) },
            try decode(B.self, from: container).map { Poly13.b($0) },
            try decode(C.self, from: container).map { Poly13.c($0) },
            try decode(D.self, from: container).map { Poly13.d($0) },
            try decode(E.self, from: container).map { Poly13.e($0) },
            try decode(F.self, from: container).map { Poly13.f($0) },
            try decode(G.self, from: container).map { Poly13.g($0) },
            try decode(H.self, from: container).map { Poly13.h($0) },
            try decode(I.self, from: container).map { Poly13.i($0) },
            try decode(J.self, from: container).map { Poly13.j($0) },
            try decode(K.self, from: container).map { Poly13.k($0) },
            try decode(L.self, from: container).map { Poly13.l($0)},
            try decode(M.self, from: container).map { Poly13.m($0)}]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}

// MARK: - 14 types
extension Poly14: Encodable where A: Encodable, B: Encodable, C: Encodable, D: Encodable, E: Encodable, F: Encodable, G: Encodable, H: Encodable, I: Encodable, J: Encodable, K: Encodable, L: Encodable, M: Encodable, N: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .a(let a):
            try container.encode(a)
        case .b(let b):
            try container.encode(b)
        case .c(let c):
            try container.encode(c)
        case .d(let d):
            try container.encode(d)
        case .e(let e):
            try container.encode(e)
        case .f(let f):
            try container.encode(f)
        case .g(let g):
            try container.encode(g)
        case .h(let h):
            try container.encode(h)
        case .i(let i):
            try container.encode(i)
        case .j(let j):
            try container.encode(j)
        case .k(let k):
            try container.encode(k)
        case .l(let l):
            try container.encode(l)
        case .m(let m):
            try container.encode(m)
        case .n(let n):
            try container.encode(n)
        case .none:
            break
        }
    }
}

extension Poly14: Decodable where A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable, F: Decodable, G: Decodable, H: Decodable, I: Decodable, J: Decodable, K: Decodable, L: Decodable, M: Decodable, N: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let attempts = [
            try decode(A.self, from: container).map { Poly14.a($0) },
            try decode(B.self, from: container).map { Poly14.b($0) },
            try decode(C.self, from: container).map { Poly14.c($0) },
            try decode(D.self, from: container).map { Poly14.d($0) },
            try decode(E.self, from: container).map { Poly14.e($0) },
            try decode(F.self, from: container).map { Poly14.f($0) },
            try decode(G.self, from: container).map { Poly14.g($0) },
            try decode(H.self, from: container).map { Poly14.h($0) },
            try decode(I.self, from: container).map { Poly14.i($0) },
            try decode(J.self, from: container).map { Poly14.j($0) },
            try decode(K.self, from: container).map { Poly14.k($0) },
            try decode(L.self, from: container).map { Poly14.l($0) },
            try decode(M.self, from: container).map { Poly14.m($0) },
            try decode(N.self, from: container).map { Poly14.n($0) }]
        
        self = attempts
            .lazy
            .compactMap { $0.value }
            .first
            .get(or: .none)
    }
}


