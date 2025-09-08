import { getHttp } from '../utils/RCP';
import BookModel from './BookModel';
import { RSPModel } from './RSPModel';
import { volModel } from './volModel';
import { url } from '../utils/Constants';

class BookService {
  static async getBooks() {
    const response = await getHttp(url) ?? [];
    const rsp = response as RSPModel;
    return rsp.items.map<BookModel>((i: volModel) => {
      return {
        title: i.volumeInfo.title,
        pageCount: i.volumeInfo.pageCount,
        image: i.volumeInfo.imageLinks.smallThumbnail,
        description: i.volumeInfo.description,
        categories: i.volumeInfo.categories
      };
    });
  }
}

export default BookService;
