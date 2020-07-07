/*:
 # Error Handling
 
 `try!`를 사용하면, error catching을 비활성화 시켜 method를 강제로 실행시킬 수 있지만, 권장되지 않는 방법이다.
 
 `defer` 구문은 method가 결과를 반환하기 직전에 실행되는 cleanup 구문이다.
*/


let connectionOK = true
let connectionSpeed = 30.00
let fileFound = false

// Error Type Declaration
enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

func fileTransfer() throws {
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

func sendFile() -> String {
    defer {
//        removeTmpFiles()
//        closeConnection()
    }
    
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "No Network Connection"
    } catch FileTransferError.lowBandwidth {
        return "File TRansfer Speed too Low"
    } catch FileTransferError.fileNotFound {
        return "File not Found"
    } catch  {
        return "Unknown Error"
    }
    
    return "Successful Transfer"
}
