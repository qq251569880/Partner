

class PtnNoBodyPDU :PtnPDU
{
	override init(){
		super.init();
	}
	init(url:String){
		super.init();
		requestUrl = url;
	}
}
