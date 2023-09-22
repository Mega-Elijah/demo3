import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C6962726172791A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22BC010A0B426F6F6B5265717565737412140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212260A0C6F746865725F617574686F721803200128094800520B6F74686572417574686F72880101121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280552046973626E12160A067374617475731806200128085206737461747573420F0A0D5F6F746865725F617574686F7222BD010A0C426F6F6B526573706F6E736512140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212260A0C6F746865725F617574686F721803200128094800520B6F74686572417574686F72880101121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280552046973626E12160A067374617475731806200128085206737461747573420F0A0D5F6F746865725F617574686F7222430A0B557365725265717565737412170A07757365725F69641801200128055206757365724964121B0A09757365725F747970651802200128095208757365725479706522440A0C55736572526573706F6E736512170A07757365725F69641801200128055206757365724964121B0A09757365725F747970651802200128095208757365725479706522A7010A11557064617465426F6F6B5265717565737412120A046973626E18012001280552046973626E12140A057469746C6518022001280952057469746C6512190A08617574686F725F311803200128095207617574686F723112190A08617574686F725F321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E12160A06737461747573180620012808520673746174757322270A1152656D6F7665426F6F6B5265717565737412120A046973626E18012001280552046973626E22410A1252656D6F7665426F6F6B526573706F6E7365122B0A05626F6F6B7318012003280B32152E6C6962726172792E426F6F6B526573706F6E73655205626F6F6B7322070A05456D70747922270A114C6F63617465426F6F6B5265717565737412120A046973626E18012001280552046973626E22300A124C6F63617465426F6F6B526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E22400A11426F72726F77426F6F6B5265717565737412170A07757365725F6964180120012805520675736572496412120A046973626E18022001280552046973626E222E0A12426F72726F77426F6F6B526573706F6E736512180A076F7574636F6D6518012001280852076F7574636F6D6532DB030A0E4C6962726172795365727669636512360A07616464426F6F6B12142E6C6962726172792E426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E7365123C0A0B637265617465557365727312142E6C6962726172792E55736572526571756573741A152E6C6962726172792E55736572526573706F6E73652801123F0A0A757064617465426F6F6B121A2E6C6962726172792E557064617465426F6F6B526571756573741A152E6C6962726172792E426F6F6B526573706F6E736512450A0A72656D6F7665426F6F6B121A2E6C6962726172792E52656D6F7665426F6F6B526571756573741A1B2E6C6962726172792E52656D6F7665426F6F6B526573706F6E7365123D0A126C697374417661696C61626C65426F6F6B73120E2E6C6962726172792E456D7074791A152E6C6962726172792E426F6F6B526573706F6E7365300112450A0A6C6F63617465426F6F6B121A2E6C6962726172792E4C6F63617465426F6F6B526571756573741A1B2E6C6962726172792E4C6F63617465426F6F6B526573706F6E736512450A0A626F72726F77426F6F6B121A2E6C6962726172792E426F72726F77426F6F6B526571756573741A1B2E6C6962726172792E426F72726F77426F6F6B526573706F6E7365620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function addBook(BookRequest|ContextBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/addBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function addBookContext(BookRequest|ContextBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/addBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function updateBook(UpdateBookRequest|ContextUpdateBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function updateBookContext(UpdateBookRequest|ContextUpdateBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function removeBook(RemoveBookRequest|ContextRemoveBookRequest req) returns RemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <RemoveBookResponse>result;
    }

    isolated remote function removeBookContext(RemoveBookRequest|ContextRemoveBookRequest req) returns ContextRemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <RemoveBookResponse>result, headers: respHeaders};
    }

    isolated remote function locateBook(LocateBookRequest|ContextLocateBookRequest req) returns LocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <LocateBookResponse>result;
    }

    isolated remote function locateBookContext(LocateBookRequest|ContextLocateBookRequest req) returns ContextLocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <LocateBookResponse>result, headers: respHeaders};
    }

    isolated remote function borrowBook(BorrowBookRequest|ContextBorrowBookRequest req) returns BorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowBookResponse>result;
    }

    isolated remote function borrowBookContext(BorrowBookRequest|ContextBorrowBookRequest req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function createUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/createUsers");
        return new CreateUsersStreamingClient(sClient);
    }

    isolated remote function listAvailableBooks(Empty|ContextEmpty req) returns stream<BookResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookResponseStream outputStream = new BookResponseStream(result);
        return new stream<BookResponse, grpc:Error?>(outputStream);
    }

    isolated remote function listAvailableBooksContext(Empty|ContextEmpty req) returns ContextBookResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookResponseStream outputStream = new BookResponseStream(result);
        return {content: new stream<BookResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUserRequest(UserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUserRequest(ContextUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUserResponse() returns UserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <UserResponse>payload;
        }
    }

    isolated remote function receiveContextUserResponse() returns ContextUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <UserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BookResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|BookResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|BookResponse value;|} nextRecord = {value: <BookResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class LibraryServiceLocateBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendLocateBookResponse(LocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextLocateBookResponse(ContextLocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookResponse(BookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookResponse(ContextBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceRemoveBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendRemoveBookResponse(RemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextRemoveBookResponse(ContextRemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBorrowBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBorrowBookResponse(BorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBorrowBookResponse(ContextBorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceUserResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUserResponse(UserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUserResponse(ContextUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBookResponseStream record {|
    stream<BookResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextUserRequestStream record {|
    stream<UserRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookResponse record {|
    BookResponse content;
    map<string|string[]> headers;
|};

public type ContextUserResponse record {|
    UserResponse content;
    map<string|string[]> headers;
|};

public type ContextLocateBookRequest record {|
    LocateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextLocateBookResponse record {|
    LocateBookResponse content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookRequest record {|
    RemoveBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    BorrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateBookRequest record {|
    UpdateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookRequest record {|
    BorrowBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBookRequest record {|
    BookRequest content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookResponse record {|
    RemoveBookResponse content;
    map<string|string[]> headers;
|};

public type ContextUserRequest record {|
    UserRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookResponse record {|
    string title = "";
    string author = "";
    string location = "";
    int isbn = 0;
    boolean status = false;
    string other_author?;
|};

isolated function isValidBookresponse(BookResponse r) returns boolean {
    int _other_authorCount = 0;
    if !(r?.other_author is ()) {
        _other_authorCount += 1;
    }
    if (_other_authorCount > 1) {
        return false;
    }
    return true;
}

isolated function setBookResponse_OtherAuthor(BookResponse r, string other_author) {
    r.other_author = other_author;
}

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserResponse record {|
    int user_id = 0;
    string user_type = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookRequest record {|
    int isbn = 0;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookResponse record {|
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookRequest record {|
    int isbn = 0;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookResponse record {|
    boolean outcome = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UpdateBookRequest record {|
    int isbn = 0;
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    boolean status = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookRequest record {|
    int user_id = 0;
    int isbn = 0;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookRequest record {|
    string title = "";
    string author = "";
    string location = "";
    int isbn = 0;
    boolean status = false;
    string other_author?;
|};

isolated function isValidBookrequest(BookRequest r) returns boolean {
    int _other_authorCount = 0;
    if !(r?.other_author is ()) {
        _other_authorCount += 1;
    }
    if (_other_authorCount > 1) {
        return false;
    }
    return true;
}

isolated function setBookRequest_OtherAuthor(BookRequest r, string other_author) {
    r.other_author = other_author;
}

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookResponse record {|
    BookResponse[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserRequest record {|
    int user_id = 0;
    string user_type = "";
|};

