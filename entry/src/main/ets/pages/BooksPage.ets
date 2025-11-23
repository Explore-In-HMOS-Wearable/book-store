import { BookCardComponent } from '../component/BookCardComponent'
import { BookViewModel } from '../viewmodel/BookViewModel';
import BookModel from '../model/BookModel';

@Builder
export function BooksPageBuilder() {
  BooksPage()
}

@Entry
@Component
struct BooksPage {
  scroller: Scroller = new Scroller()
  @State viewModel: BookViewModel = BookViewModel.instance;
  @Consume('mainStack') pathStack: NavPathStack;

  // get  books when open the page
  aboutToAppear() {
    this.viewModel.fetchBooks(this.getUIContext())
  }

  build() {
    NavDestination() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.viewModel.allBooks, (book: BookModel, index: number) => {
            BookCardComponent({
              image: book.image,
              title: book.title,
              pageCount: book.pageCount,
              categories: book.categories
            }).padding({ bottom: 4 })
              .onClick(() => {
                this.pathStack.pushPath({
                  name: 'BookDetailPage',
                  param: book
                })
              })
            Divider().height(2).color(0xCCCCCC).padding({ left: 40, right: 40, bottom: 10 });
          }, (item: string, index: number) => item)
        }.padding({ bottom: 15, top: 15 })
      }.width('100%').height('100%')
    }
    .hideBackButton(true)
  }
}