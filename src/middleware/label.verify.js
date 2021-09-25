const service = require("../service/label.service")
const ERROR_TYPE = require("../error/error.tip")

// 检查是否存在标签, 存在拿标签,不存在创造标签
const LabelExistsVerify = async (ctx, next) => {
  const { labels } = ctx.request.body;
  const newLabels = [];
  try {
    // 通过for...of 把查询到的数据遍历
    for (let labelName of labels) {
      // labelResult 是Array
      const labelResult = await service.checkLabelService(labelName);
      // console.log(labelResult)
      // Array 遍历出来 => 存在{Obj}
      const label = { labelName }
      if (!labelResult) {
        // 标签不存在就创建标签
        const create = await service.createLabelService(labelName);
        // 把插入数据时的insertId赋予
        label.id = create.insertId;
      } else {
        // 如果标签存在 则把标签的id 赋值给label.id
        label.id = labelResult.id;
      }
      newLabels.push(label);
    }
    ctx.labels = newLabels;
    await next();
  } catch (e) {
    console.log("LABEL_VERIFY_ERROR_在这之后报错")
    ctx.body = "标签获取失败"
  }
}
module.exports = { LabelExistsVerify };