/*:
 # Your shopping cart
 Now, it's your turn to create your shopping list.
 
 Assume that you want to buy following books:
 * "Digital Fortress" by "Dan Brown", $9.99
 * "Angels & Demons" by "Dan Brown", $17.00
 * "The Da Vinci Code" by "Dan Brown", $9.99
 * "Deception Point" by "Dan Brown", $17.00
 * "Harry Potter and the Goblet of Fire" by "J.K. Rowling", $12.99
 * "Harry Potter and the Half-Blood Prince" by "J.K. Rowling", $12.99
 * "Harry Potter and the Deathly Hallows" by "J.K. Rowling", $14.99
 * "旅行與讀書" by "詹宏志", $12.00
 * "國宴與家宴" by "王宣一", $7.99
 Then, let's create a book store first:
 
 */


var bookStore = BookStore()

/*:
 
 Now start to feed data to the book store.
 
 You have to prepare following functions:
 1. A function which returns the name of authors in a set or a list.
 _Note, you have to remove duplicated authors._
 2. A function which returns the totoal price of books to purchase
 3. A function which returns the number of books to buy
 4. A function which returns a book with its title, author, and price by a given index.
 If the index is out of bound, return `nil`.
 
 */

let books: [[String: String]] = [
    ["author": "Dan Brown", "title": "Digital Fortress", "price": "9.99"],
    ["author": "Dan Brown", "title": "Angels & Demons", "price": "17.00"],
    ["author": "Dan Brown", "title": "The Da Vinci Code", "price": "9.99"],
    ["author": "Dan Brown", "title": "Deception Point", "price": "17.00"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Goblet of Fire", "price": "12.99"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Goblet of Fire", "price": "12.99"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Deathly Hallows", "price": "14.99"],
    ["author": "詹宏志", "title": "旅行與讀書", "price": "12.00"],
    ["author": "王宣一", "title": "國宴與家宴", "price": "7.99"],
]


// Use this
func distinctAuthors() -> Set<String> {
    
    var authors = Set<String>()
    for book in books {
            authors.insert(book["author"]!)
    }
    return authors
}
// or this
//func distinctAuthors() -> [String] { ... }
// then
bookStore.setDataSource(authorsGetter: distinctAuthors)

func totalBookPrice() -> Double {
    
    var totalPrice: Double = 0
    for book in books{
        guard let priceStr = book["price"], let price = Double(priceStr) else {
            print("Price Error")
            return 0
            }
        totalPrice += price
    }
    return totalPrice
}
bookStore.setDataSource(priceCalculator: totalBookPrice)

func getBook(at index: Int) -> (title: String, author: String, price: Double)?{
    
    guard index < books.count && index >= 0 else {
        return nil
    }
    let book = books[index]
    guard let priceStr = book["price"], let price = Double(priceStr) else {
        print("Cannot get price at \(index)")
        return nil
    }
    guard let title = book["title"] else {
        print("Cannot get title at \(index)")
        return nil
    }
    guard let author = book["author"] else {
        print("Cannot get author at \(index)")
        return nil
    }
    return (title, author, price)
}
bookStore.setDataSource(bookGetter: getBook(at:))

/*:
 Finally, let's show the book store shopping cart:
 */

bookStore.showInPlayground()

//: ---
//: [<- Previous](@previous) | [Next ->](@next)
