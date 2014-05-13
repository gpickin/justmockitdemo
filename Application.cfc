component output="false"
{
	
	this.name = "Website_" & cgi.server_name;
 	this.applicationTimeout = createTimeSpan(0,1,0,0);
    this.clientmanagement= "yes";
    this.loginstorage = "session" ;
    this.sessionmanagement = "yes";
    this.sessiontimeout = createTimeSpan(0,0,20,0);
    this.setClientCookies = "yes";
    this.setDomainCookies = "no";
    this.datasource = "whoswho";
       
	/**
	 * @hint The application first starts: the first request for a page is processed or the first CFC method is invoked by an event gateway instance, or a web services or Flash Remoting CFC.
	 */
	public boolean function onApplicationStart(){

		getMockDAOs();

		return true;
	}

	/**
	 * @hint The application ends: the application times out, or the server is stopped
	 */
	public void function onApplicationEnd(ApplicationScope){

	}

	/**
	 * @hint A request starts
	 */
	public boolean function onRequestStart(String targetPage){

		if ( structKeyExists(url, "resetApp") ) {
			getMockDAOs();
		}
		return true;
	}

	/**
	 * @hint All pages in the request have been processed:
	 */
	public void function onRequestEnd(String targetPage){

	}

	/**
	 * @hint A session starts
	 */
	public void function onSessionStart(){

	}

	/**
	 * @hint A session ends
	 */
	public void function onSessionEnd(SessionScope,ApplicationScope){

	}

	/**
	 * @hint ColdFusion received a request for a non-existent page.
	 */
	/*public boolean function onMissingTemplate(String targetPage) {

		return true;
	}*/

	/**
	 * @hint An exception that is not caught by a try/catch block occurs.
	 */
	/*public void function onError(Exception,EventName) {

	}*/

	/**
	 * @hint Handles missing method exceptions
	 */
	public void function onMissingMethod(String method,Struct args) {

	}

	/**
	 * @hint HTTP or AMF calls are made to an application.
	 */
	/*public void function onCFCRequest(String cfcname,String method,Struct args){

	}*/

	private void function getMockDAOs() {
		
		application.mockbox 	= new testbox.system.testing.MockBox();
		application.statusDAO 	= application.mockbox.createStub();
		
		mockQuery1 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			11|	4	|What are you doing here?|2014-04-24 18:32:23|NULL|10th|Doctor|10thdoctor.jpg
			10|	4	|Nice to meet you, Rose, run for yer life!|2014-04-24 18:31:22|NULL|10th|Doctor|10thdoctor.jpg
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			8|	4	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|NULL|10th|Doctor|10thdoctor.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
			
		mockQuery2 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			12|	2	|I live here|2014-04-24 18:32:32|NULL|Rose|Tyler|rose.jpg
			11|	4	|What are you doing here?|2014-04-24 18:32:23|NULL|10th|Doctor|10thdoctor.jpg
			10|	4	|Nice to meet you, Rose, run for yer life!|2014-04-24 18:31:22|NULL|10th|Doctor|10thdoctor.jpg
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			8|	4	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|NULL|10th|Doctor|10thdoctor.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
			
		mockQuery3 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			13|	4	|Well, what you go and do a thing like that for?|2014-04-24 18:32:39|NULL|10th|Doctor|10thdoctor.jpg
			12|	2	|I live here|2014-04-24 18:32:32|NULL|Rose|Tyler|rose.jpg
			11|	4	|What are you doing here?|2014-04-24 18:32:23|NULL|10th|Doctor|10thdoctor.jpg
			10|	4	|Nice to meet you, Rose, run for yer life!|2014-04-24 18:31:22|NULL|10th|Doctor|10thdoctor.jpg
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			8|	4	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|NULL|10th|Doctor|10thdoctor.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
			
		mockQuery4 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			14|	3	|Everywhere we go, two words, following us: 'Bad Wolf.'|2014-04-24 18:41:34|NULL|9th|Doctor|9thdoctor.jpg
			13|	4	|Well, what you go and do a thing like that for?|2014-04-24 18:32:39|NULL|10th|Doctor|10thdoctor.jpg
			12|	2	|I live here|2014-04-24 18:32:32|NULL|Rose|Tyler|rose.jpg
			11|	4	|What are you doing here?|2014-04-24 18:32:23|NULL|10th|Doctor|10thdoctor.jpg
			10|	4	|Nice to meet you, Rose, run for yer life!|2014-04-24 18:31:22|NULL|10th|Doctor|10thdoctor.jpg
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			8|	4	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|NULL|10th|Doctor|10thdoctor.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");			
			
		mockQuery2_1 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
		mockQuery2_2 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
		mockQuery2_3 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			12|	2	|I live here|2014-04-24 18:32:32|NULL|Rose|Tyler|rose.jpg
			9|	2	|Rose|2014-04-24 18:31:01|NULL|Rose|Tyler|rose.jpg
			3|	2	|Somethings are worth getting your heart broken for|2014-04-09 10:36:36|NULL|Rose|Tyler|rose.jpg
			2|	2	|Bad Wolf|2014-04-09 10:36:22|NULL|Rose|Tyler|rose.jpg
			1|	2	|Bad Wolf Bay|2014-04-09 10:36:14|NULL|Rose|Tyler|rose.jpg");
		
		
			
		mockQuery3_1 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			14|	3	|Everywhere we go, two words, following us: 'Bad Wolf.'|2014-04-24 18:41:34|NULL|9th|Doctor|9thdoctor.jpg");
			
		mockQuery4_1 = application.mockbox.querySim("statusid,userid,message,createdat,urlid,firstName,lastName,photo
			13|	4	|Well, what you go and do a thing like that for?|2014-04-24 18:32:39|NULL|10th|Doctor|10thdoctor.jpg
			11|	4	|What are you doing here?|2014-04-24 18:32:23|NULL|10th|Doctor|10thdoctor.jpg
			10|	4	|Nice to meet you, Rose, run for yer life!|2014-04-24 18:31:22|NULL|10th|Doctor|10thdoctor.jpg
			8|	4	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|NULL|10th|Doctor|10thdoctor.jpg");		
			
			
		
		application.statusDAO.$("getStatuses").$args("-1").$results(mockQuery1, mockQuery2, mockQuery3, mockQuery4);
		application.statusDAO.$("getStatuses").$args("2").$results(mockQuery2_1, mockQuery2_2, mockQuery2_3);
		application.statusDAO.$("getStatuses").$args("3").$results(mockQuery3_1);
		application.statusDAO.$("getStatuses").$args("4").$results(mockQuery4_1);
		
		// insertStatus( userid, formstruct);
		application.statusDAO.$("insertStatus").$results(1);
		
		
		
		application.userDAO 	= application.mockbox.createStub();
		
		//getUserByLogin()
		mockQueryRose = application.mockbox.querySim("id, email, deletedat
			2|rose@wohswho.com|");
		mockQueryBadLogin = application.mockBox.querySim("id, email, deletedat");
		application.userDAO.$("getUserByLogin").$args("rose@whoswho.com", "rose").$results(mockQueryRose);
		application.userDAO.$("getUserByLogin").$args("gavin@whoswho.com", "gavin").$results(mockQueryBadLogin);	
		
		// getUser();
		mockQueryUser2 = application.mockbox.querySim("id,urlid,firstName,lastName,email,birthdate,gender,about,photo,createdat,deletedat
		2|NULL|Rose|Tyler|rose@whoswho.com|NULL|NULL||rose.jpg|2014-04-09 10:09:22|NULL");
		mockQueryUser3 = application.mockbox.querySim("id,urlid,firstName,lastName,email,birthdate,gender,about,photo,createdat,deletedat
		3|NULL|9th|Doctor|9thDoctor@whoswho.com|NULL|NULL||9thdoctor.jpg|2014-04-09 10:09:22|NULL");
		mockQueryUser4 = application.mockbox.querySim("id,urlid,firstName,lastName,email,birthdate,gender,about,photo,createdat,deletedat
		3|NULL|10th|Doctor|10thDoctor@whoswho.com|NULL|NULL||10thdoctor.jpg|2014-04-09 10:09:22|NULL");
		
		application.userDAO.$("getUser").$args(2).$results(mockQueryUser2);
		application.userDAO.$("getUser").$args(3).$results(mockQueryUser3);
		application.userDAO.$("getUser").$args(4).$results(mockQueryUser4);
		
		
		// getUsersWithStatus() 
		mockQuery1 = application.mockbox.querySim("statusid,message,createdat,userid,urlid,firstName,lastName,photo
		14	|Everywhere we go, two words, following us: 'Bad Wolf.'|2014-04-24 18:41:34|3|NULL|9th|Doctor|9thdoctor.jpg
		8	|I'm the Doctor, by the way, What's your name?|2014-04-24 18:30:55|4|NULL|10th|Doctor|10thdoctor.jpg
		1	|Bad Wolf Bay|2014-04-09 10:36:14|2|NULL|Rose|Tyler|rose.jpg
		NULL|||5|NULL|11th|Doctor|11thdoctor.jpg
		NULL|||10|NULL|Martha|Jones|martha.jpg
		NULL|||8|NULL|Amy|Pond|amy.jpg
		NULL|||6|NULL|Mickey|Smith|mickey.jpg
		NULL|||7|NULL|River|Song|riversong.jpg
		NULL|||9|NULL|Rory|Williams|rory.jpg");
		application.userDAO.$("getUsersWithStatus").$results(mockQuery1);
		
		// insertUser()
		
		
		
		
	}


	
}