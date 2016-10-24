'use strict';
const electron      = require('electron');
const app           = electron.app;
const BrowserWindow = electron.BrowserWindow;
const fs            = require('fs');

let mainWindow;
function createWindow () {
    mainWindow = new BrowserWindow({width: 800, height: 600});
    mainWindow.loadURL('file://' + __dirname + '/views/layouts/index.html');
    mainWindow.webContents.openDevTools();
    mainWindow.on('closed', function () {
        mainWindow = null;
    });
}

app.on('ready', createWindow);

app.on('window-all-closed', function () {
    if (process.platform !== 'darwin') {
        app.quit();
    }
})
console.log(mainWindow)
