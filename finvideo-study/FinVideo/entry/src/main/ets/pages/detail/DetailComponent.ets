import { router } from "@kit.ArkUI"
import { CommonConstants } from "../common/CommonConstants"
import { DetailViewModel } from "./DetailViewModel"
import { Repository } from "../../data/Repository"
import LazyDataSource from "../common/LazyDataSource"
import { PlayerArgs } from "../player/PlayerArgs"
import { BreakpointSystem, FinItem, FinPerson } from "@ohpg/fin-core"
import { FinItemType, FinPersonType } from "@ohpg/fin-core"
import { ResponsiveLayout } from "../../adaptive/ResponsiveLayout"

@Component
export struct DetailOperate {

  @LocalStorageLink("viewModel") viewModel?: DetailViewModel = undefined

  @Link itemDto: FinItem

  @State collecting: boolean = false

  @State collected: boolean = false

  @State finishing: boolean = false

  @State finished: boolean = false

  aboutToAppear(): void {
    if (this.viewModel) {
      this.finished = this.viewModel.isFinished()
      this.collected = this.viewModel.isFavourite()
    }
  }

  build() {
    Row({space: CommonConstants.SPACE_8}) {
      Button({type: ButtonType.Capsule}) {
        SymbolGlyph($r('sys.symbol.play_fill'))
          .fontColor([$r('sys.color.font_on_primary')])
          .fontSize($r('sys.float.Title_M'))
      }
      .id('episode_play')
      .width(80)
      .height(32)
      .onClick(() => {
        this.playOrNot()
      })

      Blank()

      Button({type: ButtonType.Circle}) {
        if (this.finishing) {
          SymbolGlyph($r('sys.symbol.loading'))
            .fontSize($r('sys.float.Title_M'))
        } else {
          SymbolGlyph($r('sys.symbol.checkmark'))
            .fontColor([this.finished ? Color.Red : Color.Gray])
            .fontSize($r('sys.float.Title_M'))
        }
      }
      .id('episode_finish')
      .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
      .enabled(!this.finishing)
      .padding(CommonConstants.SPACE_4)
      .onClick(() => {
        this.finishOrNot()
      })

      Button({type: ButtonType.Circle}) {
        if (this.collecting) {
          SymbolGlyph($r('sys.symbol.loading'))
            .fontSize($r('sys.float.Title_M'))
        } else {
          SymbolGlyph(this.collected ? $r('sys.symbol.heart_fill') : $r('sys.symbol.heart'))
            .fontColor([this.collected ? Color.Red : Color.Gray])
            .fontSize($r('sys.float.Title_M'))
        }
      }
      .id('episode_collect')
      .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
      .enabled(!this.collecting)
      .padding(CommonConstants.SPACE_4)
      .onClick(() => {
        this.collectOrNot()
      })
    }
  }

  private playOrNot() {
    let args: PlayerArgs = {
      id: this.itemDto!.id!,
      name: this.itemDto!.name!,
      type: this.itemDto!.type!
    }
    router.pushUrl({url: "pages/player/PlayerPage", params: args})
  }

  private finishOrNot() {
    this.finishing = true
    this.viewModel?.finishOrNot()
      .then((finished) => {
        this.finishing = false
        this.finished = finished
        this.itemDto!.data!.played = finished
      })
      .catch((error: Error) => {
        this.finishing = false
      })
  }

  private collectOrNot() {
    this.collecting = true
    this.viewModel?.favouriteOrNot()
      .then((collected) => {
        this.collecting = false
        this.collected = collected
        this.itemDto!.data!.isFavorite = collected
      })
      .catch((error: Error) => {
        this.collecting = false
      })
  }

  aboutToDisappear(): void {

  }

}

@Component
export struct DetailCover {

  @StorageLink("Repository") repository?: Repository = undefined

  @Prop itemDto: FinItem

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @StorageProp(BreakpointSystem.CURRENT_HEIGHT_BREAKPOINT) currentHeightBreakpoint: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM

  build() {
    Image(this.itemDto?.image?.backdrop)
      .alt($r('app.media.alt'))
      .objectFit(ImageFit.Cover)
      .autoResize(true)
      .width(CommonConstants.FULL_PERCENT)
      .aspectRatio(ResponsiveLayout.isCompact(this.currentWidthBreakpoint) ? 1.5 : 3)
  }

}

@Component
export struct DetailHeader {

  @StorageLink("Repository") repository?: Repository = undefined

  @Prop itemDto: FinItem

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @State collecting: boolean = false

  @State collected: boolean = false

  @State finishing: boolean = false

  @State finished: boolean = false

  @State genres?: string = undefined

  @State actors?: string = undefined

  @State authors?: string = undefined

  aboutToAppear(): void {
    this.genres = this.itemDto.genres?.join(",")
    this.actors = this.itemDto.person?.filter((people) => {
      return people.type === FinPersonType.Director
    })?.map((person) => {
      return person.name
    })?.join(",")
    this.authors = this.itemDto.person?.filter((people) => {
      return people.type === FinPersonType.Writer
    })?.map((people) => {
      return people.name
    }).join(",")
  }

  build() {
    Column({space: CommonConstants.SPACE_12}) {

      Text(this.itemDto.name)
        .fontSize($r('sys.float.Title_M'))

      if (this.itemDto.productionYear || this.itemDto.runtimeTicks
        || this.itemDto.officialRating || this.itemDto.communityRating) {
        Row({space: CommonConstants.SPACE_8}) {

          if (this.itemDto.productionYear) {
            Text(this.itemDto.productionYear.toString())
          }

          if (this.itemDto.runtimeTicks) {
            Text(Math.round(((this.itemDto.runtimeTicks) / 60000)) + "min")
          }

          if (this.itemDto.officialRating) {
            Text(this.itemDto.officialRating)
          }

          if (this.itemDto.communityRating) {
            Text(this.itemDto.communityRating.toString())
          }
        }
      }

      if (this.itemDto.type === FinItemType.Movie) {
        DetailOperate({
          itemDto: this.itemDto
        })
      }

      Text(this.itemDto.overview)

      if (this.genres) {
        Row({space: CommonConstants.SPACE_8}) {
          Text("风格")
          Text(this.genres)
        }
      }

      if (this.actors) {
        Row({space: CommonConstants.SPACE_8}) {
          Text("导演")
          Text(this.actors)
        }
      }

      if (this.authors) {
        Row({space: CommonConstants.SPACE_8}) {
          Text("作者")
          Text(this.authors)
        }
      }
    }
    .padding({
      left: ResponsiveLayout.pagePadding(this.currentWidthBreakpoint),
      right: ResponsiveLayout.pagePadding(this.currentWidthBreakpoint)
    })
    .alignItems(HorizontalAlign.Start)
    .width(CommonConstants.FULL_PERCENT)
  }

  aboutToDisappear(): void {

  }

}

@Component
export struct DetailFooter {

  @Require itemDto?: FinItem

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  private personDataSource: LazyDataSource<FinPerson> = new LazyDataSource();

  aboutToAppear(): void {
    if (this.itemDto?.person) {
      this.personDataSource.appendArrayData(this.itemDto.person)
    }
  }

  build() {
    Column({space: CommonConstants.SPACE_12}) {
      Text("演职人员")
        .fontSize($r('sys.float.Title_S'))
        .margin({
          left: ResponsiveLayout.pagePadding(this.currentWidthBreakpoint)
        })

      List({space: CommonConstants.SPACE_12}) {
        LazyForEach(this.personDataSource, (person: FinPerson, index) => {
          ListItem() {
            PersonItem({item: person})
          }
        })
      }
      .contentStartOffset(ResponsiveLayout.pagePadding(this.currentWidthBreakpoint))
      .contentEndOffset(ResponsiveLayout.pagePadding(this.currentWidthBreakpoint))
      .listDirection(Axis.Horizontal)
      .width(CommonConstants.FULL_PERCENT)
      .scrollBar(BarState.Off)
      .height(ResponsiveLayout.isCompact(this.currentWidthBreakpoint) ? 220 : 250)
    }
    .alignItems(HorizontalAlign.Start)
  }

  aboutToDisappear(): void {

  }

}

@Reusable
@Component
struct PersonItem {

  @StorageLink("Repository") repository?: Repository = undefined

  @Require @State item?: FinPerson = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as FinPerson
  }

  private itemWidth(): number {
    if (ResponsiveLayout.isCompact(this.currentWidthBreakpoint)) {
      return 120
    }
    if (ResponsiveLayout.isMedium(this.currentWidthBreakpoint)) {
      return 136
    }
    return 152
  }

  build() {
    Column() {
      Image(this.item?.image?.primary)
        .alt($r('app.media.alt'))
        .borderRadius($r('app.float.lg_border_radius'))
        .objectFit(ImageFit.Cover)
        .autoResize(true)
        .width(this.itemWidth())
        .height(Math.round(this.itemWidth() * 1.5))
      Text(this.item?.name)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .height(20)
      Text(this.item?.role)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .height(20)
    }
    .alignItems(HorizontalAlign.Start)
    .width(this.itemWidth())
    .height(Math.round(this.itemWidth() * 1.5) + 40)
  }

}
