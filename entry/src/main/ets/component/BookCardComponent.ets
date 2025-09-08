@Component
export struct BookCardComponent {
  @Prop title: string
  @Prop pageCount: number | null = null
  @Prop image: string
  @Prop categories: Array<string> | null = null

  build() {
    Column() {
      Image(this.image)
        .width(60)
        .height(70)
        .padding({ bottom: 3 })

      Text(this.categories && this.categories.length > 0 ? this.categories.join(', ') : 'No categories')
        .fontSize(9)
        .fontColor(Color.White)
        .padding({ bottom: 3 })

      Text(this.title)
        .fontSize(11)
        .fontColor(Color.White)
        .padding({ bottom: 3 })

      Text(this.pageCount !== null ? this.pageCount.toString() + ' pages' : 'Page count unknown')
        .fontSize(9)
        .fontColor(Color.White)
    }
    .padding(2)
    .width('70%')
    .borderRadius(20)
  }
}
