# da_app

- [Project structure](docs/project_structure.md)
- [Continuous integration](docs/ci.md)

1. Run `./init.sh`. It will install all the required tools ([fvm](https://fvm.app/), [task](https://taskfile.dev/), [gh cli](https://cli.github.com/)) and run all the preparations to start the project.
2. Find and replace all the entries of `YF7VY6LB6A.io.devartel.daApp` to your iOS bundle id and `io.devartel.da_app` to your Android package name. 
3. Rename `.github/.env.example` to `.github/.env`. It contains all the environment variables that you need to build and publish the app locally and on CI. To push this env to CI run `task gh-set-secrets`. It will push these variable to GitHub Secrets.

That's it! Now you are ready to implement you first feature. [This guide](docs/feature.md) is your entry point!

### Troubleshooting

- If analyze fails during project initialization, try to run `./init.sh` once again.