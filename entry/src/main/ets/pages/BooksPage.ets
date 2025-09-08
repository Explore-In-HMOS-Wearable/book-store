import { BookCardComponent } from '../component/BookCardComponent'
import { BookViewModel } from '../viewmodel/BookViewModel';
import BookModel from '../model/BookModel';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct HomePage {
  scroller: Scroller = new Scroller()
  @State viewModel: BookViewModel = BookViewModel.instance;

  // get  books when open the page
  aboutToAppear() {
    this.viewModel.fetchBooks()
  }

  build() {

    Column() {
      Text($r('app.string.books'))

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
                router.pushUrl(
                  {
                    url: 'pages/BookDetailPage',
                    // send the data with params
                    params: {
                      title: book.title,
                      image: book.image,
                      description: book.description
                    }
                  }
                )
              })
            Divider().height(2).color(0xCCCCCC).padding({ left: 40, right: 40, bottom: 10 });
          }, (item: string, index: number) => item)
        }.padding({ bottom: 25 })
      }.width('100%').height('100%')
    }.backgroundColor(Color.Black).padding({ top: 10, bottom: 10 }).width('100%').height('100%')

  }
}