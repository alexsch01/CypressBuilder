cd %TEMP%

curl -LO https://github.com/git-for-windows/git/releases/download/v2.45.1.windows.1/Git-2.45.1-64-bit.exe
Git-2.45.1-64-bit.exe /verysilent /PathOption=Cmd /Components="ext,ext\shellhere,ext\guihere,gitlfs,assoc,assoc_sh,scalar"

curl -LO https://nodejs.org/dist/v16.16.0/node-v16.16.0-x64.msi
node-v16.16.0-x64.msi /quiet

curl -LO https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe
python-3.10.11-amd64.exe /quiet

curl -LO https://aka.ms/vs/15/release/vs_buildtools.exe
vs_buildtools.exe --quiet --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --wait


set "PATH=%PATH%;C:\Program Files\Git\cmd;C:\Program Files\Git\usr\bin;C:\Program Files\nodejs;%LOCALAPPDATA%\Programs\Python\Python310;C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;%APPDATA%\npm"
CALL npm i -g yarn node-gyp@8.4.1
cd C:\
git clone https://github.com/alexsch01/cypress-custom --branch v12.6.0 --single-branch Cypress-Source
cd Cypress-Source

CALL yarn install
echo RUN: yarn install - COMPLETE

CALL yarn binary-build --version 12.6.0
echo COMMAND: binary-build - COMPLETE

CALL yarn build-v8-snapshot-prod
echo COMMAND: build-v8-snapshot-prod - COMPLETE

cp .\packages\electron\dist\Cypress\browser_v8_context_snapshot.bin .\build\build\win-unpacked
cp -r .\build\build\win-unpacked Cypress
tar -a -c -f cypress.zip Cypress
mv cypress.zip C:\GitHubActionsRoot\cypress.zip
