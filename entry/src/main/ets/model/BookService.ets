import { getHttp } from '../utils/RCP';
import BookModel from './BookModel';
import { RSPModel } from './RSPModel';
import { volModel } from './volModel';
import { getUrl } from '../utils/Constants';

class BookService {
  static async getBooks(uiContext: UIContext) {
    const requestUrl = getUrl(uiContext);
    const response = await getHttp(uiContext, requestUrl) ?? [];
    const rsp = response as RSPModel;

    return rsp.items.map<BookModel>((i: volModel) => ({
      title: i.volumeInfo.title,
      pageCount: i.volumeInfo.pageCount,
      image: i.volumeInfo.imageLinks.smallThumbnail,
      description: i.volumeInfo.description,
      categories: i.volumeInfo.categories
    }));
  }
}

export default BookService;
