
// md5 加密 

// Node模块内有自带的 md5 加密
const crypto = require("crypto");

const md5Password = function (password) {
  const md5 = crypto.createHash("md5");
  // md5 加密 密码 且 返回的形式是16进制
  const resPassword = md5.update(password).digest("hex");
  return resPassword;
};

module.exports = md5Password;