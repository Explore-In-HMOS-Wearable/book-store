import { router } from '@kit.ArkUI';
import { BookDetailCard } from '../component/BookDetailCard';
import BookModel from '../model/BookModel';

@Entry
@Component
struct BookDetailPage {
  scroller: Scroller = new Scroller()
  params: BookModel = router.getParams() as BookModel;

  build() {
    Column() {
      BookDetailCard({
        image: this.params.image,
        title: this.params.title,
        description: this.params.description
      })
    }
  }
}
