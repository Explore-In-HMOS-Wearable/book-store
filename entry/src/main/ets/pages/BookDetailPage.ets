import { BookDetailCard } from '../component/BookDetailCard';
import BookModel from '../model/BookModel';

@Builder
export function BookDetailPageBuilder() {
  BookDetailPage()
}

@Entry
@Component
struct BookDetailPage {
  scroller: Scroller = new Scroller()
  @Consume('mainStack') pathStack: NavPathStack
  @State book: BookModel = {
    title: '',
    pageCount: 0,
    image: '',
    description: '',
    categories: []
  }

  aboutToAppear(): void {
    // get the parameters
    this.book = this.pathStack.getParamByName('BookDetailPage')[0] as BookModel
  }

  build() {
    NavDestination() {
      Column() {
        BookDetailCard({
          image: this.book.image,
          title: this.book.title,
          description: this.book.description
        })
      }
    }
    .hideBackButton(true)
  }
}
