const Koa = require("koa");
const parser = require("koa-bodyparser")

const useRoutes = require("../router/aUse")

const ERROR_TIP = require("../error/error.tip");

const app = new Koa();

/* 相当于
 app.useRoutes =  function () {
  fs.readdirSync(__dirname).forEach(file => {
    if (file === 'aUse.js') return;
    const router = require(`./${file}`);
    this.use(router.routes());
    this.use(router.allowedMethods());
  })
}
 */
// 导入方法
app.useRoutes = useRoutes;

// 注册中间件 使用第三方库把JSON序列号为对象
app.use(parser());
// 自动注册路由中间件
app.useRoutes()

// ERROR_TIP = ("err" , error , ctx)
app.on("err", ERROR_TIP);
// app.on("err1",ERROR_TIP);
module.exports = app;