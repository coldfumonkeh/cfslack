component extends='testbox.system.BaseSpec'{
	
	/*********************************** BDD SUITES ***********************************/
	
	function beforeAll(){

		include 'slack.properties.cfm';

		clientID 			= variables.slackInfo[ 'clientID' ];
		clientSecret 		= variables.slackInfo[ 'clientSecret' ];
		verificationToken 	= variables.slackInfo[ 'verificationToken' ];
		accessToken			= variables.slackInfo[ 'accessToken' ];
		botAccessToken		= variables.slackInfo[ 'botAccessToken' ];

		oSlack = new slack(
			clientID 			= clientID,
			clientSecret 		= clientSecret,
			verificationToken 	= verificationToken,
			accessToken			= accessToken,
			botAccessToken		= botAccessToken
		);

		oBot         = oSlack.getBot();
		oChannel     = oSlack.getChannel();
		oChat        = oSlack.getChat();
		oDialog      = oSlack.getDialog();
		oEmoji       = oSlack.getEmoji();
		oPermissions = oSlack.getPermissions();
		oTeam        = oSlack.getTeam();
		oUser        = oSlack.getUser();
	}


	function run(){

		describe( 'Slack Component Suite', function(){
			
			it( 'should return the correct object', function(){

				expect( oSlack ).toBeInstanceOf( 'slack' );
				expect( oSlack ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oSlack.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 8 );

				expect( sMemento ).toHaveKey( 'bot' );
				expect( sMemento ).toHaveKey( 'channel' );
				expect( sMemento ).toHaveKey( 'chat' );
				expect( sMemento ).toHaveKey( 'dialog' );
				expect( sMemento ).toHaveKey( 'emoji' );
				expect( sMemento ).toHaveKey( 'permissions' );
				expect( sMemento ).toHaveKey( 'team' );
				expect( sMemento ).toHaveKey( 'user' );

				expect( sMemento[ 'bot' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'channel' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'chat' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'dialog' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'emoji' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'permissions' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'team' ] )
					.toBeTypeOf( 'component' );
				expect( sMemento[ 'user' ] )
					.toBeTypeOf( 'component' );

			} );

			it( 'should have the correct methods', function() {

				makePublic( oSlack, 'prepParams', 'makeRequest' );
				makePublic( oSlack, 'prepParams', 'prepParams' );

				expect( oSlack ).toHaveKey( 'init' );
				expect( oSlack ).toHaveKey( 'test' );
				expect( oSlack ).toHaveKey( 'getBot' );
				expect( oSlack ).toHaveKey( 'getChannel' );
				expect( oSlack ).toHaveKey( 'getChat' );
				expect( oSlack ).toHaveKey( 'getDialog' );
				expect( oSlack ).toHaveKey( 'getEmoji' );
				expect( oSlack ).toHaveKey( 'getPermissions' );
				expect( oSlack ).toHaveKey( 'getTeam' );
				expect( oSlack ).toHaveKey( 'getUser' );
				expect( oSlack ).toHaveKey( 'getClientID' );
				expect( oSlack ).toHaveKey( 'getClientSecret' );
				expect( oSlack ).toHaveKey( 'getVerificationToken' );
				expect( oSlack ).toHaveKey( 'getAccessToken' );
				expect( oSlack ).toHaveKey( 'getBotAccessToken' );
				expect( oSlack ).toHaveKey( 'getBaseURL' );
				expect( oSlack ).toHaveKey( 'getMemento' );

			} );


			it( 'should return a struct for the test method call', function(){

				var response = oSlack.test();

				expect( response )
					.toBeString();

				var response = oSlack.test( deserialize = true );

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'args' );

			} );


			it( 'should return a struct of properties for getMemento', function(){

				var sData = oSlack.getMemento();

				expect( sData )
					.toBeStruct()
					.toHaveLength( 8 )
					.toHaveKey( 'bot' )
					.toHaveKey( 'channel' )
					.toHaveKey( 'chat' )
					.toHaveKey( 'dialog' )
					.toHaveKey( 'emoji' )
					.toHaveKey( 'permissions' )
					.toHaveKey( 'team' )
					.toHaveKey( 'user' );

			} );


			it( 'should return a string when calling prepParams method', function(){

				makePublic( oSlack, 'prepParams', 'prepParams' );

				var response = oSlack.prepParams(
					url    = 'chat.postMessage',
					params = {
						'channel'   : 'ABCDEFG',
						'text'      : 'Test message',
						'link_names': true
					}
				);

				expect( response )
					.toBeString()
					.toBe( 'chat.postMessage?token=#accessToken#&link_names=true&text=Test message&channel=ABCDEFG' );


				var response = oSlack.prepParams(
					url    = 'chat.postMessage',
					params = {}
				);

				expect( response )
					.toBeString()
					.toBe( 'chat.postMessage?token=#accessToken#' );

			} );

		});


		describe( 'Bot component', function(){

			it( 'should return the correct object', function(){

				expect( oBot ).toBeInstanceOf( 'methods.bot' );
				expect( oBot ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oBot.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oBot ).toHaveKey( 'init' );
				expect( oBot ).toHaveKey( 'getBotInfo' );
				expect( oBot ).toHaveKey( 'getMemento' );

			} );


			it( 'should return bot info', function(){

				var response = oBot.getBotInfo( deserialize = true );

				expect( response )
					.toBeStruct();

			} );

		} );


		describe( 'Channel component', function(){

			it( 'should return the correct object', function(){

				expect( oChannel ).toBeInstanceOf( 'methods.channel' );
				expect( oChannel ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oChannel.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oChannel ).toHaveKey( 'init' );
				expect( oChannel ).toHaveKey( 'archiveChannel' );
				expect( oChannel ).toHaveKey( 'createChannel' );
				expect( oChannel ).toHaveKey( 'getChannelInfo' );
				expect( oChannel ).toHaveKey( 'leaveChannel' );
				expect( oChannel ).toHaveKey( 'getChannelList' );
				expect( oChannel ).toHaveKey( 'markChannel' );
				expect( oChannel ).toHaveKey( 'renameChannel' );
				expect( oChannel ).toHaveKey( 'getChannelReplies' );
				expect( oChannel ).toHaveKey( 'setChannelPurpose' );
				expect( oChannel ).toHaveKey( 'setChannelTopic' );
				expect( oChannel ).toHaveKey( 'unarchiveChannel' );
				expect( oChannel ).toHaveKey( 'kickFromChannel' );
				expect( oChannel ).toHaveKey( 'joinChannel' );
				expect( oChannel ).toHaveKey( 'inviteToChannel' );
				expect( oChannel ).toHaveKey( 'getChannelHistory' );
				expect( oChannel ).toHaveKey( 'getMemento' );

			} );


			it( 'should return the channel list', function(){

				var resp = oChannel.getChannelList(  deserialize = true  );

				expect( resp )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'channels' )
					.toHaveKey( 'ok' );

				expect( resp[ 'channels' ] )
					.toBeArray();

				if( arrayLen( resp[ 'channels' ] ) ){
					
					var sChannelData = resp[ 'channels' ][ 1 ];

					expect( sChannelData )
						.toBeStruct()
						.toHaveLength( 19 )
						.toHaveKey( 'created' )
						.toHaveKey( 'creator' )
						.toHaveKey( 'id' )
						.toHaveKey( 'is_archived' )
						.toHaveKey( 'is_channel' )
						.toHaveKey( 'is_general' )
						.toHaveKey( 'is_member' )
						.toHaveKey( 'is_mpim' )
						.toHaveKey( 'is_org_shared' )
						.toHaveKey( 'is_private' )
						.toHaveKey( 'is_shared' )
						.toHaveKey( 'members' )
						.toHaveKey( 'name' )
						.toHaveKey( 'name_normalized' )
						.toHaveKey( 'num_members' )
						.toHaveKey( 'previous_names' )
						.toHaveKey( 'purpose' )
						.toHaveKey( 'topic' )
						.toHaveKey( 'unlinked' );

					expect( sChannelData[ 'created' ] )
						.toBeString();
					expect( sChannelData[ 'creator' ] )
						.toBeString();
					expect( sChannelData[ 'id' ] )
						.toBeString();
					expect( sChannelData[ 'is_archived' ] )
						.toBeString();
					expect( sChannelData[ 'is_channel' ] )
						.toBeString();
					expect( sChannelData[ 'is_general' ] )
						.toBeString();
					expect( sChannelData[ 'is_member' ] )
						.toBeString();
					expect( sChannelData[ 'is_mpim' ] )
						.toBeString();
					expect( sChannelData[ 'is_org_shared' ] )
						.toBeString();
					expect( sChannelData[ 'is_private' ] )
						.toBeString();
					expect( sChannelData[ 'is_shared' ] )
						.toBeString();
					expect( sChannelData[ 'members' ] )
						.toBeArray();
					expect( sChannelData[ 'name' ] )
						.toBeString();
					expect( sChannelData[ 'name_normalized' ] )
						.toBeString();
					expect( sChannelData[ 'num_members' ] )
						.toBeString();
					expect( sChannelData[ 'previous_names' ] )
						.toBeArray();
					expect( sChannelData[ 'purpose' ] )
						.toBeStruct();
					expect( sChannelData[ 'topic' ] )
						.toBeStruct();
					expect( sChannelData[ 'unlinked' ] )
						.toBeString();

				}

			} );

		} );


		describe( 'Chat component', function(){

			it( 'should return the correct object', function(){

				expect( oChat ).toBeInstanceOf( 'methods.chat' );
				expect( oChat ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oChat.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oChat ).toHaveKey( 'init' );
				expect( oChat ).toHaveKey( 'deleteChat' );
				expect( oChat ).toHaveKey( 'meMessage' );
				expect( oChat ).toHaveKey( 'postMessage' );
				expect( oChat ).toHaveKey( 'postEphemeral' );
				expect( oChat ).toHaveKey( 'unfurl' );
				expect( oChat ).toHaveKey( 'updateMessage' );
				expect( oChat ).toHaveKey( 'getMemento' );

			} );


			it( 'should post and update a message', function(){

				var postResp = oChat.postMessage(
					channel     = variables.slackInfo[ 'testChannel' ],
					text        = 'Test message #randRange( 1, 100 )#',
					deserialize = true
				);

				var updateResp = oChat.updateMessage(
					channel = variables.slackInfo[ 'testChannel' ],
					text    = 'Updated test message #randRange( 1, 100 )#',
					ts      = postResp[ 'ts' ]
				);

			} );


			it( 'should post an ephemeral message', function(){

				var response = oChat.postEphemeral(
					channel     = variables.slackInfo[ 'testChannel' ],
					text        = 'Ephemeral message text from me to @monkehworks',
					user        = variables.slackInfo[ 'userId' ],
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'message_ts' );

			} );


		} );


		describe( 'Dialog component', function(){

			it( 'should return the correct object', function(){

				expect( oDialog ).toBeInstanceOf( 'methods.dialog' );
				expect( oDialog ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oDialog.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oDialog ).toHaveKey( 'init' );
				expect( oDialog ).toHaveKey( 'openDialog' );
				expect( oDialog ).toHaveKey( 'getMemento' );

			} );


			it( 'should open a dialog with the user', function(){

				var dialogJSON = {
					"callback_id" : "ryde-46e2b0",
					"title"       : "Request a Ride",
					"submit_label": "Request",
					"elements"    : [
						{
							"type"        : "text",
							"label"       : "Pickup Location",
							"name"        : "loc_origin"
						},
						{
							"type"        : "text",
							"label"       : "Dropoff Location",
							"name"        : "loc_destination"
						}
					]
				};

				var strJSON = serializeJSON( dialogJSON );

				var resp = oDialog.openDialog(
					dialog      = strJSON,
					trigger_id  = '13345224609.738474920.8088930838d88f008e0',
					deserialize = true
				);

			} );

		} );

		describe( 'Emoji component', function(){

			it( 'should return the correct object', function(){

				expect( oEmoji ).toBeInstanceOf( 'methods.emoji' );
				expect( oEmoji ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oEmoji.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oEmoji ).toHaveKey( 'init' );
				expect( oEmoji ).toHaveKey( 'getEmojiList' );
				expect( oEmoji ).toHaveKey( 'getMemento' );

			} );

			it( 'should return emoji list info', function(){

				var response = oEmoji.getEmojiList( deserialize = true );

				expect( response )
					.toBeStruct()
					.toHaveLength( 3 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'emoji' )
					.toHaveKey( 'cache_ts' );

			} );

		} );

		describe( 'Permissions component', function(){

			it( 'should return the correct object', function(){

				expect( oPermissions ).toBeInstanceOf( 'methods.permissions' );
				expect( oPermissions ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oPermissions.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oPermissions ).toHaveKey( 'init' );
				expect( oPermissions ).toHaveKey( 'getAppPermissionsInfo' );
				expect( oPermissions ).toHaveKey( 'appPermissionsRequest' );
				expect( oPermissions ).toHaveKey( 'getMemento' );

			} );


			it( 'should return app permissions', function(){

				var response = oPermissions.getAppPermissionsInfo( deserialize = true );

				expect( response )
					.toBeStruct();

			} );


		} );

		describe( 'Team component', function(){

			it( 'should return the correct object', function(){

				expect( oTeam ).toBeInstanceOf( 'methods.team' );
				expect( oTeam ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oTeam.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oTeam ).toHaveKey( 'init' );
				expect( oTeam ).toHaveKey( 'getTeamProfile' );
				expect( oTeam ).toHaveKey( 'getMemento' );

			} );


			it( 'should get a team profile', function(){

				var response = oTeam.getTeamProfile(
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'profile' );

			} );


		} );


		describe( 'User component', function(){

			it( 'should return the correct object', function(){

				expect( oUser ).toBeInstanceOf( 'methods.user' );
				expect( oUser ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oUser.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 6 );

				expect( sMemento ).toHaveKey( 'accessToken' );
				expect( sMemento ).toHaveKey( 'baseURL' );
				expect( sMemento ).toHaveKey( 'botAccessToken' );
				expect( sMemento ).toHaveKey( 'clientID' );
				expect( sMemento ).toHaveKey( 'clientSecret' );
				expect( sMemento ).toHaveKey( 'verificationToken' );

				expect( sMemento[ 'accessToken' ] )
					.toBeString();
				expect( sMemento[ 'baseURL' ] )
					.toBeString();
				expect( sMemento[ 'botAccessToken' ] )
					.toBeString();
				expect( sMemento[ 'clientID' ] )
					.toBeString();
				expect( sMemento[ 'clientSecret' ] )
					.toBeString();
				expect( sMemento[ 'verificationToken' ] )
					.toBeString();

			} );

			it( 'should have the correct methods', function() {

				expect( oUser ).toHaveKey( 'init' );
				expect( oUser ).toHaveKey( 'getUserIdentity' );
				expect( oUser ).toHaveKey( 'getUserInfo' );
				expect( oUser ).toHaveKey( 'getUserList' );
				expect( oUser ).toHaveKey( 'getUserPresence' );
				expect( oUser ).toHaveKey( 'setUserPresence' );
				expect( oUser ).toHaveKey( 'getUserProfile' );
				expect( oUser ).toHaveKey( 'setUserProfile' );
				expect( oUser ).toHaveKey( 'getMemento' );

			} );


			it( 'should get a users profile', function(){

				var response = oUser.getUserProfile(
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'profile' );

			} );


			it( 'should get a users presence', function(){

				var response = oUser.getUserPresence(
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 7 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'presence' )
					.toHaveKey( 'online' )
					.toHaveKey( 'auto_away' )
					.toHaveKey( 'manual_away' )
					.toHaveKey( 'connection_count' )
					.toHaveKey( 'last_activity' );

			} );

			it( 'should set a users presence', function(){

				var response = oUser.setUserPresence(
					presence    = 'auto',
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 1 )
					.toHaveKey( 'ok' );

			} );


			it( 'should list all users', function(){

				var response = oUser.getUserList( deserialize = true );

				expect( response )
					.toBeStruct()
					.toHaveLength( 3 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'members' )
					.toHaveKey( 'cache_ts' );

			} );

			it( 'should return user information', function(){

				var response = oUser.getUserInfo(
					user        = variables.slackInfo[ 'userId' ],
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'user' );

			} );

			it( 'should return user identity', function(){

				var response = oUser.getUserIdentity(
					deserialize = true
				);

				expect( response )
					.toBeStruct()
					.toHaveLength( 2 )
					.toHaveKey( 'ok' )
					.toHaveKey( 'user' );

			} );


		} );

	}
	
}
