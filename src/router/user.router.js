const Router = require("koa-router");

// Controller逻辑操作中间件
const UrController = require("../controller/user.controller");

// 功能中间件
const verifyUser = require("../middleware/user.verify");

const userRouter = new Router({ prefix: "/users" });


// verifyUser,
userRouter.post('/', verifyUser, UrController.create);
// 展示头像
userRouter.get('/:userId/avatar',UrController.avatarInfo);

module.exports = userRouter; 