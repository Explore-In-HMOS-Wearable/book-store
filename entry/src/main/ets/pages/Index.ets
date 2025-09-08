import { router, curves } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  private timerId = 0;
  @State imageTranslateY: number = 300;
  @State textOffsetY: number = -50;
  @State textOpacity: number = 0;

  aboutToAppear() {
    setTimeout(() => {
      this.textOffsetY = 0;
      this.textOpacity = 1;
    }, 100);

    setTimeout(() => {
      this.imageTranslateY = 10;
    }, 300);

    this.timerId = setTimeout(() => {
      router.pushUrl({
        url: 'pages/HomePage',
      });
    }, 3000);
  }

  onDestroy() {
    if (this.timerId) {
      clearTimeout(this.timerId);
    }
  }

  build() {
    Stack() {
      Column() {
        Text($r('app.string.splash_text'))
          .fontColor(Color.White)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .translate({ y: this.textOffsetY })
          .opacity(this.textOpacity)
          .animation({
            curve: curves.initCurve(),
            iterations: 1,
            duration: 800,
            playMode: PlayMode.Normal,
          })

        Image($r('app.media.splash'))
          .height('35%')
          .borderRadius(10)
          .translate({ y: this.imageTranslateY })
          .animation({
            curve: curves.initCurve(),
            iterations: 1,
            duration: 1000,
            playMode: PlayMode.Normal,
          })
      }
      .align(Alignment.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}
