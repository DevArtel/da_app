# da_app

- [Project structure](docs/project_structure.md)
- [Continuous integration](docs/ci.md)

1. Run `./init.sh`. It will install all the required tools ([fvm](https://fvm.app/), [task](https://taskfile.dev/), [gh cli](https://cli.github.com/)) and run all the preparations to start the project.
2. Find and replace all the entries of `YF7VY6LB6A.io.devartel.daApp` to your iOS bundle id and `io.devartel.da_app` to your Android package name. 
3. Rename `.github/.env.example` to `.github/.env`. It contains all the environment variables that you need to build and publish the app locally and on CI. To push this env to CI run `task gh-set-secrets`. It will push these variable to GitHub Secrets.

That's it! Now you are ready to implement you first feature. [This guide](docs/feature.md) is your entry point!

### Launch the app

We use `flutterw` and `dartw` wrappers to work with Flutter and Dart. They check if you have FVM on your workstation
and use it if presented, or they use system versions if not.

The app supports flavors and has two flavors out of the box: `staging` and `prod`. 
You must specify a build flavor to run the app.
- If you run the app with CLI, pass it to the command like this: `./flutterw run --flavor staging`.
- If you use VS Code, follow [this manual](https://pub.dev/packages/signals) to set up a launch configuration.
- If you use Android Studio or Intellij Idea:
    - Find "Edit configurations..." menu
    - Chose a configuration you want to launch
    - Set required flavor in "Build flavor" property.
