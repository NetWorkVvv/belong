const ERROR_TYPE = require("./error.type")

const ERROR_TIP = (error, ctx) => {
  // error.message = new Error("用户名或者密码不能为空~")
  let status, message;
  switch (error.message) {
    case ERROR_TYPE.NAME_OR_PASSWORD_IS_NULL:
      status = 400;// Bad Request
      message = "用户名或者密码不能为空";
      break;
    case ERROR_TYPE.USER_NAME_IS_REPETITION:
      status = 409;// Conflict
      message = "注册失败用户名已存在";
      break;
    case ERROR_TYPE.LOGIN_NAME_OR_PASSWORD_IS_FALSE:
      status = 400;// Bad Request
      message = "登录失败用户名不存在";
      break;
    case ERROR_TYPE.THE_PASSWORD_IS_NOT_CORRECT:
      status = 400;// Bad Request
      message = "用户登录密码输入错误";
      break;
    case ERROR_TYPE.UN_AUTHORIZATION_USER:
      status = 401;// Bad Request
      message = "登录用户未授权";
      break;
    case ERROR_TYPE.USER_NOT_LOGIN_NOT_TOKEN:
      status = 401;// Bad Request
      message = "用户未登录";
      break;
    case ERROR_TYPE.UN_AUTHORIZATION_LiCENSE:
      status = 401;// Bad Request
      message = "该用户无权限修改其他用户信息";
      break;
    case ERROR_TYPE.LABEL_NO_EXISTS:
      status = 404;// Bad Request
      message = "该标签不存在,请创建标签再添加动态标签";
      break; 
    default:
      status = 404;
      message = "NOT FOUND WEB";
  }
  ctx.status = status;
  ctx.body = message;
};
module.exports = ERROR_TIP;