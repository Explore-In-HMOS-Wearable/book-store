@Component
export struct BookDetailCard {
  @Prop image: string
  @Prop title: string
  @Prop description: string
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Image(this.image)
        .height(100)
        .width(120)
        .borderRadius(10)
        .objectFit(ImageFit.Contain)
        .padding({ bottom: 5 })

      Text(this.title)
        .fontSize(11)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .padding({ bottom: 2 })

      Scroll(this.scroller) {
        Text(this.description)
          .fontSize(9)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
      }
      .height('40%')
      .width('75%')
      .align(Alignment.Center)
      .scrollBar(BarState.Auto)
      .padding({ bottom: 15 })
    }
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#ffd4c890')
    .padding({ top: 20, bottom: 15 })
    .width('100%')
    .height('100%')
  }
}