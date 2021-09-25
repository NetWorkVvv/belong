const ERROR_TYPE = require("../error/error.type");

const service = require("../service/user.service");
const md5Password = require("../tools/password.md5");

// 验证用户注册的账户和密码
const verifyUser = async function (ctx, next) {
  const { username, password } = ctx.request.body;
  // 判断用户注册的用户名或者密码是否为空 有长度则true
  if (!username || !password) {
    const error = new Error(ERROR_TYPE.NAME_OR_PASSWORD_IS_NULL);
    return ctx.app.emit("err", error, ctx);
  }
  // 判断注册的用户名是否重复
  const checkUserName = await service.checkUserByName(username);
  if (checkUserName.length) {
    const error = new Error(ERROR_TYPE.USER_NAME_IS_REPETITION);
    return ctx.app.emit("err", error, ctx);
  }

  // password 加密 => password不能使用明文的形式 
  // 先把body内的password取出
  // 经过md5Password()加密处理在返回给body的password
  ctx.request.body.password = md5Password(password);
  await next();
};

module.exports = verifyUser;