const fs = require('fs');
const path = require('path');

const initFilePath = function(month, filePath) {
  const thePath = path.join(filePath, month, "auto");
  console.log("⏩ output file will save to ", thePath);
  fs.mkdir(thePath, {
    recursive: true
  }, function(error) {
    if (error) {
      throw "😬 error initialising filepath" + error;
    }
  });
  return thePath;
}

const saveFile = function(contents, fileName) {
  fs.writeFile(fileName + "", contents, function(err) {
    if (err) {
      console.log(err);
      return false;
    }
    console.log('💾 saved data to ' + fileName);
    return true;
  });
}

module.exports = {
  initFilePath: initFilePath,
  saveFile: saveFile
};
