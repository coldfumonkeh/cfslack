/**
* Channel component to interact with Slack channel methods
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
	* This method archives a channel.
	* @channel The channel to archive
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function archiveChannel(
		required string channel,
		boolean deserialize = false
	){
		return makeRequest( 
			url         = 'channels.archive',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method is used to create a channel.
	* @name Name of channel to create.
	* @validate Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function createChannel(
		required string name,
		boolean validate    = true,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.create',
			method      = 'POST',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method returns a portion of message events from the specified channel. To read the entire history for a channel, call the method with no latest or oldest arguments, and then continue paging using the instructions below. To retrieve a single message, specify its ts value as latest, set inclusive to true, and dial your count down to 1.
	* @channel Channel to fetch history for.
	* @latest End of time range of messages to include in results.
	* @oldest Start of time range of messages to include in results.
	* @inclusive Include messages with latest or oldest timestamp in results.
	* @count Number of messages to return, between 1 and 1000.
	* @unreads Include unread_count_display in the output?
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function getChannelHistory(
		required string channel,
		string latest,
		string oldest,
		numeric inclusive   = 0,
		numeric count       = 100,
		boolean unreads     = true,
		boolean deserialize = false
	){
		return super.makeRequest(
			url         = 'channels.history',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method returns information about a team channel.
	* @channel Channel to get info on
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function getChannelInfo(
		required string channel,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.info',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method is used to invite a user to a channel. The calling user must be a member of the channel.
	* @channel Channel to get info on
	* @user User to invite to channel.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function inviteToChannel(
		required string channel,
		required string user,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.invite',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method is used to join a channel. If the channel does not exist, it is created.
	* @name Name of channel to create.
	* @validate Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function joinChannel(
		required string name,
		boolean validate    = true,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.join',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method allows a user to remove another member from a team channel.
	* @channel Channel to remove user from.
	* @user User to invite to channel.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function kickFromChannel(
		required string channel,
		required string user,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.kick',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}

	/**
	* This method is used to leave a channel.
	* @channel Channel to leave
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function leaveChannel(
		required string channel,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.leave',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method returns a list of all channels in the team. This includes channels the caller is in, channels they are not currently in, and archived channels but does not include private channels. The number of (non-deactivated) members in each channel is also returned.
	* @exclude_archived Don't return archived channels.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function getChannelList(
		boolean exclude_archived = false,
		boolean deserialize      = false
	){
		return makeRequest(
			url         = 'channels.list',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method moves the read cursor in a channel.
	* @channel Channel to mark
	* @ts Timestamp of the most recently seen message.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function markChannel(
		required string channel,
		required string ts,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.mark',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method renames a team channel.
	* @channel Channel to rename
	* @name New name for channel
	* @validate Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function renameChannel(
		required string channel,
		required string name,
		boolean validate    = true,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.rename',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method returns an entire thread (a message plus all the messages in reply to it).
	* @channel Channel to fetch thread from
	* @thread_ts Unique identifier of a thread's parent message
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function getChannelReplies(
		required string channel,
		required string thread_ts,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.replies',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method is used to change the purpose of a channel. The calling user must be a member of the channel.
	* @channel Channel to set the purpose of
	* @purpose The new purpose
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function setChannelPurpose(
		required string channel,
		required string purpose,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.setPurpose',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method is used to change the topic of a channel. The calling user must be a member of the channel.
	* @channel Channel to set the topic of
	* @topic The new topic
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function setChannelTopic(
		required string channel,
		required string topic,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.setTopic',
			params      = arguments,
			deserialize = arguments.deserialize
		);
	}
	
	/**
	* This method unarchives a channel. The calling user is added to the channel.
	* @channel Channel to unarchive
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	public function unarchiveChannel(
		required string channel,
		boolean deserialize = false
	){
		return makeRequest(
			url         = 'channels.unarchive',
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
