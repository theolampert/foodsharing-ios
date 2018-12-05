## Foodsharing iOS

Foodsharing iOS client written in [Swift](https://en.wikipedia.org/wiki/Swift_(programming_language)).

### Requirements

- OSX 10.14
- Xcode 10.1
- Swift 4.2.1
- Carthage

### Installation

```shell
git clone git@gitlab.com:foodsharing-dev/foodsharing-ios.git
cd foodsharing-ios
carthage update --platform iOS
```

Open Xcode and load your built binaries from `/Carthage` into the project.

#### Setting up a backend

You have two choices here, either run a local version of the foodsharing backend and update `Constants/Constant.swift` or work directly with either beta: `beta.foodsharing.de` or production `foodsharing.de` and update accordingly.

### UI

The UI layout is done entirely programmatically using Apple's AutoLayout. Storyboards and nib files are excluded completely.
