const path = require('path');
const term = require( 'terminal-kit' ).terminal;
const git = require('isomorphic-git');
const Downloader = require("nodejs-file-downloader");
const http = require('isomorphic-git/http/node');
const os = require('os');
const fs = require("fs");
const platform = os.platform()
class Alpaca {
  constructor(root) {
    this.root = root
    this.home = path.resolve(this.root.home, "alpaca")
    //this.url = "https://github.com/candywrap/alpaca.cpp.git"
    this.url = "https://github.com/ItsPi3141/alpaca.cpp"
  }
  async make() {
    let success
    if (platform === "win32") {
      // CMake on Windows
      const venv_path = path.join(this.root.home, "venv")
      const cmake_path = path.join(venv_path, "Scripts", "cmake")
      await this.root.exec("mkdir build", this.home)      
      await this.root.exec(`Remove-Item -path ${path.resolve(this.home, "build", "CMakeCache.txt")}`, this.home)

      let PS_COUNTER = 0
      await this.root.exec(`${cmake_path} ..`, path.resolve(this.home, "build"), (proc, data) => {
        console.log("#", data);
        if (/^PS .*/.test(data)) {
          PS_COUNTER++;
          if (PS_COUNTER >= 2) {
            console.log("KILL")
            proc.kill()
          }
        }
      })
      PS_COUNTER = 0;
      await this.root.exec(`${cmake_path} --build . --config Release`, path.resolve(this.home, "build"), (proc, data) => {
        console.log("#", data);
        if (/^PS .*/.test(data)) {
          PS_COUNTER++;
          if (PS_COUNTER >= 2) {
            console.log("KILL2")
            proc.kill()
          }
        }
      })
    } else {
      // Make on linux + mac
      success = await this.root.exec(`make`, this.home)
      if (!success) {
        throw new Error("running 'make' failed")
      }
    }
  }
}
