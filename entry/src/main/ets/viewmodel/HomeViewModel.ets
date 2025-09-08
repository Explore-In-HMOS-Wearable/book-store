import BookModel from '../model/BookModel';
import { router } from '@kit.ArkUI';
import BookService from '../model/BookService';

@Observed
export class HomeViewModel {
  offsetX: number = 0
  offsetY: number = 0
  name: ResourceStr = $r('app.string.games')
  private responses: ResourceStr[] = [
    $r('app.string.noway'),
    $r('app.string.choosebooks'),
    $r('app.string.catchme'),
    $r('app.string.nicetry'),
    $r('app.string.oopss'),
  ]
  allBooks: BookModel[] = []
  currentBook: BookModel | null = null;
  private static _instance: HomeViewModel;

  private constructor() {
  }

  public static get instance(): HomeViewModel {
    if (!HomeViewModel._instance) {
      HomeViewModel._instance = new HomeViewModel();
    }
    return HomeViewModel._instance;
  }

  escape() {
    let newX = this.randomOffset(-60, 60)
    let newY = this.randomOffset(-70, 70)

    animateTo({ duration: 50, curve: Curve.EaseInOut }, () => {
      this.offsetX = newX
      this.offsetY = newY
    })
  }

  randomOffset(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
  }

  getRandomResponse(): ResourceStr {
    let index = Math.floor(Math.random() * this.responses.length)
    return this.responses[index]
  }

  async fetchBooks() {
    this.allBooks = await BookService.getBooks();
    console.info('HomeViewModel Books:', JSON.stringify(this.allBooks, null, 3));
  }

  showRandomBook() {
    const randomIndex = Math.floor(Math.random() * this.allBooks.length);
    this.currentBook = this.allBooks[randomIndex];
    router.pushUrl({
      url: 'pages/BookOfDayPage',
      params: {
        title: this.currentBook.title,
        pageCount: this.currentBook.pageCount,
        image: this.currentBook.image,
        description: this.currentBook.description,
        categories: this.currentBook.categories,
      }
    })
  }
}