

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
	//�̳���ʵ�ָú���
	override func decodeReturnBody(){
		createBody = PtnCreateBody(responseJson!.body!);
	}
}
