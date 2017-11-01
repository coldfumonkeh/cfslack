/**
* Chat component to interact with Slack chat methods
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
	* This method deletes a message from a channel.
		When used with a typical user token, may only delete messages posted by that user.
		When used with an admin user's user token, may delete most messages posted in a workspace.
		When used with a bot user's token, may delete only messages posted by that bot user.
	* @channel Channel containing the message to be deleted
	* @ts Timestamp of the message to be deleted
	* @as_user Pass true to delete the message as the authed user. Bot users in this context are considered authed users.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function deleteChat(
		required string channel,
		required string ts,
		boolean as_user     = false,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'chat.delete',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}


	/**
	* Share a me message into a channel.
	* @channel Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name.
	* @text Text of the message to send.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function meMessage(
		required string channel,
		required string text,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'chat.meMessage',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method posts a message to a public channel, private channel, or direct message/IM channel.
	* @channel Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name.
	* @text Text of the message to send.
	* @parse Change how messages are treated. Defaults to none.
	* @link_names Find and link channel names and usernames.
	* @attachments Structured message attachments.
	* @unfurl_links Pass true to enable unfurling of primarily text-based content.
	* @unfurl_media Pass false to disable unfurling of media content.
	* @username Set your bot's user name. Must be used in conjunction with as_user set to false, otherwise ignored.
	* @as_user Pass true to post the message as the authed user, instead of as a bot. Defaults to false.
	* @icon_url URL to an image to use as the icon for this message. Must be used in conjunction with as_user set to false, otherwise ignored.
	* @icon_emoji Emoji to use as the icon for this message. Overrides icon_url. Must be used in conjunction with as_user set to false, otherwise ignored.
	* @thread_ts Provide another message's ts value to make this message a reply. Avoid using a reply's ts value; use its parent instead.
	* @reply_broadcast Used in conjunction with thread_ts and indicates whether reply should be made visible to everyone in the channel or conversation. Defaults to false.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function postMessage(
		required string channel,
		required string text,
		string parse            = 'none',
		boolean link_names      = true,
		string attachments,
		boolean unfurl_links    = false,
		boolean unfurl_media    = true,
		string username,
		boolean as_user         = false,
		string icon_url,
		string icon_emoji,
		string thread_ts,
		boolean reply_broadcast = false,
		boolean deserialize     = false
	){
		return makeRequest(
			url         = 'chat.postMessage',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	

	/**
	* Sends an ephemeral message to a user in a channel
	* @channel Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name
	* @text Text of the message to send. See below for an explanation of formatting. This field is usually required, unless you're providing only attachments instead.
	* @user id of the user who will receive the ephemeral message. The user should be in the channel specified by the channel argument.
	* @as_user Pass true to post the message as the authed bot. Defaults to false.
	* @attachments A JSON-based array of structured attachments, presented as a URL-encoded string.
	* @link_names Find and link channel names and usernames.
	* @parse Change how messages are treated. Defaults to none.
	* @deserialize 
	*/
	public function postEphemeral(
		required string channel,
		required string text,
		required string user,
		boolean as_user         = false,
		string attachments,
		boolean link_names      = true,
		string parse            = 'none',
		boolean deserialize     = false
	){
		return makeRequest(
			url         = 'chat.postEphemeral',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}


	/**
	* Provide custom unfurl behavior for user-posted URLs
	*/
	public function unfurl(){ // TODO:

	}


	/**
	* Updates a message
	*/
	public function updateMessage(
		required string channel,
		required string text,
		required string ts,
		boolean as_user         = false,
		string attachments,
		boolean link_names      = true,
		string parse            = 'none',
		boolean deserialize     = false
	){
		return makeRequest(
			url         = 'chat.update',
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
