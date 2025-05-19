const { app, BrowserWindow } = require('electron');
const path = require('path');
const { spawn } = require('child_process');
const http = require('http');

let flaskProcess;
let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1000,
    height: 800,
    webPreferences: {
      contextIsolation: true
    }
  });

  mainWindow.loadURL('http://localhost:5000');
}

function startFlask() {
  flaskProcess = spawn('python', ['api_flask/app.py'], {
    cwd: path.join(__dirname, '..'),
    shell: true,
    env: process.env
  });

  flaskProcess.stdout.on('data', (data) => {
    console.log(`Flask: ${data}`);
  });

  flaskProcess.stderr.on('data', (data) => {
    console.error(`Flask Error: ${data}`);
  });

  flaskProcess.on('close', (code) => {
    console.log(`Flask se cerró con código: ${code}`);
  });
}

function waitForFlaskAndLaunch() {
  const tryConnect = () => {
    http.get('http://localhost:5000', () => {
      console.log('✅ Flask está listo. Lanzando ventana...');
      createWindow();
    }).on('error', () => {
      console.log('⏳ Esperando a que Flask arranque...');
      setTimeout(tryConnect, 1000);
    });
  };
  tryConnect();
}

app.whenReady().then(() => {
  startFlask();
  waitForFlaskAndLaunch();

  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', function () {
  if (flaskProcess) flaskProcess.kill();
  if (process.platform !== 'darwin') app.quit();
});
