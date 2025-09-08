import BookModel from '../model/BookModel';
import BookService from '../model/BookService';

@Observed
export class BookViewModel {
  private static _instance: BookViewModel;
  allBooks: BookModel[] = []

  private constructor() {
  }

  public static get instance(): BookViewModel {
    if (!BookViewModel._instance) {
      BookViewModel._instance = new BookViewModel();
    }
    return BookViewModel._instance;
  }

  async fetchBooks() {
    this.allBooks = await BookService.getBooks();
    console.info('BookViewModel Books:', JSON.stringify(this.allBooks, null, 3));
  }
}