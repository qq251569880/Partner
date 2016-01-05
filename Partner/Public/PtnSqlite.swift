import Foundation
//http://www.hangge.com/blog/cache/detail_645.html
class PtnSqlite {
    static var db:SQLiteDB?
    init(){
        
    }
    static func getDb()-> SQLiteDB {
        if db == nil {
            db = SQLiteDB.sharedInstance();
        }
        assert(db != nil,"init database failed");
        return db!;
    }
    static func createChatTable(){
        PtnSqlite.getDb().execute("DROP TABLE t_chat");
        PtnSqlite.getDb().execute("create table if not exists t_chat( id bigint(20) PRIMARY KEY, message_id char(32), active_id char(32) ,user_id char(32) , message_type enum('text','voice','picture','video','bin') , content text, file_data blob , send_time varchar(20) ) DEFAULT CHARSET=utf8");
    }
    static func getLastChat(activeid:String) -> ChatMessage? {
        let data = PtnSqlite.getDb().query("select * from t_chat where active_id = \(activeid) order by id desc limit 0,1");
        if data.count > 0{
            let msg = data[0];
            var chatMsg = ChatMessage();
            chatMsg.id = msg["id"] as? Int;
            chatMsg.messageId = msg["message_id"] as? String;
            chatMsg.activeId = msg["active_id"] as? String;
            chatMsg.userId = msg["user_id"] as? String;
            chatMsg.messageType = msg["message_type"] as? String;
            chatMsg.content = msg["content"] as? String;
            chatMsg.fileData = msg["path"] as? NSData;
            chatMsg.sendTime = msg["send_time"] as? String;
            return chatMsg;
        }else{
            return nil;
        }
    }
    static func getLastMsg(activeid:String) -> String? {
        if let msg = PtnSqlite.getLastChat(activeid) {
            if let type = msg.messageType{
                switch type {
                    case "text":
                        return msg.content;
                    case "voice":
                        return "[语音消息]";
                    case "picture":
                        return "[图片消息]";
                    case "video":
                        return "[视频消息]";
                    case "bin":
                        return "[文件]"
                    default:
                        break;
                }
            }
        }
        return nil;
    }
    static func updateMsg(){
        
    }
}