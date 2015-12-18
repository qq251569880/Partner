import JSONJoy


enum ParaType{
	case String
	case File
	case Array
}

struct Parameter{
	var type:ParaType?;
	var name:String?;
	
	var value:String?;
	var path:String?;
	var array:Array<String>?;
	init(){
	}
}

struct PtnJsonErr:JSONJoy{
	var errorcode:Int?
	var description:String?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        errorcode=decoder["errorcode"].integer;
        description=decoder["description"].string;
    }
}
struct PtnJsonParam:JSONJoy{
	var paramDic:Dictionary<String,String>?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        
        decoder.getDictionary(&paramDic)
    }
}
struct PtnJsonHead:JSONJoy{
	var status:Int?;
	var error:PtnJsonErr?
	var params:PtnJsonParam?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        status=decoder["status"].integer;
        if(status == 0){
			params = PtnJsonParam(decoder["params"])
        }else{
			error = PtnJsonErr(decoder["error"])
        }
        
    }
}

struct PtnJson:JSONJoy{
	var head:PtnJsonHead?
	var body:JSONDecoder?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        head=PtnJsonHead(decoder["head"]);
        body=decoder["body"];
    }
}
protocol PduDelegate{
	func reloadTable()
}
class PtnPDU
{
	var requestUrl:String?;
	var accessToken:String?;
	var requestMethod = "POST";
	var parameterList:[Parameter];
	
	var responseData:NSData?;
	var responseJson:PtnJson?;
	var delegate:PduDelegate?
	init(){
        parameterList = [];
	}
	func setUrl(url:String)
	{
		requestUrl = url;
	}
	func setToken(token:String)
	{
		accessToken = token;
	}
	func setStringParameter(name:String,value:String)
	{
		var para:Parameter = Parameter();
		para.name=name;
		para.value=value;
		para.type = .String;
		parameterList.append(para);
	}
	func setFileParameter(name:String,path:String)
	{
		var para:Parameter = Parameter();
		para.name=name;
		para.path=path;//路径名
		para.type = .File;
		parameterList.append(para);
	}
	func setArrayParameter(name:String,array:Array<String>)
	{
		var para:Parameter = Parameter();
		para.name=name;
		para.type = .Array;
		para.array = array;
		parameterList.append(para);
	}
	func clearParameter()
	{
		
	}
	func unsetParameter(name:String)
	{
		
	}
	
	func requestHttp()
	{
		do {
			if(requestMethod == "POST"){
                var params:Dictionary<String,AnyObject> = [:];
				for param in parameterList{
					if(param.type == .File){
						let url = NSURL(fileURLWithPath: param.path!)
						params.updateValue(Upload(fileUrl: url), forKey:param.name!)  
					}else if(param.type == .Array){
						params.updateValue(param.array!, forKey:param.name!)
					}else{
						params.updateValue(param.value!, forKey:param.name!)
					}
				}
				
				let opt = try HTTP.POST(requestUrl!, parameters: params)
				opt.start { response in
					if let error = response.error {
						print("response got an error: \(error)")
						
					}
                    
                    self.decodeResponse(JSONDecoder(response.data))
				}
			}
		} catch let error {
			print("catch got an error: \(error)")
		}		
		
	}
	func decodeResponse(decoder: JSONDecoder){
		
		responseJson = PtnJson(decoder);
		//解析响应，获得status
		if let statu = responseJson!.head!.status {
			if( statu == 0){
				decodeReturnBody();
			}else{
				print("server returned err ");
			}
		}else{
			print("decode json failed ");
		}
	}

	//由继承类实现该函数
	func decodeReturnBody(){
	}
}