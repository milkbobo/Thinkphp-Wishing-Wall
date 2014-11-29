<?php
/*
 * 后台登陆控制器
 * 
 */
Class LoginAction extends Action{
	public function index(){
		$this->display();
	}
	
	public function login(){
		if (!IS_POST) halt('页面不存在3');
// 		if(I('code','','md5')!=session('verify')){
// 			$this->error('验证码错误');
// 		}
		$username=I('username');
		$pwd=I('password','','md5');
		$user = M('user')->where(array('username'=>$username))->find();
		if(!$user || $user['password'] != $pwd){
			$this->error('账号或密码错误！');
			
		}
		if($user['lock']) $this->error('用户被锁了');
		$data=array(
			'id'=>$user['id'],
			'logintime'=>time(),
			'loginip'=>get_client_ip(),	
		);
		M('user')->save($data);
		session(C('USER_AUTH_KEY'),$user['id']);
		session('username',$user['username']);
		session('logintime',date('Y-m-d H:i:s',$user['logintime']));
		session('loginip',$user['loginip']);
		
		//超级管理员识别
		if ($user['username'] == C('RBAC_SUPERADMIN')){
			session(C('ADMIN_AUTH_KEY'),true);
		}
		//读取用户权限
		import('ORG.Util.RBAC');
		RBAC::saveAccessList();
		p($_SESSION);die();
		$this->redirect('Admin/Index/index');
	}
	
	public function verify(){
		import('ORG.Util.Image');
		Image::buildImageVerify(1,1,'png');
	}
}


?>