
enum MessageType {
  SYSTEM,
  PUBLIC,
  CHAT,
  GROUP,
}

class MessageData {
  //头像
  String avatar;
  //主标题
  String title;
  //子标题
  String subTitle;
  //消息时间
  DateTime time;
  //消息类型
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

List<MessageData> messageData = [

  new MessageData(
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
    '一休哥',
    '草你妈的',
    new DateTime.now(),
    MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403282649&di=c4f237332e6bf94546c950817699c2fd&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H0128_PHr4z.jpeg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),
  new MessageData(
      'http://img.pconline.com.cn/images/upload/upc/tx/photoblog/1306/25/c5/22553405_1372148630253_mthumb.jpg',
      '一休哥',
      '草你妈的',
      new DateTime.now(),
      MessageType.CHAT
  ),

];