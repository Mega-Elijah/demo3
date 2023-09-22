import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    BookRequest addBookRequest = {title: "ballerina", author: "ballerina", location: "ballerina", isbn: 1, status: true};
    BookResponse addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    UpdateBookRequest updateBookRequest = {isbn: 1, title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", status: true};
    BookResponse updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    RemoveBookRequest removeBookRequest = {isbn: 1};
    RemoveBookResponse removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);

    LocateBookRequest locateBookRequest = {isbn: 1};
    LocateBookResponse locateBookResponse = check ep->locateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowBookRequest borrowBookRequest = {user_id: 1, isbn: 1};
    BorrowBookResponse borrowBookResponse = check ep->borrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    Empty listAvailableBooksRequest = {};
    stream<BookResponse, error?> listAvailableBooksResponse = check ep->listAvailableBooks(listAvailableBooksRequest);
    check listAvailableBooksResponse.forEach(function(BookResponse value) {
        io:println(value);
    });

    UserRequest createUsersRequest = {user_id: 1, user_type: "ballerina"};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->createUsers();
    check createUsersStreamingClient->sendUserRequest(createUsersRequest);
    check createUsersStreamingClient->complete();
    UserResponse? createUsersResponse = check createUsersStreamingClient->receiveUserResponse();
    io:println(createUsersResponse);
}

