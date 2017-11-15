/**
* Chat component to interact with Slack dnd (Do Not Disturb) methods
*/
component accessors="true" extends="base" {

	property name="clientID" 			type="string";
	property name="clientSecret" 		type="string";
	property name="verificationToken"	type="string";
	property name="accessToken"			type="string";
	property name="botAccessToken"		type="string";
	property name="baseURL"				type="string";


	/**
	* Init constructor
	* @clientID the client id
	* @clientSecret the client secret
	* @verificationToken The verification token
	* @accessToken the access token
	* @botAccessToken the bot access token
	* @baseURL the base URL for the requests
	*/
	public function init(
		string clientID,
		string clientSecret,
		string verificationToken,
		string accessToken,
		string botAccessToken,
		string baseURL
	){
		setClientID( arguments.clientID );
		setClientSecret( arguments.clientSecret );
		setVerificationToken( arguments.verificationToken );
		setAccessToken( arguments.accessToken );
		setBotAccessToken( arguments.botAccessToken );
		setBaseURL( arguments.baseURL );
		return this;
	}

	/**
	* Ends the current user's Do Not Disturb session immediately.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function endDnd(
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'dnd.endDnd',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Ends the current user's snooze mode immediately.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function endSnooze(
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'dnd.endSnooze',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Retrieves a user's current Do Not Disturb status.
	* @user User to fetch status for (defaults to current user)
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function info(
		string user = '',
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'dnd.info',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Turns on Do Not Disturb mode for the current user, or changes its duration.
	* @num_minutes Number of minutes, from now, to snooze until
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function setSnooze(
		required numeric num_minutes,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'dnd.setSnooze',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Retrieves the Do Not Disturb status for users on a team.
	* @users Optional comma-separated list of users to fetch Do Not Disturb status for
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function teamInfo(
		string users = '',
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'dnd.teamInfo',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}


	/**
	* Returns the properties as a struct
	*/
	public struct function getMemento(){
		return super.getMemento();
	}

}
