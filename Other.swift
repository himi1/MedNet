class Other {
	var userId: Int64?
    var firstName: String?
    var middleName: String?
    var lastName: String?
	var phone: Int64?
	var email: Array<String> = Array() 
	var connectedTo: Array<String> = Array()
	
	init (userId: Int64) {
        self.userId = userId
    }
}
