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

  async fetchBooks(uiContext?: UIContext) {
    if (!uiContext) {
      console.error('UIContext is undefined. Cannot fetch books.')
      return;
    }

    try {
      this.allBooks = await BookService.getBooks(uiContext);
      console.info('BookViewModel Books:', JSON.stringify(this.allBooks, null, 3))
    } catch (err) {
      console.error('Failed to fetch books:', JSON.stringify(err))
    }
  }
}
