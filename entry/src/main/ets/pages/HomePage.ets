import BookModel from '../model/BookModel';
import { HomeViewModel } from '../viewmodel/HomeViewModel';

@Builder
export function HomePageBuilder() {
  HomePage()
}

@Entry
@Component
struct HomePage {
  @State viewModel: HomeViewModel = HomeViewModel.instance;
  @Consume('mainStack') pathStack: NavPathStack;
  allBooks: BookModel[] = []
  currentBook: BookModel | null = null;

  //reset the button when this page open
  onPageShow() {
    this.viewModel.offsetX = 0
    this.viewModel.offsetY = 0
    this.viewModel.name = $r('app.string.games')
    this.viewModel.fetchBooks()
  }

  build() {
    NavDestination() {
      Column() {
        Button($r('app.string.bookofday'))
          .backgroundColor($r('app.color.pink'))
          .margin({ bottom: 5 })
          .onClick(async () => {
            if (!this.viewModel.allBooks || this.viewModel.allBooks.length === 0) {
              console.warn('Books not loaded yet');
              await this.viewModel.fetchBooks(this.getUIContext());
            }

            if (!this.viewModel.allBooks || this.viewModel.allBooks.length === 0) {
              console.error('Still no books available after fetch!');
              return;
            }
            const randomIndex = Math.floor(Math.random() * this.viewModel.allBooks.length);
            this.currentBook = this.viewModel.allBooks[randomIndex];
            console.log('Random Book:', JSON.stringify(this.currentBook));

            this.pathStack?.pushPath({
              name: 'BookOfDayPage',
              param: this.currentBook
            });
          })

        Button($r('app.string.books'))
          .backgroundColor($r('app.color.green'))
          .margin({ bottom: 5 })
          .onClick(() => {
            this.pathStack.pushPathByName('BooksPage', null)
          })

        Button(this.viewModel.name)
          .backgroundColor($r('app.color.gray'))
          .offset({ x: this.viewModel.offsetX, y: this.viewModel.offsetY })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.viewModel.escape()
              this.viewModel.name = this.viewModel.getRandomResponse()
            }
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
    .hideBackButton(true)
  }
}