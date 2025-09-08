import BookModel from '../model/BookModel';
import { router } from '@kit.ArkUI';
import { BookCardComponent } from '../component/BookCardComponent';

@Entry
@Component
export struct BookOfDayPage {
  params: BookModel = router.getParams() as BookModel;

  build() {
    Column() {
      Text('📖 Today\'s Book 📖 ')
        .fontColor($r('app.color.pink'))
        .fontSize(14)
        .padding({ bottom: 5 })
      // get data with params
      BookCardComponent({
        title: this.params.title,
        pageCount: this.params.pageCount,
        image: this.params.image,
        categories: this.params.categories
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}