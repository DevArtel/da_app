# Creating new feature

There is a simple `Counter` feature presented in the project. It uses **Riverpod** for state management and demonstrates separation of layers. So for now you can copy and paste the whole `counter` directory, rename it and all it's components to correspond a feature you're implementing.

The diagram bellow demonstrates dependencies direction between app layers. Each inner layer interacts only with corresponding next outer layer.
![[layers.png]]

## Model

**Model** contains operations on data. It implements Repository pattern and consists of two sub-layers:
1. **Data Stores** provide access to data in different stores, like database, in-memory storage or remote storage.
2. **Repository** is a facade for operations on data from underlying Data Stores.

Model layer must be pure Dart without any Flutter specific dependencies. An exception may be data received from the OS.

In terms of Model, a regular feature consists of the following components:
1. Remote Data Store. It usually serves interaction with HTTP API.
2. Local Data Store. It can be either in memory storage to cache data, or SQL or NoSQL database to persist data.
3. Repository providing a common interface for Data Stores.

### Naming convention

**Repository** should always operate on **Models** (like `UserModel`). Models are domain level entities. In a simple application it can be enough to use only Models on all the levels. However if you want to implement data persisting with normalization, mapping of remote data or any other mutating operations on data, it's recommended to follow a convention:
1. **Local Data Stores** work with **Entities** (like `UserEntity`).
2. **Remote Data Stores** work with **Dtos** (like `UserDto`).

## Presentation

Let's go to **Presentation** layer. **Presentation** layer contains **Controllers** which operate on **Repositories**, i.e. implement state management. We use Riverpod for state management. If you're not familiar with it's concepts yet, take a look [at official documentation](https://riverpod.dev/).

Riverpod provides both data binding tools and DI. So this is the level where we provide dependencies from the lower levels.

In Controllers prefer providing dependencies via constructor and defining them in Providers.

Since redrawing the entire screen is highly undesirable, prefer creating Controllers for smaller components: if you have a list of entities that a user can like, and you need to implement the "like" function, consider implementing a `LikeController` working in pair with `LikeButton` rather than having a super-controller for the whole page.

## User Interface

**UI** is all the app widgets. It obtains data to render from **Controllers** and uses **Controllers** to mutate the data.

We follow Atomic design concepts. If you're not familiar with it, read about it [here](https://bradfrost.com/blog/post/atomic-web-design/).

An application UI is like a Lego constructor which is built from smaller blocks. All these blocks make up a design system. This design system lives in a separate module called `ui_kit`. It's separated as it's used in the application module and in storybook. Storybook is a gallery of UI components which is handy for communication with designers and for sharing knowledge about design system with a team when the storybook is well organized.

So when you start working on new screen, first take a look at the `ui_kit` and check if it contains required components. If it doesn't, follow these steps:
1. Create a component in `ui_kit`.
2. Create a `WidgetbookComponent` in `storybook` package and either include it to a relevant `WidgetbookFolder` or create a new one.
3. Use the component from `ui_kit` in application module in a corresponding features `page.dart` file.

Steps 1 and 2 may need to be completed multiple times. After each iteration, make sure that the level of atomicity is sufficient.
