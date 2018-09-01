## Foodsharing iOS

A proof of concept foodhsaring client written in swift.

### Requirements

- OSX 10.13.6
- Xcode 9.4.1
- Swift 4.1.2

### Installation

```shell
git clone git@github.com:theolampert/foodsharing-ios.git
cd foodsharing-ios
carthage update
```

Open Xcode and load your built binaries from `/Carthage` into the project. Right now the application requires the foodsharing backend running locally due to some changes to the REST API, I intend to merge these upstream.

```
### UI

The UI layout is done entirely programmatically using 'PinLayout' and 'FlexLayout' which are abstractions ontop of Facebook's yoga layout library.
Storyboards and nib files are excluded completely.
```
