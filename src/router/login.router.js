const Router = require("koa-router");

// 控制中间件
const LnController = require("../controller/login.controller");
// 验证/处理中间件
const VyMiddleware = require("../middleware/login.verify");

const loginRouter = new Router({ prefix: "/login" });
// 路由
loginRouter.post('/', VyMiddleware.LoginVerify, LnController.LoginUser);
loginRouter.get('/test', VyMiddleware.AuthorVerify, LnController.AuthorUser);
// 获取单个用户信息
loginRouter.get('/:userId/info', LnController.UserShowDetailInfo)
// 获取用户信息列表
loginRouter.get('/info', LnController.UserShowListInfo)

module.exports = loginRouter;