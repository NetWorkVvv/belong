
const jwt = require("jsonwebtoken");

const userService = require("../service/user.service");
const authorService = require("../service/author.service")
const ERROR_TYPE = require("../error/error.type");
const md5Password = require("../tools/password.md5");
const { PUBLIC_KEY } = require("../app/config");

const LoginVerify = async function (ctx, next) {
  console.log("登录验证的LoginVerify");
  // 获取用户名和密码
  const { loginName, loginPassword } = ctx.request.body;

  // 判断用户名和密码是否为空
  if (!loginName || !loginPassword) {
    const error = new Error(ERROR_TYPE.NAME_OR_PASSWORD_IS_NULL);
    return ctx.app.emit("err", error, ctx);
  }
  // 判断用户名是否存在
  // userService返回的数据存储在Array中 [{}]... 故[0]=>{}
  const checkLoginName = await userService.checkUserByName(loginName);
  const resultLogin = checkLoginName[0]
  if (!resultLogin) {
    const error = new Error(ERROR_TYPE.LOGIN_NAME_OR_PASSWORD_IS_FALSE);
    return ctx.app.emit("err", error, ctx);
  }
  // 判断用户输入的密码是否正确 
  // 把 tools 内的加密函数导入 加密登录密码和数据库的密码匹配 => 等同解密
  if (md5Password(loginPassword) !== resultLogin.password) {
    const error = new Error(ERROR_TYPE.THE_PASSWORD_IS_NOT_CORRECT);
    return ctx.app.emit("err", error, ctx);
  }

  // 在ctx中添加对象和value
  ctx.user = resultLogin;
  
  await next();
}
// token验证
const AuthorVerify = async function (ctx, next) {
  console.log("授权验证的AuthorVerify");
  // 获取token
  const authorization = ctx.headers.authorization;
  // authorization为空时 说明 没有token且用户未登录  因为token是用户登录后授予的
  if (!authorization) {
    const error = new Error(ERROR_TYPE.USER_NOT_LOGIN_NOT_TOKEN);
    return ctx.app.emit("err", error, ctx);
  }
  const token = authorization.replace("Bearer ", "");

  try {
    const result = jwt.verify(token, PUBLIC_KEY, {
      algorithms: ["RS256"],
    })
    // 把用户的信息保存到 ctx.user中
    ctx.user = result;
    await next();
  } catch (err) {
    const error = new Error(ERROR_TYPE.UN_AUTHORIZATION_USER);
    return ctx.app.emit("err", error, ctx);
  }
}

// 检查用户的权限
const LicenseVerify = async function (ctx, next) {
  console.log("权限验证的LicenseVerify" , ctx.user.id ,ctx.user.name)
  // 获取参数 {commentId : 1} => replace 替换Id
  // console.log(ctx.params)
  const [tableKey] = Object.keys(ctx.params)
  const tableName = tableKey.replace('Id', '')
  const tableId = ctx.params[tableKey]
  const userId = ctx.user.id

  try {
    const isLicense = await authorService.checkLicense(tableName, tableId, userId)
    // isLicense 查询不到数据 长度 = 0 说明 moment.id 和 moment.user_id 不匹配
    if (isLicense) throw new Error()
    await next()
  } catch (err) {
    const error = new Error(ERROR_TYPE.UN_AUTHORIZATION_LiCENSE);
    return ctx.app.emit("err", error, ctx);
  }
}

module.exports = { LoginVerify, AuthorVerify, LicenseVerify };
// module.exports = { LoginVerify };