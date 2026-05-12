@Entry
@Component
struct Index {
  @State inputText: string = '5 1 4 2 3';
  @State outputText: string = '1 2 3 4 5';
  @State errorText: string = '';
  @State sortDescending: boolean = false;

  private parseInput(text: string): number[] {
    const cleaned = text.trim();
    if (cleaned.length === 0) {
      throw new Error('Please enter at least one number.');
    }

    const tokens = cleaned.split(/[\s,]+/);
    const numbers: number[] = [];
    for (let index = 0; index < tokens.length; index++) {
      const value = Number(tokens[index]);
      if (Number.isNaN(value)) {
        throw new Error(`Invalid number: ${tokens[index]}`);
      }
      numbers.push(value);
    }
    return numbers;
  }

  private mergeSort(values: number[]): number[] {
    if (values.length < 2) {
      return values.slice();
    }

    const middle = Math.floor(values.length / 2);
    const left = this.mergeSort(values.slice(0, middle));
    const right = this.mergeSort(values.slice(middle));
    return this.merge(left, right);
  }

  private merge(left: number[], right: number[]): number[] {
    const result: number[] = [];
    let leftIndex = 0;
    let rightIndex = 0;

    while (leftIndex < left.length && rightIndex < right.length) {
      if (left[leftIndex] <= right[rightIndex]) {
        result.push(left[leftIndex]);
        leftIndex++;
      } else {
        result.push(right[rightIndex]);
        rightIndex++;
      }
    }

    return result.concat(left.slice(leftIndex)).concat(right.slice(rightIndex));
  }

  private runSort(): void {
    try {
      const numbers = this.parseInput(this.inputText);
      const sortedNumbers = this.mergeSort(numbers);
      // The selected direction is applied after merge sort so the core algorithm stays stable.
      if (this.sortDescending) {
        sortedNumbers.reverse();
      }
      this.outputText = sortedNumbers.join(' ');
      this.errorText = '';
    } catch (error) {
      this.outputText = '';
      this.errorText = error instanceof Error ? error.message : 'Unable to sort the input.';
    }
  }

  private toggleSortDirection(): void {
    this.sortDescending = !this.sortDescending;
    if (this.errorText.length === 0 && this.outputText.length > 0) {
      this.runSort();
    }
  }

  build() {
    Column({ space: 22 }) {
      Column({ space: 8 }) {
        Text('Stdio Sorter')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A2540')
        Text('Type numbers as input, then read the sorted output.')
          .fontSize(15)
          .fontColor('#52616B')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .margin({ top: 28 })

      Column({ space: 14 }) {
        Text('Input')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#0A2540')
          .width('100%')

        TextInput({ text: this.inputText, placeholder: 'Example: 8 3 5 1 9' })
          .height(52)
          .fontSize(17)
          .backgroundColor('#F6F8FA')
          .borderRadius(14)
          .padding({ left: 16, right: 16 })
          .onChange((value: string) => {
            this.inputText = value;
          })

        Row({ space: 10 }) {
          Text('Order')
            .fontSize(16)
            .fontColor('#52616B')

          Button(this.sortDescending ? 'Descending' : 'Ascending')
            .height(38)
            .fontSize(15)
            .fontColor(Color.White)
            .backgroundColor(this.sortDescending ? '#7B2CBF' : '#0B5CAD')
            .borderRadius(12)
            .onClick(() => {
              this.toggleSortDirection();
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Button('Sort Numbers')
          .width('100%')
          .height(48)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
          .backgroundColor('#0B5CAD')
          .borderRadius(14)
          .onClick(() => {
            this.runSort();
          })
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(22)
      .shadow({ radius: 14, color: '#140B5CAD', offsetX: 0, offsetY: 8 })

      Column({ space: 12 }) {
        Text('Output')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#0A2540')
          .width('100%')

        if (this.errorText.length > 0) {
          Text(this.errorText)
            .fontSize(16)
            .fontColor('#C62828')
            .width('100%')
            .padding(16)
            .backgroundColor('#FFEBEE')
            .borderRadius(14)
        } else {
          Text(this.outputText)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#102A43')
            .width('100%')
            .padding(16)
            .backgroundColor('#E8F5E9')
            .borderRadius(14)
        }
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(22)
      .shadow({ radius: 14, color: '#140B5CAD', offsetX: 0, offsetY: 8 })

      Text('Separators: spaces, commas, or line breaks.')
        .fontSize(13)
        .fontColor('#8293A3')
        .textAlign(TextAlign.Center)
        .width('100%')

      Blank()
    }
    .width('100%')
    .height('100%')
    .padding({ left: 22, right: 22 })
    .backgroundColor('#EEF6FF')
  }
}
