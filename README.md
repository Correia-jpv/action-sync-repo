# action-sync-repo
A GitHub Action for synchronizing the current repository with remote non-github repo

## Inputs
### `src_repo`
**Required** Complete URL of non-github repository to pull

### `dest_repo`
**Required** Name of github repo to sync

### `dest_branch`
**Optional** Name of branch to sync. Default `"main"`

## Get a GitHub Personal Access Token

Make sure to enable the `repo` scope and all subscopes inside of that permission.

[How to get your GitHub PAT](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

## Example workflow
```
name: Sync repo

on:
  schedule:
    - cron: "*/6 * * * *"

jobs:
  sync:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Sync repository
      uses: Correia-jpv/action-sync-repo@main
      env:
            SECRET_TOKEN: ${{ secrets.PAT }}
      with:
        src_repo: 'https://correia-jpv/action-sync-repo.git'
        dest_repo: correia-jpv/my_repository
        dest_branch: 'main'

```
