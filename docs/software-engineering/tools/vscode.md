# Visual Studio Code/Codium


# Notes for Codium

## Extensions not loading

1. Find your binary location: `which codium`
2. Navigate to that directory and search for a file called `product.json` which should be in `./resources/app/` relative to the root of the application directory (the binary should be in `./bin`)
3. Search for `"extensionsGallery"` and replace the URLs as follows:

```json
"extensionsGallery": {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items"
}
```
