// 动态注册中间件
const fs = require("fs");
// 普通函数
const useRoutes = function () {
  // 读取文件信息
  fs.readdirSync(__dirname).forEach(file => {
    // 不要其读取自身aUse.js文件
    if (file === 'aUse.js') return;
    // 导出
    const router = require(`./${file}`);
    // 注册
    this.use(router.routes());
    this.use(router.allowedMethods());
  })
}
// 箭头函数 匿名函数 不会自动绑定this
/*
const useRoutes = () => {
  // 读取文件夹内的文件名字 并存储Array数据格式
  fs.readdirSync(__dirname).forEach(file => {
    if (file === 'use.js') return;
    // 导入文件
    const router = require(`./${file}`);
    // 注册路由中间件
    app.use(router.routes());
    // 检测是否支持method? 请求方式
    app.use(router.allowedMethods());
  })
}
 */

module.exports = useRoutes;