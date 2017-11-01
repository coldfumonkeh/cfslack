/**
* Base component to interact with Slack API.
*/
component accessors="true" {

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
	* I make the request to the API
	* @url The URL to make the request to
	* @params An optional struct of params to send through in the request
	* @method The HTTP method to use for the request. Defaults to 'GET'
	* @deserialize Boolean value whether or not the response is returned as raw JSON or CF struct. Defaults to false.
	*/
	package function makeRequest(
		required string url,
		struct params       = {},
		string method       = 'GET',
		boolean deserialize = false
	){	
		var strURL = prepParams(
			url    = getBaseURL() & arguments.url,
			params = arguments.params
		);
		var httpService = new http( method=arguments.method, url=strURL );
		httpService.addParam( name="Content-Type", type="header", value='application/json' );
		var result = httpService.send().getPrefix();
		return ( arguments.deserialize ) ? deserializeJSON( result.fileContent ) : result.fileContent;
	}
	
	/**
	* I prepare the parameters for the request
	* @url The URL used for the request
	* @params The struct of parameters
	*/
	package function prepParams(
		required string url,
		required struct params
	){
		var strURL  = arguments.url & '?token=' & getAccessToken();
		var sParams = structCopy( arguments.params );
			structDelete( sParams, 'deserialize' );
		var intTotalParams = structCount( sParams );
		if( intTotalParams ){
			var intCount = 1;
			strURL = strURL & '&';
			for( var param in sParams ){
				if( structKeyExists( sParams, param ) ){
					strURL = strURL & param & '=' & sParams[param];
					if( intCount < intTotalParams ){
						strURL = strURL & '&';
					}
				}
				intCount = intCount+1;
			}
		}
		return strURL;
	}

	/**
	* Returns the properties as a struct
	*/
	package struct function getMemento(){
		var result = {};
		for( var thisProp in getMetaData( this ).properties ){
			if( structKeyExists( variables, thisProp[ 'name' ] ) ){
				result[ thisProp[ 'name' ] ] = variables[ thisProp[ 'name' ] ];
			}
		}
		return result;
	}

}