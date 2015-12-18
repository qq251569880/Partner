

class PtnCreateResultPDU :PtnPDU
{
	var createBody:PtnCreateBody?
	override init(){
		super.init();
	}
	init(url:String){
		super.init();
		requestUrl = url;
	}
	//继承类实现该函数
	override func decodeReturnBody(){
		createBody = PtnCreateBody(responseJson!.body!);
	}
}
