component accessors="true" extends="methods.base"{
	
	// https://api.slack.com/methods

	property name="bot" type="any";
	property name="channel" type="any";
	property name="chat" type="any";
	property name="dialog" type="any";
	property name="emoji" type="any";
	property name="permissions" type="any";
	property name="team" type="any";
	property name="user" type="any";
	
	/**
	* Init constructor
	* @clientID the client id
	* @clientSecret the client secret
	* @verificationToken The verification token
	* @accessToken the access token
	* @botAccessToken the bot access token
	* @baseURL the base URL for the requests
	*/
	public Slack function init(
		string clientID          = '',
		string clientSecret      = '',
		string verificationToken = '',
		string accessToken       = '',
		string botAccessToken    = '',
		string baseURL           = 'https://slack.com/api/'
	){
		setBot( new methods.bot( argumentCollection = arguments ) );
		setChannel( new methods.channel( argumentCollection = arguments ) );
		setChat( new methods.chat( argumentCollection = arguments ) );
		setDialog( new methods.dialog( argumentCollection = arguments ) );
		setEmoji( new methods.emoji( argumentCollection = arguments ) );
		setPermissions( new methods.permissions( argumentCollection = arguments ) );
		setTeam( new methods.team( argumentCollection = arguments ) );
		setUser( new methods.user( argumentCollection = arguments ) );

		super.init( argumentCollection = arguments );

		return this;
	}


	/**
	* The official test method from the Slack API
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function test( boolean deserialize = false ){
		return makeRequest(
			url         = 'api.test',
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