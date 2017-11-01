/**
* Permissions component to interact with Slack permissions methods
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
	* Returns list of permissions this app has on a team.
	*/
	public function getAppPermissionsInfo( boolean deserialize = false ){
		return makeRequest(
			url         = 'apps.permissions.info',
			deserialize = arguments.deserialize
		);
	}

	/**
	* Allows an app to request additional scopes
	*/
	public function appPermissionsRequest( boolean deserialize = false ){
		return makeRequest(
			url         = 'apps.permissions.request',
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
