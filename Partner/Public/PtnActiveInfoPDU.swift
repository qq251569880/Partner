

class PtnActiveInfoQueryPDU :PtnPDU
{
	var queryBody:PtnQueryBody?
	var activeInfo:Array<ActiveInfo>?
	override init(){
		super.init();
	}
	init(url:String){
		super.init();
        activeInfo = [];
		requestUrl = url;
	}
	//继承类实现该函数
	override func decodeReturnBody(){
		queryBody = PtnQueryBody(responseJson!.body!);
		if let lists = queryBody!.list!.array {
            for activeinfo in lists {
                activeInfo!.append(ActiveInfo(activeinfo));
            }
		}
		delegate?.reloadTable();
	}
}