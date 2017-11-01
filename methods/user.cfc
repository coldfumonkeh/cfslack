/**
* User component to interact with Slack user methods
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
	* Get a user's identity. This method may only be used by tokens with the identity.basic scope, as provided in the Sign in with Slack process.
	*/
	public function getUserIdentity(
		boolean deserialize    = false
	){
		return makeRequest(
			url         = 'users.identity',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Gets information about a user
	* @user User to get info on
	* @include_locale Set this to true to receive the locale for this user. Defaults to false
	*/
	public function getUserInfo(
		required string user,
		boolean include_locale = false,
		boolean deserialize    = false
	){
		return makeRequest(
			url         = 'users.info',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Lists all users in a Slack team
	* @cursor Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first "page" of the collection. See pagination for more detail.
	* @include_locale Set this to true to receive the locale for users. Defaults to false
	* @limit The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached. Defaults to 0
	* @presence Whether to include presence data in the output. Setting this to false improves performance, especially with large teams.
	* @deserialize 
	*/
	public function getUserList(
		string cursor,
		boolean include_locale = false,
		numeric limit          = 0,
		boolean presence       = false,
		boolean deserialize    = false
	){
		return makeRequest(
			url         = 'users.list',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}


	/**
	* Gets user presence information
	* @user User to get presence info on. Defaults to the authed user.
	* @deserialize 
	*/
	public function getUserPresence(
		string user,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'users.getPresence',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Manually sets user presence
	* @presence Either auto or away
	* @deserialize 
	*/
	public function setUserPresence(
		required string presence,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'users.setPresence',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* Retrieves a user's profile information
	* @include_labels Include labels for each ID in custom profile fields
	* @user User to retrieve profile info for
	*/
	public function getUserProfile(
		boolean include_labels = false,
		string user,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'users.profile.get',
			params      = arguments,
			deserialize = arguments.deserialize
		);	
	}


	/**
	* Set the profile information for a user
	* @include_labels Include labels for each ID in custom profile fields
	* @user User to retrieve profile info for
	*/
	public function setUserProfile(
		string name,
		string value,
		string profile,
		string user,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'users.profile.set',
			method      = 'POST',
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
