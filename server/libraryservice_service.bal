import ballerina/grpc;

public type Books record {
    string title;
    string author;
    string other_author;
    string location;
    int isbn;
    boolean status;
} book = {title: "New Dawn", author: "J.K", other_author: "K.J", location: "Back", isbn: 123,status: true};

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    

    remote function addBook(BookRequest value) returns BookResponse|error {
    }
    remote function updateBook(UpdateBookRequest value) returns BookResponse|error {
    }
    remote function removeBook(RemoveBookRequest value) returns RemoveBookResponse|error {
    }
    remote function locateBook(LocateBookRequest value) returns LocateBookResponse|error {
    }
    remote function borrowBook(BorrowBookRequest value) returns BorrowBookResponse|error {
    }
    remote function createUsers(stream<UserRequest, grpc:Error?> clientStream) returns UserResponse|error {
    }
    remote function listAvailableBooks(Empty value) returns stream<BookResponse, error?>|error {
    }
}

