

class PtnActiveInfoQueryPDU :PtnPDU
{
	var queryBody:QueryBody?
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
		queryBody = QueryBody(responseJson!.body!);
		if let lists = queryBody!.list!.array {
            for activeinfo in lists {
                activeInfo!.append(ActiveInfo(activeinfo));
            }
		}
		delegate?.reloadTable();
	}
}