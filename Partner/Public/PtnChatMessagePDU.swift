
class PtnChatMessagePDU :PtnPDU
{
	var queryBody:PtnQueryBody?
	var chatMsg:Array<ChatMessage>?
	override init(){
		super.init();
	}
	init(url:String){
		super.init();
        chatMsg = [];
		requestUrl = url;
	}
	//继承类实现该函数
	override func decodeReturnBody(){
		queryBody = PtnQueryBody(responseJson!.body!);
        if let list = queryBody!.list{
            if let lists = list.array {
                for chat in lists {
                    chatMsg!.append(ChatMessage(chat));
                }
            }
        }
		delegate?.reloadTable();
	}
}