#ifndef __LOGIN__
#define __LOGIN__

module Login
{
	enum ErrorCode
	{
		Success = 0,				// 成功
		Failure,					// 失败(未知原因)
		AccountExist,				// 用户名已经存在
		PasswordError,				// 用户名或密码错误
		StateError,					// 状态错误，重新登录
		AccountNotExist,			// 用户不存在
	};


	// 注册请求数据
	struct RegReqData
	{
		string strAccount;
		string strPhone;
		string strDevice;
		string strSalt;
		string strVerifier;
	};

	// 注册返回数据
	struct RegRspData
	{
		ErrorCode ret;				// 0:成功
	};

	struct LoginWithTokenReqData
	{
		string strToken;	// token
		string strDevice;	// 当前设备码
	};

	struct LoginReqData
	{
		string strToken;		
		string strUserName;
		string strPassword;
		string strDevice;		// 设备号
	};

	struct LoginRspData
	{
		ErrorCode ret;
		string strToken;
		string strSession;
	};

	struct LogoutRspData
	{
		ErrorCode ret;				// 0:成功
	};

	struct GetVerifyInfoReqData
	{
		string strAccount;
		string strA;	// 随机字符串
		string strDevice;
	};

	struct GetVerifyInfoRspData
	{
		ErrorCode ret;
		string strSalt;		// 盐
		string strB;		// 随机字符串
	};

	struct LoginVerifyReqData
	{
		string strAccount;
		string strM1;
	};

	interface ILogin
	{
		// 注册
		void Register(RegReqData req, out RegRspData rsp);
		
		// 登陆(接口废弃, 仅作测试用)
		void Login(LoginReqData req, out LoginRspData rsp);

		void LoginWithToken(LoginWithTokenReqData req, out LoginRspData rsp);

		void GetVerifyInfo(GetVerifyInfoReqData req, out GetVerifyInfoRspData rsp);

		void LoginVerify(LoginVerifyReqData req, out LoginRspData rsp);

		void Logout(out LogoutRspData rsp);
	};
};


#endif
