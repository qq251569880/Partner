import JSONJoy
struct QueryBody: JSONJoy{
	var numfound:Int?;
	var start:Int?;
	var list:JSONDecoder?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        numfound = decoder["numfound"].integer
        start = decoder["start"].integer
        if let num = numfound {
			if(num > 0){
				list = decoder["list"]
			}
        }
	}	
}
struct ActiveInfo: JSONJoy
{
    var activeId:String?
    var creatorId:String?
    var title:String?
    var type:String?
    var state:String?
    var placeId:String?
    var maxMember:String?
    var introduce:String?
    var createTime:String?
    var startTime:String?
    var endTime:String?
    var member:String?
    var inmember:String?
    var joined:String?
    var partiState:String?
    var partiResult:String?
    var creatorName:String?
    var creatorAvatar:String?
    var country:String?
    var province:String?
    var city:String?
    var area:String?
    var address:String?
    var latitude:String?
    var longitude:String?
    var id:Int?
    init() {

    }
    init(_ decoder: JSONDecoder) {
        activeId = decoder["activeid"].string
        creatorId = decoder["creatorid"].string
        title = decoder["title"].string
        type = decoder["type"].string
        state = decoder["state"].string
        placeId = decoder["placeid"].string
        maxMember = decoder["maxmember"].string
        introduce = decoder["introduce"].string
        createTime = decoder["createtime"].string
        startTime = decoder["starttime"].string
        endTime = decoder["endtime"].string
        member = decoder["member"].string
        inmember = decoder["inmember"].string
        joined = decoder["joined"].string
        partiState = decoder["partistate"].string
        partiResult = decoder["partiresult"].string
        creatorName = decoder["creatorname"].string
        creatorAvatar = decoder["creatoravatar"].string
        country = decoder["country"].string
        province = decoder["province"].string
        city = decoder["city"].string
        area = decoder["area"].string
        address = decoder["address"].string
        latitude = decoder["latitude"].string
        longitude = decoder["longitude"].string
        id = decoder["id"].integer
    }

}
struct ActivePlace
{
    var placeId:String?
    var country:String?
    var province:String?
    var city:String?
    var area:String?
    var address:String?
    var latitude:String?
    var longitude:String?
    var introduce:String?
    var picture:String?
    var price:String?
    var createTime:String?
    var updateTime:String?
    var creator:String?
    var adminName:String?
    var adminMobile:String?
    var state:String?
    var id:Int?
}
struct ActiveUser
{
    var activeId:String?
    var userId:String?
    var state:String?
    var stateTime:String?
    var joinGroup:String?
    var joinMessage:String?
    var joinNumber:String?
    var result:String?
    var id:Int?
}
struct ChatMessage
{
    var messageId:String?
    var activeId:String?
    var userId:String?
    var messageType:String?
    var content:String?
    var path:String?
    var sendTime:String?
    var id:Int?
}
struct Comment
{
    var commentId:String?
    var messageId:String?
    var userId:String?
    var content:String?
    var praise:String?
    var commentTime:String?
    var id:Int?
}
struct LoginSession
{
    var sessionId:String?
    var userId:String?
    var createTime:String?
    var updateTime:String?
    var userType:String?
    var deviceType:String?
    var id:Int?
}
struct UserInfo
{
    var userId:String?
    var mobile:String?
    var email:String?
    var nickName:String?
    var birth:String?
    var sex:String?
    var avatar:String?
    var password:String?
    var country:String?
    var province:String?
    var city:String?
    var address:String?
    var favor:String?
    var introduce:String?
    var registerTime:String?
    var updateTime:String?
    var id:Int?
}
struct VerifyCode
{
    var verifyId:String?
    var username:String?
    var vcode:String?
    var createTime:String?
    var used:String?
    var id:Int?
    var action:String?
}
