/**
* Chat component to interact with Slack rtm (Real Time Messaging) methods
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
	* Returns a WebSocket Message Server URL and limited information about the team
	* @token Authentication token bearing required scopes. Can be botAccessToken or user accessToken (if the user has the rtm:stream scope)
	* @batch_presence_aware Only deliver presence events when requested by subscription. Defaults to false
	*/
	public function rtmConnect(
		required string token,
		boolean batch_presence_aware = false,
		boolean deserialize          = false
	){
		var httpService = new http( method='POST', url=getBaseURL() & 'rtm.connect' );
		httpService.addParam( name="Content-Type", type="header", value='application/x-www-form-urlencoded' );
		httpService.addParam( name="token", type="formField", value=arguments.token );
		httpService.addParam( name="batch_presence_aware", type="formField", value=arguments.token );
		var result = httpService.send().getPrefix();
		return ( arguments.deserialize ) ? deserializeJSON( result.fileContent ) : result.fileContent;
	}

	/**
	* Returns the properties as a struct
	*/
	public struct function getMemento(){
		return super.getMemento();
	}

}
