after getting the cypress.zip file \
.... and uploading it in alexsch01/cypress-custom releases...

-- in some cypress project directory
```cmd
set CYPRESS_DOWNLOAD_PATH_TEMPLATE=https://github.com/alexsch01/cypress-custom/releases/download/v${version}-${platform}-${arch}/cypress.zip
npx cypress install --force
npx cypress open
```
