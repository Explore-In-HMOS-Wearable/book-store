export const BASE_URL = 'https://www.' + getContext(this).resourceManager.getStringSync($r('app.string.name').id) +
getContext(this).resourceManager.getStringSync($r('app.string.baseurl').id);

export const url = 'https://www.' + getContext(this).resourceManager.getStringSync($r('app.string.name').id) +
getContext(this).resourceManager.getStringSync($r('app.string.url').id);
