import BookModel from '../model/BookModel';
import { BookCardComponent } from '../component/BookCardComponent';

@Builder
export function BookOfDayPageBuilder() {
  BookOfDayPage()
}

@Entry
@Component
export struct BookOfDayPage {
  @Consume('mainStack') pathStack: NavPathStack;
  @State book: BookModel = {
    title: '',
    pageCount: 0,
    image: '',
    description: '',
    categories: []
  }

  aboutToAppear(): void {
    // get the parameters
    this.book = this.pathStack.getParamByName('BookOfDayPage')[0] as BookModel
  }

  build() {
    NavDestination() {
      Column() {
        Text('📖 Today\'s Book 📖 ')
          .fontColor($r('app.color.pink'))
          .fontSize(14)
          .padding({ bottom: 5 })
        // get data with params
        BookCardComponent({
          title: this.book.title,
          pageCount: this.book.pageCount,
          image: this.book.image,
          categories: this.book.categories
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
    .hideBackButton(true)
  }
}