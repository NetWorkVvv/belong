const service = require('../service/label.service');

class LabelController {
  async createLabel(ctx, next) {
    const { labelName } = ctx.request.body;
    const result = await service.createLabelService(labelName);
    ctx.body = result;
  }

  async listLabel(ctx, next) {
    const { offset, limit } = ctx.query
    const result = await service.listLabelService(offset, limit)
    ctx.body = result
  }
}

module.exports = new LabelController();