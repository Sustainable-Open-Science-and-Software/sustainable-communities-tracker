const headers = require("./fake_header")

module.exports = {
    page: {
      data: new Array(16)
    },
    data: new Array(100),
    headers: headers(2)
}
