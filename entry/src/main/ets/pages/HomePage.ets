import { router } from '@kit.ArkUI';
import { HomeViewModel } from '../viewmodel/HomeViewModel';

@Entry
@Component
struct HomePage {
  @State viewModel: HomeViewModel = HomeViewModel.instance;

  //reset the button when this page open
  onPageShow() {
    this.viewModel.offsetX = 0
    this.viewModel.offsetY = 0
    this.viewModel.name = $r('app.string.games')
    this.viewModel.fetchBooks()
  }

  build() {
    Column() {
      Button($r('app.string.bookofday'))
        .backgroundColor($r('app.color.pink'))
        .margin({ bottom: 5 })
        .onClick(() => {
          this.viewModel.showRandomBook()
        })

      Button($r('app.string.books'))
        .backgroundColor($r('app.color.green'))
        .margin({ bottom: 5 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/BooksPage',
          });
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
}